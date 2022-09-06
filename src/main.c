#include <gb/gb.h>  
#include <stdio.h>
#include "data/cross.c" 

#include "data/background1.c"
#include "data/backgroundtiles.c"

#include "data/marstiles.c"
#include "data/marsbackground.c"

#include "data/background2.c"
#include "data/backgroundtiles2.c"

#include "data/background3.c"
#include "data/background4.c"

#include "data/logo0_data.c"
#include "data/logo0_map.c"

#include "data/underscore.c"


#include "data/windowmap.c"
#include "data/healthblock.c"
#include "data/enemy.c"
#include "data/enemy1.c"
#include "data/largeenemies.c"

#include "data/projectile.c"
#include "data/projectiles.c"

#include "data/pickup.c"
#include "data/pickups.c"

#include <gbdk/font.h>
#include <rand.h>

#include <gbdk/bcd.h>

#include "data/player1.c"

#include "data/explosions.c"
#include "data/ex/ex1.c"

#include "data/ex/ex2.c"
#include "data/ex/ex3.c"

#include "data/menupicker.c"

/*
TODO: 

- start ja select pelatessa
- vertaa joydata & prevjoydata, ja tunnista milloin on painettu pohjaan
- start korvaa window sisällön
	- paused press 
	- start to continue

- äänet
	- ampumiseen, pitää korjata 
	- pickup
	- shield kun täysi
	- eri ääni oma damage ja viholliset


*/


//global variables
const uint8_t BLANKSIZE = 3;
const unsigned char BLANK[3] = {0x25, 0x26, 0x27}; 
const unsigned char EMPTYSPRITE = 0x50;


//bigger number for slower hp gain on enemies during gameplay
// hp addition is calculated by difficulty % scale, difficulty increases by one every skill
uint16_t HPSCALESPEED = 10; 
uint16_t ATTACKSCALESPEED = 20; //same as above

struct Enemy enemies[5];
const uint8_t ENEMYCOUNT = 5;


//enemy spawn positions
const uint8_t xSpawnPositions[8] = {
	0, 96, 176,
	0 , 176,
	0, 96, 176
};
const uint8_t ySpawnPositions[8] = {
	0, 0, 0,
	92 ,92,
	160, 160, 160
};


struct Projectile projectiles[5];
//max supported projectiles on screen at once
const uint8_t PROJECTILECOUNT = 5;
uint8_t oldestProjectile = 0;
uint8_t fireCooldown = 0;


const uint8_t PLAYERSIZE = 16;


int8_t xDir = 0;
int8_t yDir = -1;
int8_t xSpeed = 0;
int8_t ySpeed = 0;

//subpixel positions
uint16_t playerX = 80<<5;
uint16_t playerY = 80<<5;
//on screen positions
uint8_t playerDrawX = 80;
uint8_t playerDrawY = 80;

//background position
int16_t bgX = 0;
int16_t bgY = 0;

uint8_t joydata = 0;
uint8_t prevJoyData = 0;


uint8_t hull;
const int8_t maxHull = 100;

int8_t shield;
const int8_t maxShield = 100;

font_t min_font;

int16_t xOverflow = 0;
int16_t yOverflow = 0;


//counter to alternate which enemy collisions are calculated for each frame
//loops through every enemy ~11x per second
uint8_t enemyCollisionCount = 0;

//constant for scaling splash damage dropoff, (bit shifting value left) 0 for linear (-1dmg/px), 1 for multiplied by 2 (-2dmg/px), 2 for -4dmg/px
const uint8_t SPLASHDROPOFF = 1;

const uint8_t MAXGUNLEVEL = 1; //0&1
uint8_t gunLevel = 0;
uint8_t currentGun = 0;

uint8_t missiles = 0;
BCD MISSILES = MAKE_BCD(0);

//ugly references directly to vram locations, where gun icons are loaded to
unsigned char gunMap[] = {0x53, 0x5b, 0x61};

struct Pickup pickup;


uint16_t score = 0;
BCD SCORE = MAKE_BCD(00000);
BCD INCREMENT = MAKE_BCD(00001);


const uint8_t exCount = 4;
uint8_t oldestEx = 0;
struct Explosion explosions[4];
const uint8_t EXPLFRAMETIME = 4;
const uint8_t exTileCount = 3;
uint8_t exTiles[3] = {0x80, 0x90, 0xa0}; //vram hex addresses for first tile in animation

const uint8_t AUXTICKFREQUENCY = 1; //init value for below...
uint8_t auxTick = 1; //used to stagger different actions to different frames to save resources


unsigned char* collisionTiles;


//spawn tables go here
uint16_t difficulty = 0;


//called during gameplay on vertical line ~126 to hide sprites under hud
void interruptLCD()
{
    HIDE_SPRITES;
}

//sets 0-5 blocks as the healthbar on hud
//row used to define which row on the window is used, as this updates hull & shield
//values
void setHealthBar(uint8_t row, uint8_t hp) {

	if (hp >= 80) {
		unsigned char blockmap[] = {0x50,0x50,0x50, 0x50, 0x50};
		set_win_tiles(5,row,5,1,blockmap);
		return;
	}
	if (hp >= 60) {
		unsigned char blockmap[] = {0x50,0x50,0x50, 0x50, 0x00};
		set_win_tiles(5,row,5,1,blockmap);
		return;
	}
	if (hp >= 40) {
		unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
		set_win_tiles(5,row,5,1,blockmap);
		return;
	}
	if (hp >= 20) {
		unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
		set_win_tiles(5,row,5,1,blockmap);
		return;
	}
	if (hp >= 1) {
		unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
		set_win_tiles(5,row,5,1,blockmap);
		return;
	}
	unsigned char blockmap[] = {0x00,0x00,0x00,0x00,0x00};
	set_win_tiles(5,row,5,1,blockmap);
	return;

}

//update score value in hud (window)
void updateScore() {
	uint8_t len = 0;
	unsigned char buf[10];
	len = bcd2text(&SCORE, 0x01, buf);
	set_win_tiles(15, 1, 5, 1, buf+3);
}

//increment/decrement missile count & update hud accordingly
void updateMissileCount(int8_t amount) {
	if (amount == -1) {
		missiles--;
		bcd_sub(&MISSILES, &INCREMENT);
	}
	else {
		for(int8_t i=0; i<amount;i++) {
			++missiles;
			bcd_add(&MISSILES, &INCREMENT);
		}
	}
	uint8_t len = 0;
	unsigned char buf[10];
	len = bcd2text(&MISSILES, 0x01, buf);
	set_win_tiles(18, 0, 2, 1, buf+6);

}

//increment both score and score label (bcd)
void incrementScore() {
	score += 1;
	bcd_add(&SCORE, &INCREMENT);
}


//parse dpad input & update direction holder vars 
// also orient player sprites correctly toward the direction
void updateDirection() {

	//4 main directions
	if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
		xDir = 1;
		yDir = 0;
	}
	if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
		xDir = -1;
		yDir = 0;
	}
	if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
		xDir = 0;
		yDir = -1;
	}
	if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
		xDir = 0;
		yDir = 1;
	}

	//diagonals
	if ((joydata & J_UP) && (joydata & J_RIGHT)) {
		xDir = 1;
		yDir = -1;
	}	
	if ((joydata & J_UP) && (joydata & J_LEFT)) {
		xDir = -1;
		yDir = -1;
	}			
	if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
		xDir = 1;
		yDir = 1;
	}			
	if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
		xDir = -1;
		yDir = 1;
	}	



	if (xDir == 0 && yDir == 0) {
		return;
	}

	//uint8_t direction = 0;



	if (auxTick == 0) {
		if (xDir == 0 && yDir > 0) {
			set_sprite_tile(0, 0);
			set_sprite_tile(1, 2);
			set_sprite_prop(0, S_FLIPY); 
			set_sprite_prop(1, S_FLIPY); 
		}
		else if (xDir == 0 && yDir < 0) {
			set_sprite_tile(0, 0);
			set_sprite_tile(1, 2);
			set_sprite_prop(0, 0); 
			set_sprite_prop(1, 0); 
		}
		else if (xDir > 0 && yDir == 0) {
			set_sprite_tile(0, 4);
			set_sprite_tile(1, 6);
			set_sprite_prop(0, 0); 
			set_sprite_prop(1, 0); 
		}
		else if (xDir < 0 && yDir == 0) {
			set_sprite_tile(0, 4);
			set_sprite_tile(1, 6);
			set_sprite_prop(0, S_FLIPX); 
			set_sprite_prop(1, S_FLIPX); 
		}
		else if (xDir > 0 && yDir < 0) {
			set_sprite_tile(0, 8);
			set_sprite_tile(1, 10);
			set_sprite_prop(0, 0); 
			set_sprite_prop(1, 0); 
		}
		else if (xDir > 0 && yDir > 0) {
			set_sprite_tile(0, 8);
			set_sprite_tile(1, 10);
			set_sprite_prop(0, S_FLIPY); 
			set_sprite_prop(1, S_FLIPY); 
		}	
		else if (xDir < 0 && yDir > 0) {
			set_sprite_tile(0, 8);
			set_sprite_tile(1, 10);
			set_sprite_prop(0, S_FLIPY | S_FLIPX); 
			set_sprite_prop(1, S_FLIPY | S_FLIPX); 
		}	
		else { // if (xDir < 0 && yDir < 0) {
			set_sprite_tile(0, 8);
			set_sprite_tile(1, 10);
			set_sprite_prop(0, S_FLIPX); 
			set_sprite_prop(1, S_FLIPX); 
		}
	}


}

//util functions for clamping integers to a range and calculating abs
inline int8_t clamp( int8_t value, int8_t min, int8_t max )
{
    return (value < min) ? min : (value > max) ? max : value;
}
inline uint8_t uClamp( uint8_t value, uint8_t min, uint8_t max )
{
    return (value < min) ? min : (value > max) ? max : value;
}
inline uint16_t u16Clamp( uint16_t value, uint16_t min, uint16_t max )
{
    return (value < min) ? min : (value > max) ? max : value;
}
inline int16_t i16Clamp( int16_t value, int16_t min, int16_t max )
{
    return (value < min) ? min : (value > max) ? max : value;
}
inline int8_t abs(int8_t value) {
	if (value >= 0) return value;
	else return - value;
}
inline uint16_t i16abs(int16_t value) {
	if (value >= 0) return value;
	else return - value;
}

//sets sound registers according to sound type
void playSound(uint8_t type) {
	if (type == 20) { //singlegun
		NR10_REG = 0x00;
		NR11_REG = 0x81;
		NR12_REG = 0x43;
		NR13_REG = 0X00;//0x6D;
		NR14_REG = 0x86;
		return;
	}
	if (type == 23) {
		NR10_REG = 0x00;
		NR11_REG = 0x81;
		NR12_REG = 0x53;
		NR13_REG = 0X00;//0x6D;
		NR14_REG = 0x86;
	}
	if (type == 26) {
		NR10_REG = 0x00;
		NR11_REG = 0x89;
		NR12_REG = 0x55;
		NR13_REG = 0x70;//0Xbe;//0x6D;
		NR14_REG = 0x84;
	}
	if (type == 0) {  // explosion
		NR41_REG = 0x20;  
		NR42_REG = 0xa2;//0xa3;  
		NR43_REG = 0x57;  
		NR44_REG = 0x80;  

	}

	//20, a3, 37/47/57, 80
	
}

//reinitializes fonts, required after clearing vram
void initFont() {
	font_init();
	//font_color(0, 0);
    min_font = font_load(font_min); // 36 tiles of characters
    font_set(min_font);
}

//clears window (hud), but doesn't touch vram
void clearWindow() {
	HIDE_WIN;
	move_win(8,126);
	for (uint8_t i=0; i < 18; ++i) {
		set_win_tiles(1,i,20,1,emptyRow);
	}
	SHOW_WIN;
}

//reinitializes hud window
//used after a pause has ended and when first initializing hud
void recoverHud() {
	HIDE_WIN;
	move_win(7,126);
	set_win_tiles(1,0,4,1,shieldlabel);
	set_win_tiles(1,1,4,1,hullabel);
	set_win_tiles(10, 0,4,1,weaponlabel);
	set_win_tiles(10, 1,4,1,scorelabel);
	setGunIcon();
	updateScore();
	updateMissileCount(missiles);
	set_win_tiles(17, 0,1,1,gunMap+2);

	SHOW_WIN;
}

//clears window & background tiles and background tiles from vram
void clearScreen() {
	HIDE_WIN;
	HIDE_BKG;
	for (uint8_t i=0; i < 18; ++i) {
    	set_win_tiles(1,i,20,1,emptyRow);
		set_bkg_tiles(1,i,20,1,emptyRow);
	}
	for (uint8_t j=0; j < 40; ++j) {
		set_sprite_tile(j, 0x7f);
	}

	SHOW_WIN;
	SHOW_BKG;

}

//inits the enemies array and loads all enemy sprites to vram
void initEnemies(uint8_t loadSprites) {

	if (loadSprites) {
		//loading enemy sprites to vram
		set_sprite_data(0x40, 13, enemy1);
		set_sprite_data(0x50, 32, largeenemies);
	}

	struct Enemy *eptr = enemies;
	//initializing enemy list with structs
  	for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {

		uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) ENEMYOPTIONCOUNT;
		//printf("%d\n", enemyInd);
		(*eptr) = enemyOptions[enemyInd];

		uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
		eptr->x = xSpawnPositions[posIndex];
		eptr->y = ySpawnPositions[posIndex];

		if (eptr->spriteCount == 1) {
			set_sprite_tile(10+ (i<<1), eptr->sprite0);
			move_sprite(10+ (i<<1), eptr->x, eptr->y);
		}
		else {
			set_sprite_tile(10+ (i<<1), eptr->sprite0);
			move_sprite(10+ (i<<1), eptr->x, eptr->y);

			set_sprite_tile(10+ (i<<1) +1, eptr->sprite1);
			move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
		}


		eptr++;
  	}

}

//similar to initEnemies, but instead reinitializes a single enemy from the array
void initEnemy(uint8_t i) {
	//struct Enemy *eptr = enemies + i;

  	if (enemies[i].alive == 0) {

		uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) ENEMYOPTIONCOUNT;
		enemies[i] = enemyOptions[enemyInd];

		uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
		enemies[i].x = xSpawnPositions[posIndex];
		enemies[i].y = ySpawnPositions[posIndex];
		enemies[i].hp += difficulty % HPSCALESPEED;
		enemies[i].damage += difficulty & ATTACKSCALESPEED;
		difficulty += 1;

		if (enemies[i].spriteCount == 1) {
			set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
			//move_sprite(10+ (i<<1), enemies[i].x, enemies[i].y);
		}
		else {
			set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
			//move_sprite(10+ (i<<1), enemies[i].x, enemies[i].y);

			set_sprite_tile(10+ (i<<1) +1, enemies[i].sprite1);
			//move_sprite(10+ (i<<1) +1, enemies[i].x, enemies[i].y);
		}
	}

}

//updates enemy speeds (toward player) and positions
//called every frame
//also hides enemies that are off screen and deletes ones that are even further away
void updateEnemyPositions() {
	
	for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
		if (!enemies[i].alive) {
			continue;
		}
		enemies[i].x -= xOverflow;
		enemies[i].y -= yOverflow;


		if (abs(enemies[i].x - playerDrawX) > 8) {
			if (enemies[i].x < playerDrawX) {
				enemies[i].xSpeed += enemies[i].accel;
			}
			else {
				enemies[i].xSpeed -= enemies[i].accel;
			}
		}
		else {
			if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
			if (enemies[i].xSpeed < 0) enemies[i].xSpeed++;

		}
		if (abs(enemies[i].y - playerDrawY) > 8) {
			if (enemies[i].y < playerDrawY) {
				enemies[i].ySpeed += enemies[i].accel;
			}
			else {
				enemies[i].ySpeed -= enemies[i].accel;
			}
		}
		else {
			if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
			if (enemies[i].ySpeed < 0) enemies[i].ySpeed++;
		}

		//clamp to max speed
		enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
		enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);

		
		enemies[i].xReserve += enemies[i].xSpeed;
		enemies[i].yReserve += enemies[i].ySpeed;
		

		
		if (enemies[i].xReserve >> 3 > 0) {
			int8_t xMovement = enemies[i].xReserve >> 3;
			enemies[i].x += xMovement;
			enemies[i].xReserve -=  xMovement << 3;

		}
		else if ((-enemies[i].xReserve) >> 3 > 0){
			int8_t xMovement = -((-enemies[i].xReserve) >> 3);
			enemies[i].x += xMovement;
			enemies[i].xReserve +=  (-xMovement) << 3;
		}
		
		if (enemies[i].yReserve >> 3 > 0) {
			int8_t yMovement = enemies[i].yReserve >> 3;
			enemies[i].y += yMovement;
			enemies[i].yReserve -=  yMovement << 3;
		}
		else if ((-enemies[i].yReserve) >> 3 > 0){
			int8_t yMovement = -((-enemies[i].yReserve) >> 3);
			enemies[i].y += yMovement;
			enemies[i].yReserve +=  (-yMovement) << 3;
		}



		if (auxTick == 1) {
			//setting direction of sprites
			if (enemies[i].spriteCount == 1) {
				move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
				if (enemies[i].xSpeed >= 0) {
					set_sprite_prop(10+(i<<1), 0);
				}
				else {
					set_sprite_prop(10+(i<<1), S_FLIPX);
				}
			}
			else {

				if (enemies[i].xSpeed >= 0) {
					set_sprite_prop(10+(i<<1), 0);
					set_sprite_prop(10+(i<<1)+1, 0);
					move_sprite(10+ (i<<1), enemies[i].x , enemies[i].y + 8);
					move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
				}
				else {
					set_sprite_prop(10+(i<<1), S_FLIPX);
					set_sprite_prop(10+(i<<1)+1, S_FLIPX);
					move_sprite(10+ (i<<1), enemies[i].x +8, enemies[i].y + 8);
					move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
				}

			}
		}


	}


	uint8_t i = enemyCollisionCount;
	//hide if not on screen, this must be done as the background loops around, and the enemy sprites shouldn't!
	if (enemies[i].alive) {
		if (enemies[i].visible == 1) {
			if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
				enemies[i].visible = 0;
				set_sprite_tile(10+(i<<1), 0x7f);
				set_sprite_tile(10+(i<<1)+1, 0x7f);
			} 
		}
		else {
			if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
				enemies[i].visible = 1;
				set_sprite_tile(10+(i<<1), enemies[i].sprite0);
				if (enemies[i].spriteCount == 2) {
					set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
				}
			}
			else if (enemies[i].x < -100 || enemies[i].x > 272 || enemies[i].y < -100 || enemies[i].y > 252) {
				enemies[i].alive = 0;
				set_sprite_tile(10+(i<<1), 0x7f);
				set_sprite_tile(10+(i<<1)+1, 0x7f);
				initEnemy(i);
			}
		}
	}


}

//checks background collision, moves player and repositions sprites accordingly
void move() {

	//gas 
	if (joydata & J_A) {
		xSpeed += xDir + xDir + xDir;
		ySpeed += yDir + yDir + yDir;
	}
	

	xSpeed = clamp(xSpeed, -100, 100);
	ySpeed = clamp(ySpeed, -100, 100);

	xOverflow = 0;
	yOverflow = 0;

	//x direction collision detections first

	//sprite center by default
	uint8_t xCollisionPoint = playerDrawX; 

	if (xSpeed > 0) {
		xCollisionPoint = playerDrawX +8; //right edge
	}
	if (xSpeed < 0) {
		xCollisionPoint = playerDrawX -8; //left edge
	}


	int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;


	//-12 as y coordinate is 0 at bottom edge of 16 high sprite & this sprite is only 8 high and pinned to top
	uint8_t bgindY = ((playerDrawY + bgY) >> 3)%32; 


	uint16_t ind = 32*bgindY + bgindX;
	uint8_t result = 1; // 0 incase of clear path, 1 for blocked
	for (uint8_t i=0; i<BLANKSIZE; i++) {
		if ((*(collisionTiles+ind)) == BLANK[i] ) {
			result = 0;
			break;
		}
	}

	if (result == 0) {
		playerX+=xSpeed;

		uint16_t limitedPlayerX = u16Clamp(playerX, 68<<5, 92<<5);//0->160, with 8 px margin for left edge & 50px for the edges
		
		xOverflow = (playerX - limitedPlayerX);
		if (xOverflow >= 0) {
			xOverflow = xOverflow >> 5;
		}
		else {
			xOverflow = -((-xOverflow) >> 5);
		}
		bgX += xOverflow;
		playerX = limitedPlayerX;
		playerDrawX=playerX >> 5;



		//printf("%d\n", bgX);

	}
	else {
		xSpeed = 0;
	}
	

	
	//y direction collision detections second

	//sprite center by default
	uint8_t yCollisionPoint = playerDrawY; 

	if (ySpeed > 0) {
		yCollisionPoint = playerDrawY +8; //bottom edge
	}
	if (ySpeed < 0) {
		yCollisionPoint = playerDrawY -8; //top edge, 
	}

	
	bgindX = ((playerDrawX + bgX) >> 3)%32;


	bgindY = ((yCollisionPoint + bgY) >> 3)%32; 


	ind = 32*bgindY + bgindX;
	result = 1;
	for (uint8_t j=0; j<BLANKSIZE; j++) {
		if ((*(collisionTiles+ind)) == BLANK[j] ) {
			result = 0;
			break;
		}
	}

	if (result == 0) {
		playerY += ySpeed;

		uint16_t limitedPlayerY = u16Clamp(playerY, 48<<5, 78<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
		
		yOverflow = (playerY - limitedPlayerY);
		if (yOverflow >= 0) {
			yOverflow = yOverflow >> 5;
		}
		else {
			yOverflow = -((-yOverflow) >> 5);
		}
		bgY += yOverflow;
		playerY = limitedPlayerY;
		playerDrawY=playerY >> 5;


	}
	else {
		ySpeed = 0;
	}

	if (xDir >= 0) {
		move_sprite(0, playerDrawX , playerDrawY + 8);

		move_sprite(1, playerDrawX +8, playerDrawY +8);
	}
	else {
		move_sprite(1, playerDrawX , playerDrawY +8);

		move_sprite(0, playerDrawX +8, playerDrawY +8);
	}


	
	if (bgX >= 256) {
		bgX = bgX % 256;
	}
	if (bgX < 0) {
		bgX = 255 - (bgX % 256);
	}
	if (bgY >= 256) {
		bgY = bgY % 256;
	}
	if (bgY < 0) {
		bgY = 255 - (bgY % 256);
	}

	move_bkg(bgX, bgY);

	//bleed speed toward zero to deaccelerate
	if (ySpeed > 0) ySpeed--;
	if (ySpeed < 0) ySpeed++;
	if (xSpeed > 0) xSpeed--;
	if (xSpeed < 0) xSpeed++;

	
	
}

//decrement player shield or hull if necessary
void takeDamage(int16_t amount) {
	if (amount > shield) {
		shield = 0;
		hull -= (amount - shield);
	}
	else {
		shield -= amount;
	}
}

//initializes a pickup (ammo, upgrade hp)
void spawnPickup(int16_t x, int16_t y) {
	uint8_t spawn = ((uint8_t)rand()) % (uint8_t) 8;
	if (spawn == 0) {
		uint8_t type = ((uint8_t)rand()) % (uint8_t) 3;
		if (type == 0) {
			pickup = health;
		}
		else if (type == 1 && gunLevel < MAXGUNLEVEL) {
			pickup = upgrade;
		}
		else {
			pickup = ammo;
		}
		pickup.active = 1;
		
		pickup.x = x;
		pickup.y = y;
		
		set_sprite_tile(3, pickup.tile); //0x7f

	}
}

//deletes enemy, shows explosion, increments score by 1, etc
void killEnemy(uint8_t i) {
	set_sprite_tile(10+(i<<1), 0x7f);
	set_sprite_tile(10+(i<<1)+1, 0x7f);

	spawnPickup(enemies[i].x, enemies[i].y);

	enemies[i].alive = 0;
	enemies[i].visible = 0;

	playSound(0);
	incrementScore();
	updateScore();

	explosions[oldestEx].visible = 1;
	explosions[oldestEx].x = enemies[i].x;
	explosions[oldestEx].y = enemies[i].y;

	
	uint8_t tileNum = ((uint8_t)rand()) % exTileCount;

	explosions[oldestEx].tile = exTiles[tileNum];
	explosions[oldestEx].frame = 0;
	explosions[oldestEx].frameCounter = 0;

	set_sprite_tile(20 + oldestEx+oldestEx, explosions[oldestEx].tile + (explosions[oldestEx].frame<<1));
	set_sprite_tile(21 + oldestEx+oldestEx, explosions[oldestEx].tile+(explosions[oldestEx].frame<<1) +2);
	//defer these to next frame, to speed things up
	//move_sprite(20 + 2*oldestEx, explosions[oldestEx].x, explosions[oldestEx].y+8);
	//move_sprite(21 + 2*oldestEx, explosions[oldestEx].x+8, explosions[oldestEx].y+8);

	oldestEx++;
	if (oldestEx >= exCount) {
		oldestEx = 0;
	}

}


//checks for enemy-player and enemy-projectile collisions
void checkCollision() {
	//playerDrawX


	//option 1


	struct Enemy *eptr = enemies + enemyCollisionCount;
	uint8_t i = enemyCollisionCount;

	if (eptr->visible && eptr->alive) {

		uint8_t alive = 1;


		if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
			(eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
			if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
				(eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
				
				set_sprite_tile(10+(i<<1), 0x7f);
				set_sprite_tile(10+(i<<1)+1, 0x7f);
				eptr->alive = 0;
				eptr->visible = 0;
				takeDamage(eptr->damage);
				initEnemy(i);
				playSound(0);

				alive = 0;

			}
		}
		

		if (alive) {
			struct Projectile *pptr = projectiles;
			uint8_t j = 0;
			while (j < PROJECTILECOUNT) {
				if (pptr->active) {

					if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
						(eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
						if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
							(eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {

								set_sprite_tile(30+j, 0x7f);
								pptr->active = 0;

								if (pptr->type == 0x2c) { //missile

									int16_t x = eptr->x;
									int16_t y = eptr->y;

									for (uint8_t k=0; k < ENEMYCOUNT;++k) {
										int16_t dmgDropOff = ((i16abs(eptr->x - enemies[k].x) + i16abs(eptr->y - enemies[k].y))<<SPLASHDROPOFF);
										int16_t dmg = pptr->damage - dmgDropOff;
										if (dmg > 0) {
											enemies[k].hp -= dmg;
											if (enemies[k].hp <= 0) {
												killEnemy(k);
												initEnemy(k);
											}
										}
										
									}

								}
								else { //all single target guns
									eptr->hp -= pptr->damage;

									if (eptr->hp <= 0) {

										killEnemy(i);
										initEnemy(i);

									}
								}




						}
					}
				}
				
				j++;
				pptr++;
			}
		}

	}

	if (enemyCollisionCount == 0) {
		enemyCollisionCount = ENEMYCOUNT - 1;
	}
	else {
		enemyCollisionCount--;
	}



}

//updates gun icon to hud
void setGunIcon() {

	if (currentGun == 0) {
		set_win_tiles(15, 0,1,1,gunMap+gunLevel);
	}
	else {
		set_win_tiles(15, 0,1,1,gunMap+2);
	}
}
 
//updates hull & shield values to hull & recovers some shield every frame
inline void updateShieldsAndHull() {
	if (shield < maxShield) {
		shield += 1;
	}
	setHealthBar(1, hull);
	setHealthBar(0, shield);
}

//creates new projectiles
void fire() {

	oldestProjectile += 1;
	if (oldestProjectile >= PROJECTILECOUNT) {
		oldestProjectile = 0;
	}

	if (currentGun == 0) {
		if (gunLevel == 0) {
			projectiles[oldestProjectile] = singleGun;
		}
		else {
			projectiles[oldestProjectile] = doubleGun;
		}
	}
	else if (currentGun == 1) {
		if (missiles == 0) {
			currentGun = 0;
			setGunIcon();
			return;
		}

		projectiles[oldestProjectile] = missile;
		updateMissileCount(-1);

		if (missiles == 0) {
			currentGun = 0;
			setGunIcon();
		}
	}
	projectiles[oldestProjectile].x = playerDrawX;
	projectiles[oldestProjectile].y = playerDrawY;
	projectiles[oldestProjectile].xSpeed = xDir * projectiles[oldestProjectile].speed;
	projectiles[oldestProjectile].ySpeed = yDir * projectiles[oldestProjectile].speed;


	
	if (yDir != 0 && xDir == 0) {
		set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
		if (yDir == 1) {
			set_sprite_prop(30+oldestProjectile, S_FLIPY); 
			projectiles[oldestProjectile].offset = 4;
		}
		else {
			set_sprite_prop(30+oldestProjectile, 0); 
			projectiles[oldestProjectile].offset = 12;
		}
	}
	else if (xDir != 0 && yDir == 0) {
		set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
		if (xDir == 1) {
			set_sprite_prop(30+oldestProjectile, 0);
			projectiles[oldestProjectile].offset = 12;
		}
		else {
			set_sprite_prop(30+oldestProjectile, S_FLIPX); 
			projectiles[oldestProjectile].offset = 12;
		}
	}
	else {
		set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+4);
		if (xDir == 1 && yDir == -1) {
			set_sprite_prop(30+oldestProjectile, 0); //default is right & up
			projectiles[oldestProjectile].offset = 12;
		}
		else if (xDir == 1 && yDir == 1) {
			set_sprite_prop(30+oldestProjectile, S_FLIPY); 
			projectiles[oldestProjectile].offset = 4;
		}
		else if (xDir == -1 && yDir == 1) {
			set_sprite_prop(30+oldestProjectile, S_FLIPY | S_FLIPX);
			projectiles[oldestProjectile].offset = 4;
		}  
		else if (xDir == -1 && yDir == -1) {
			set_sprite_prop(30+oldestProjectile, S_FLIPX); 
			projectiles[oldestProjectile].offset = 12;
		}
	}
	
	fireCooldown = projectiles[oldestProjectile].delay;

	//playSound(projectiles[oldestProjectile].type);



}

//updates projectile positions & deletes them if they are off screen
void moveProjectiles() {
	for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
		if (projectiles[i].active) {
			projectiles[i].x -= xOverflow;
			projectiles[i].y -= yOverflow;

			int16_t newY = projectiles[i].y + projectiles[i].ySpeed;
			int16_t newX = projectiles[i].x + projectiles[i].xSpeed;

			
			projectiles[i].y = newY;
			projectiles[i].x = newX;
			


			move_sprite(30+i, newX +4 , newY + projectiles[i].offset);


			//if (abs(projectiles[i].x - playerDrawX) > 100 || abs(projectiles[i].y - playerDrawY) > 100) {
			if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
				projectiles[i].active = 0;
				set_sprite_tile(30+i, 0x7f);
			}
		
		}
	}
}

//updates pickup positions & checks for playercollision
void tickPickups() {

	if (pickup.active) {
		pickup.x -= xOverflow;
		pickup.y -= yOverflow;
		move_sprite(3, pickup.x + 4, pickup.y + 12);
		if (pickup.visible && auxTick == 1) {

			if (abs(pickup.x - playerDrawX) < 10) {
				if (abs(pickup.y - playerDrawY) < 10) {
					if (pickup.type == 0) { //upgrade
						if (gunLevel < 1) {
							gunLevel += 1;
							setGunIcon();
						}
					}
					if (pickup.type == 1) { //missile ammo
						updateMissileCount(pickup.amount);
					}
					if (pickup.type == 2) {
						if (hull + pickup.amount <= 100) {
							hull += pickup.amount;
						}
						else {
							hull = 100;
						}
					}
					pickup.active = 0;
					set_sprite_tile(3, 0x7f);
				}
			}
			if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
				pickup.visible = 0;
				set_sprite_tile(3, 0x7f);
			}
		}
		else {
			if (pickup.x >= -10 && pickup.x <= 170 && pickup.y >= 0 && pickup.y <= 155) {
				pickup.visible = 1;
				set_sprite_tile(3, pickup.tile);
			}
		}

	}
}

//increments explosion frames
void tickEx() {
	for (uint8_t i = 0; i < exCount; ++i) {
		if (explosions[i].visible) {

			explosions[i].x -= xOverflow;
			explosions[i].y -= yOverflow;
			move_sprite(20 +i+i, explosions[i].x, explosions[i].y+8);
			move_sprite(21 +i+i, explosions[i].x+8, explosions[i].y+8);

			explosions[i].frameCounter++;
			if (auxTick == 0) {
				if (explosions[i].frameCounter > EXPLFRAMETIME) {
					explosions[i].frameCounter = 0;
					explosions[i].frame += 1; 
					if (explosions[i].frame > 3) {
						explosions[i].visible = 0;
						set_sprite_tile(20 + i+i, 0x7f);
						set_sprite_tile(21 + i+i, 0x7f);
					}
					else {
						set_sprite_tile(20 + i+i, explosions[i].tile + (explosions[i].frame *4));
						set_sprite_tile(21 + i+i, explosions[i].tile+(explosions[i].frame *4) +2);
					}
				}
			}
		}
	}
}

//initializes enemies to options array
void initEnemyOptions() {
	enemyOptions[0] = minispike;
	enemyOptions[1] = minibomb;
	enemyOptions[2] = miniship;
	enemyOptions[3] = minibubble;

	enemyOptions[4] = minifighter;
	enemyOptions[5] = shieldship;
	enemyOptions[6] = owl;
	enemyOptions[7] = calvine;
	enemyOptions[8] = xwing;
	enemyOptions[9] = destroyer;
	enemyOptions[10] = doublefuse;

}

//initializes inactive projectile array
void initProjectiles() {
	set_sprite_data(0x20, 17, ProjectileTiles); 

	for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
		projectiles[i].active == 0;	

	}
}

//initializer for rest of game resources
void initGame() {
	HIDE_SPRITES;
	HIDE_WIN;
	HIDE_BKG;


    STAT_REG = 0x45;
    LYC_REG = 0x7e; //line 126
    disable_interrupts();
    add_LCD(interruptLCD);
    enable_interrupts();
    set_interrupts(VBL_IFLAG | LCD_IFLAG);   

	xDir = 0;
	yDir = -1;
	xSpeed = 0;
	ySpeed = 0;


	//subpixel positions
	playerX = 80<<5;
	playerY = 70<<5;
	//on screen positions
	playerDrawX = 80;
	playerDrawY = 70;


	//background position
	bgX = 0;
	bgY = 0;

	//attempting up to 10 times to find a random location on map that is a clear tile
	for (uint8_t i = 0; i < 10; ++i) {
		int16_t backgroundXCandidate = ((int16_t)rand()) % 32;
		int16_t backgroundYCandidate = ((int16_t)rand()) % 32;

		backgroundXCandidate *= 8;
		backgroundYCandidate *= 8;


		
		int16_t bgindX = ((playerDrawX + backgroundXCandidate) >> 3)%32;
		uint8_t bgindY = ((playerDrawY + backgroundYCandidate) >> 3)%32; 


		uint16_t ind = 32*bgindY + bgindX;
		uint8_t result = 1; // 0 incase of clear tile, 1 for blocked
		for (uint8_t i=0; i<BLANKSIZE; i++) {
			if ((*(collisionTiles+ind)) == BLANK[i] ) {
				result = 0;
				break;
			}
		}
		if (!result) { //tile is clear so player can spawn there
			bgX = backgroundXCandidate;
			bgY = backgroundYCandidate;
			break;
		}

	}



	hull = maxHull;
	shield = maxShield;

	DISPLAY_ON;
	SPRITES_8x16;
	set_sprite_data(0, 12, Player1);

	set_sprite_tile(0, 0);
	set_sprite_tile(1, 2);

	//load healthbar block to bkg 
	set_bkg_data(0x50,1,healthblock);



	setHealthBar(1, hull);
	setHealthBar(0, shield);


	
	move_bkg(0,0);

	set_bkg_data(0x51, 18, ProjectileTiles);






	SCORE = MAKE_BCD(00000);




	missiles = 0;
	MISSILES = MAKE_BCD(0);


	recoverHud();


	//init pickup, not active yet, so setting empty tile
	pickup = upgrade;//upgrade;
	//init pickup upgrade/missile, using tile #3, 0x7f is an empty tile
	set_sprite_data(0x70, 6, Pickups);
	set_sprite_tile(3, 0x7f); //0x7f
	move_sprite(3, pickup.x + 4, pickup.y + 12);

	for (uint8_t i = 0; i<exCount; ++i) {
		explosions[i] = ex;
	}
	set_sprite_data(exTiles[0], 16, Ex1);
	set_sprite_data(exTiles[1], 16, Ex2);
	set_sprite_data(exTiles[2], 16, Ex3);


	SHOW_SPRITES;
	SHOW_WIN;
	SHOW_BKG;

}

//pauses game until start is pressed & updates hud accordingly
void doPause() {
	disable_interrupts();
	SHOW_SPRITES;
	clearWindow();

	set_win_tiles(7, 0, 6, 1, pauselabel);

	waitpad(J_START);
	waitpadup();
	recoverHud();
	enable_interrupts();
}




//displays score screen 
void showScoreScreen() {
	HIDE_WIN;
	HIDE_SPRITES;

	//move win to top left and clear window & background
	move_win(8,0);
	clearScreen();
	initFont();
	//set score label
	set_win_tiles(7, 5, 5, 1, endScoreLabel);
	unsigned char buf[10];
	//bcd2text(&SCORE, 0, buf);
	//set_win_tiles(8, 7, 8, 1, buf);

	bcd2text(&SCORE, 0x01, buf);
	set_win_tiles(6, 8, 7, 1, buf+1);


	//anykeylabel
	set_win_tiles(3, 11, 13, 1, pressAnyKeyLabel);

	set_win_tiles(4, 12, 11, 1, toContinueLabel);



	SHOW_WIN;

}

//same for controls screen
void showControls() {
	HIDE_WIN;
	HIDE_SPRITES;

	//move win to top left and clear window & background
	move_win(12,0);
	clearScreen();
	initFont();

	set_bkg_data(0x70, 1, underscore); 
	unsigned char underscoreTiles[] = {0x70, 0x70, 0x70, 0x70, 0x70, 0x70,0x70, 0x70};
	set_win_tiles(5, 3, 8, 1, underscoreTiles);

	set_win_tiles(5, 2, 8, 1, controlsLabel);
	set_win_tiles(3, 5, 11, 1, dpadlabel);
	set_win_tiles(3, 7, 13, 1, alabel);
	set_win_tiles(3, 9, 11, 1, blabel);
	set_win_tiles(3, 11, 12, 1, startlabel);

	set_win_tiles(3, 13, 13, 1, selectlabel);
	set_win_tiles(10, 14, 6, 1, fullweaponlabel);

	SHOW_WIN;

}

//shows the first frame
void showStartScreen() {
	initFont();

	HIDE_WIN;

	//move win to top left and clear window
	move_win(12,0);
	//set score label
	set_win_tiles(4, 8, 11, 1, pressStartLabel);
	
	SHOW_WIN;
}

//updates menu picker location
void updateMenu(int8_t menuitem) {
	move_sprite(0, 48, 95+ (menuitem<<3));
	move_sprite(1, 122, 95+ (menuitem<<3));

}

//main menu display function
//returns 0 for play, 1 for controls
uint8_t showMenu() {
	initFont();

	HIDE_WIN;
	HIDE_SPRITES;

	SPRITES_8x8;

	move_win(16,0);


	//move win to top left and clear window
	set_win_tiles(7, 10, 4, 1, playLabel);
	set_win_tiles(5, 11, 8, 1, controlsLabel);


	unsigned char logo0_offsetMap[128];
	for (uint8_t i = 0; i < 128; ++i) {
		logo0_offsetMap[i] = logo0_map[i] + 0x25;
	} 

	unsigned char logo0_offsetData[76];
	for (uint8_t j = 0; j < 76; ++j) {
		logo0_offsetData[j] = logo0_data[j] + 0x25;
	} 

	set_bkg_data(0x25, 76, logo0_data); //0x25
	set_win_tiles(1,1, 16, 8, logo0_offsetMap);

	set_sprite_data(0, 1, MenuPicker);
	set_sprite_tile(0, 0);
	set_sprite_tile(1, 0);
	set_sprite_prop(0, 0);
	set_sprite_prop(1, S_FLIPX);
	SHOW_WIN;
	SHOW_SPRITES;


	int8_t menuitem = 0;

	while (1) {
		joydata = joypad(); // query for button states

		if (joydata & J_DOWN) {
			menuitem++;
		}
		else if (joydata & J_UP) {
			menuitem--;
		}
		menuitem = clamp(menuitem, 0, 1);
		updateMenu(menuitem);

		if ((joydata & J_A) && menuitem == 0) {
			waitpadup();
			playSound(0);
			return 0;
		}
		else if (joydata & J_A) {
			waitpadup();
			return 1;
		}

		wait_vbl_done();

	}
}


//level selection menu handler
//returns 1 if a map was selected, 0 for back
uint8_t showLevelSelection() {
	HIDE_WIN;
	HIDE_SPRITES;
	clearScreen();
	initFont();
	move_win(8, 0);

	set_bkg_data(0x70, 1, underscore); 
	unsigned char underscoreTiles[] = {0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70};
	set_win_tiles(3, 4, 12, 1, underscoreTiles);



	set_win_tiles(3,3, 12, 1, selectLevelLabel);

	set_win_tiles(3,6, 4, 1, voidLabel);
	set_win_tiles(3,7, 11, 1, asteroids1Label);
	set_win_tiles(3,8, 11, 1, asteroids2Label);
	set_win_tiles(3,9, 8, 1, marshabLabel);
	set_win_tiles(3,10, 5, 1, bonusLabel);

	set_sprite_data(0, 1, MenuPicker);
	set_sprite_tile(0, 0);

	SHOW_WIN;
	SHOW_SPRITES;


	int8_t menuitem = 0;
	while(1) {
		prevJoyData = joydata;
		joydata = joypad();

		if (joydata & J_A) {
			waitpadup();

			if (menuitem == 0) {
				set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
				set_bkg_tiles(0,0,background3Width, background3Height ,background3); //set tilemap to be a background
				collisionTiles = background3; // set background to be the collision map
				difficulty = 0;
				return 1;
			}
			if (menuitem == 1) {
				set_bkg_data(0x25, 16, backgroundtiles);		
				set_bkg_tiles(0,0,background1Width, background1Height ,background1); 
				collisionTiles = background1;
				difficulty = 100;
				return 1;
			}
			if (menuitem == 2) {
				set_bkg_data(0x25, 16, backgroundtiles);		
				set_bkg_tiles(0,0,background4Width, background4Height ,background4); 
				collisionTiles = background4;
				difficulty = 200;
				return 1;
			}
			if (menuitem == 3) {
				set_bkg_data(0x25, 16, marstiles);		
				set_bkg_tiles(0,0,marsbackgroundWidth, marsbackgroundHeight ,marsbackground); 
				collisionTiles = marsbackground;
				difficulty = 300;
				return 1;
			}
			else {
				set_bkg_data(0x25, 16, backgroundtiles2);	
				set_bkg_tiles(0,0,background2Width, background2Height ,background2); 
				collisionTiles = background2;
				difficulty = 400;
				return 1;
			}
			


		}
		if (joydata & J_B) {
			waitpadup();
			return 0;
		}

		if (!(prevJoyData & J_DOWN) && (joydata & J_DOWN)) {
			++menuitem;
		}
		if (!(prevJoyData & J_UP) && (joydata & J_UP)) {
			--menuitem;
		}
		menuitem = clamp(menuitem, 0, 4);
		move_sprite(0, 24, 63 + (menuitem<<3));

		wait_vbl_done();
	}

}



void main(){

	



	disable_interrupts();


	showStartScreen();
	waitpad(J_START | J_A);
	waitpadup();




	NR52_REG = 0x80; // sound on 
    NR50_REG = 0x77; // volume
    NR51_REG = 0xFF; // all channels


	uint16_t seed = LY_REG;
	seed |= (uint16_t)DIV_REG << 8;
	initrand(seed);




	while(1) {
		disable_interrupts();

		//STAT_REG = 0x45;
		//LYC_REG = 0x90; //line 144
		set_interrupts(1);   

		clearScreen();
		//main menu
		uint8_t result = showMenu();

		//started game
		if (result == 0) {

			uint8_t map = showLevelSelection();
			if (map == 0) {
				continue;
			}
			else {

				initEnemyOptions();
				initGame();
				initEnemies(1);
				initProjectiles();

				//main game loop
				while(hull > 0) {
					SHOW_SPRITES;

					prevJoyData = joydata;
					joydata = joypad(); // query for button states

					updateDirection(); // set player direction
					//move player, in future also checks collision damage with background objs
					//also updates enemy positions, if background moves
					move(); 

					moveProjectiles();
					tickPickups();
					tickEx();


					//updates enemy positions to take account changes made by move()
					updateEnemyPositions();
					checkCollision(); 

					updateShieldsAndHull();


					if (joydata & J_B && fireCooldown == 0) {
						fire();
					}
					if (fireCooldown > 0) {
						--fireCooldown;
					}

					if ((joydata & J_SELECT) && !(prevJoyData & J_SELECT)) {
						if (currentGun == 0) {
							currentGun = 1;
						}
						else if (currentGun == 1) {
							currentGun = 0;
						}
						setGunIcon();
					}

					if (!(joydata & J_START) && (prevJoyData & J_START)) {
						doPause();
					}

					if (auxTick == 0) {
						auxTick = AUXTICKFREQUENCY;
					}
					else {
						auxTick--;
					}



					if (hull > 100) {
						hull = 0;
						shield = 0;
						setHealthBar(1, hull);
						setHealthBar(0, shield);

					}
					SHOW_SPRITES;

					SHOW_WIN;	
					wait_vbl_done(); // Idle until next frame
				}

				//game ending frames showing explosions on top of player
				//first init empty explosions in different states of animation to offset their spawn times
				for (uint8_t i=0; i<exCount; ++i) {
					explosions[i].x = 200;
					explosions[i].y = 200;

					explosions[i].tile = exTiles[0];
					explosions[i].frameCounter = 0;
					explosions[i].frame = 2-i;
					explosions[i].visible = 1;
				}
				xOverflow = 0;
				yOverflow = 0;
				uint8_t endExCount = 0;
				while(endExCount < 12) {

					SHOW_SPRITES;
					tickEx();
					if (auxTick == 0) {
						auxTick = AUXTICKFREQUENCY;
					}
					else {
						auxTick--;
					}
					if (!explosions[oldestEx].visible) {
						explosions[oldestEx].visible = 1;

						
						uint8_t tileNum = ((uint8_t)rand()) % exTileCount;
						uint8_t xOff = ((uint8_t)rand()) % 32;
						uint8_t yOff = ((uint8_t)rand()) % 32;

						explosions[oldestEx].x = playerDrawX -16 + xOff;
						explosions[oldestEx].y = playerDrawY -16 + yOff;
						explosions[oldestEx].tile = exTiles[tileNum];
						explosions[oldestEx].frame = 0;
						explosions[oldestEx].frameCounter = 0;

						set_sprite_tile(20 + oldestEx+oldestEx, explosions[oldestEx].tile + (explosions[oldestEx].frame<<1));
						set_sprite_tile(21 + oldestEx+oldestEx, explosions[oldestEx].tile+(explosions[oldestEx].frame<<1) +2);

						oldestEx++;
						if (oldestEx >= exCount) {
							oldestEx = 0;
						}
						endExCount++;

					}
					SHOW_WIN;	

					wait_vbl_done();
				}
				//moving explosions out of the screen
				for (uint8_t j=0; j<exCount; ++j) {

					move_sprite(20 +j+j, 200, 200);
					move_sprite(21 +j+j, 200, 200);
				}
				for (uint16_t k=0; k<120; ++k) {
					SHOW_SPRITES;
					SHOW_WIN;
					wait_vbl_done();
				}
				disable_interrupts();
				//displaying game ending screen
				showScoreScreen();
				waitpad(J_A | J_B | J_DOWN | J_LEFT | J_RIGHT | J_UP | J_SELECT | J_START);
				waitpadup();
			}


		}
		else if (result == 1) {
			showControls();
			waitpad(J_B);
			waitpadup();
		}
		
	}

}
