#include <gb/gb.h>  
#include <stdio.h>
#include "data/cross.c" 

#include "data/background1.c"
#include "data/backgroundtiles.c"
#include "data/windowmap.c"
#include "data/healthblock.c"
#include "data/enemy.c"
#include "data/projectile.c"
#include "data/projectiles.c"

#include <gbdk/font.h>
#include <rand.h>

#include <gbdk/bcd.h>


//global variables
const uint8_t BLANKSIZE = 3;
const unsigned char BLANK[3] = {0x26, 0x2b, 0x2c}; 
const unsigned char EMPTYSPRITE = 0x50;

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


const uint8_t PLAYERSIZE = 8;


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

uint8_t joydata;

int8_t hull;
const int8_t maxHull = 100;

int8_t shield;
const int8_t maxShield = 100;

font_t min_font;

int16_t xOverflow = 0;
int16_t yOverflow = 0;


//counter to alternate which enemy collisions are calculated for each frame
//loops through every enemy ~11x per second
uint8_t enemyCollisionCount = 0;


const uint8_t GUNCOUNT = 3;
uint8_t currentGun = 0;
uint8_t switchDelay = 0;
//ugly references directly to vram locations, where gun icons are loaded to
unsigned char gunMap[] = {0x51, 0x56, 0x58};


uint16_t score = 0;
BCD bcd = MAKE_BCD(00000);
BCD INCREMENT = MAKE_BCD(00001);


void interruptLCD()
{
    HIDE_SPRITES;
}


void setHealthBar(uint8_t row, uint8_t hp) {

	if (hp >= 80) {
		unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x50};
		set_win_tiles(5,row,5,1,blockmap);
		return;
	}
	if (hp >= 60) {
		unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x00};
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
	unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
	set_win_tiles(5,row,5,1,blockmap);
	return;

}

void updateScore() {

	uint8_t len = 0;
	unsigned char buf[10];
	len = bcd2text(&bcd, 0x01, buf);
	set_win_tiles(15, 1, 5, 1, buf+3);
}

void incrementScore() {
	score += 1;
	bcd_add(&bcd, &INCREMENT);
}

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

	uint8_t direction = 0;

	if (xDir == 0 && yDir < 0) {
		direction = 0;
	}
	if (xDir > 0 && yDir < 0) {
		direction = 1;
	}
	if (xDir > 0 && yDir == 0) {
		direction = 2;
	}
	if (xDir > 0 && yDir > 0) {
		direction = 3;
	}
	if (xDir == 0 && yDir > 0) {
		direction = 4;
	}
	if (xDir < 0 && yDir > 0) {
		direction = 5;
	}
	if (xDir < 0 && yDir == 0) {
		direction = 6;
	}
	if (xDir < 0 && yDir < 0) {
		direction = 7;
	}

	set_sprite_tile(0, direction);
}


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


void updateEnemyPositions() {
	//update enemy speeds and positions
	for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {

		enemies[i].x -= xOverflow;
		enemies[i].y -= yOverflow;


		if (enemies[i].x < playerDrawX) {
			enemies[i].xSpeed += enemies[i].accel;
		}
		else {
			enemies[i].xSpeed -= enemies[i].accel;
		}
		if (enemies[i].y < playerDrawY) {
			enemies[i].ySpeed += enemies[i].accel;
		}
		else {
			enemies[i].ySpeed -= enemies[i].accel;
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
		
		



	}



	for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
		//hide if not on screen, this must be done as the background loops around, and the enemy sprites shouldn't!
		if (enemies[i].alive) {
			if (enemies[i].visible == 1) {
				if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
					enemies[i].visible = 0;
					set_sprite_tile(10+i, 0x7f);
				} 
			}
			else {
				if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
					enemies[i].visible = 1;
					set_sprite_tile(10+i, enemies[i].sprite0);
				}
			}

		}
		move_sprite(10+i, enemies[i].x, enemies[i].y);
	}
}

void initEnemies(uint8_t loadSprites) {

	if (loadSprites) {
		//loading enemy sprites to vram
		set_sprite_data(9, 2, enemy1);

	}

	//initializing enemy list with structs
  for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	  	if (enemies[i].alive == 0) {

			enemies[i] = blob;
		

			uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
			enemies[i].x = xSpawnPositions[posIndex];
			enemies[i].y = ySpawnPositions[posIndex];

			set_sprite_tile(10+i, enemies[i].sprite0);

			
			move_sprite(10+i, enemies[i].x, enemies[i].y);
	  	}
  }
}


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
	uint8_t xCollisionPoint = playerDrawX -4; 

	if (xSpeed > 0) {
		xCollisionPoint = playerDrawX; //right edge
	}
	if (xSpeed < 0) {
		xCollisionPoint = playerDrawX -8; //left edge
	}

	
	int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;


	//-12 as y coordinate is 0 at bottom edge of 16 high sprite & this sprite is only 8 high and pinned to top
	uint8_t bgindY = ((playerDrawY-12 + bgY) >> 3)%32; 


	uint16_t ind = 32*bgindY + bgindX;
	uint8_t result = 1; // 0 incase of clear path, 1 for blocked
	for (uint8_t i=0; i<BLANKSIZE; i++) {
		if (background1[ind] == BLANK[i] ) {
			result = 0;
			break;
		}
	}

	if (result == 0) {
		playerX+=xSpeed;

		uint16_t limitedPlayerX = u16Clamp(playerX, 58<<5, 110<<5);//0->160, with 8 px margin for left edge & 50px for the edges
		
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
	uint8_t yCollisionPoint = playerDrawY -12; 

	if (ySpeed > 0) {
		yCollisionPoint = playerDrawY - 8; //bottom edge, only half the height, so -8
	}
	if (ySpeed < 0) {
		yCollisionPoint = playerDrawY -16; //top edge, 
	}

	
	bgindX = ((playerDrawX -4 + bgX) >> 3)%32;


	bgindY = ((yCollisionPoint + bgY) >> 3)%32; 


	ind = 32*bgindY + bgindX;
	result = 1;
	for (uint8_t j=0; j<BLANKSIZE; j++) {
		if (background1[ind] == BLANK[j] ) {
			result = 0;
			break;
		}
	}
	if (result == 0) {
		playerY += ySpeed;

		uint16_t limitedPlayerY = u16Clamp(playerY, 61<<5, 107<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
		
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


	move_sprite(0, playerDrawX, playerDrawY);

	
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

	//bleed speed
	if (ySpeed > 0) ySpeed--;
	if (ySpeed < 0) ySpeed++;
	if (xSpeed > 0) xSpeed--;
	if (xSpeed < 0) xSpeed++;

	
	
}

void takeDamage(int16_t amount) {
	if (amount > shield) {
		shield = 0;
		hull -= (amount - shield);
	}
	else {
		shield -= amount;
	}
}

void checkCollision() {
	//playerDrawX


	//option 1


	struct Enemy *eptr = enemies;
	uint8_t i = 0;

	while (i < ENEMYCOUNT) {
		eptr += enemyCollisionCount;
			if (eptr->visible && eptr->alive) {

				if (eptr->x > playerDrawX - PLAYERSIZE && eptr->x - (8>>(eptr->spriteCount-1)) < playerDrawX) 
				{
					if (eptr->y > playerDrawY - PLAYERSIZE && eptr->y -(8>>(eptr->spriteCount-1)) < playerDrawY) {
						set_sprite_tile(10+i, 0x7f);
						eptr->alive = 0;
						takeDamage(eptr->damage);
						initEnemies(0);
						playSound(0);

					}
				}
			}
		//}


		//projectiles
		//if (projectileCollisionCount == 0) {
		//	if (eptr->visible && eptr->alive) {
				struct Projectile *pptr = projectiles;
				uint8_t j = 0;
				while (j < PROJECTILECOUNT) {
					if (pptr->active) {
						if (eptr->x > pptr->x - 8 && eptr->x - (8>>(eptr->spriteCount-1)) < pptr->x) {
							if (eptr->y > pptr->y - 8 && eptr->y -(8>>(eptr->spriteCount-1)) < pptr->y ) {
								set_sprite_tile(10+i, 0x7f);
								eptr->alive = 0;
								initEnemies(0);
								set_sprite_tile(20+j, 0x7f);
								playSound(0);
								pptr->active = 0;
								incrementScore();
								updateScore();
							}
						}
					}
					j++;
					pptr++;
				}
		//	}
		//}
		
		//i++;
		//eptr++;
		break;
	}

	if (enemyCollisionCount == 0) {
		enemyCollisionCount = ENEMYCOUNT - 1;
	}
	else {
		enemyCollisionCount--;
	}

/*

			*/


	//option 2
	/*
	for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
		if (enemies[i].visible && enemies[i].alive) {
			uint8_t x = enemies[i].x;
			uint8_t y = enemies[i].y;

			if (x > playerDrawX - PLAYERSIZE && x - (8>>(enemies[i].spriteCount-1)) < playerDrawX
					&& y > playerDrawY - PLAYERSIZE && y -(8>>(enemies[i].spriteCount-1)) < playerDrawY ) 
			{
				set_sprite_tile(10+i, 0x7f);
				enemies[i].alive = 0;
				takeDamage(enemies[i].damage);
				initEnemies(0);
			}



						
			for (uint8_t j = 0; j < PROJECTILECOUNT; ++j) {
				if (projectiles[j].active) {
					uint8_t pX = projectiles[j].x;
					uint8_t pY = projectiles[j].y;
					if (x > pX - 8 && x - (8>>(enemies[i].spriteCount-1)) < pX
							&& y > pY - 8 && y -(8>>(enemies[i].spriteCount-1)) < pY ) {

						set_sprite_tile(10+i, 0x7f);
						enemies[i].alive = 0;
						initEnemies(0);

						set_sprite_tile(20+j, 0x7f);
						projectiles[j].active = 0;
					}
				}
			}
		}	
	}
	*/



}


void setGunIcon() {
	

	set_win_tiles(15, 0,1,1,gunMap+currentGun);

}
 
inline void updateShieldsAndHull() {
	if (shield < maxShield) {
		shield += 1;
	}
	setHealthBar(0, hull);
	setHealthBar(1, shield);
}

void fire() {

	oldestProjectile += 1;
	if (oldestProjectile >= PROJECTILECOUNT) {
		oldestProjectile = 0;
	}

	if (currentGun == 0) {
		projectiles[oldestProjectile] = singleGun;
	}
	if (currentGun == 1) {
		projectiles[oldestProjectile] = doubleGun;
	}
	if (currentGun == 2) {
		projectiles[oldestProjectile] = missile;
	}
	projectiles[oldestProjectile].x = playerDrawX;
	projectiles[oldestProjectile].y = playerDrawY;
	projectiles[oldestProjectile].xSpeed = xDir * projectiles[oldestProjectile].speed;
	projectiles[oldestProjectile].ySpeed = yDir * projectiles[oldestProjectile].speed;

	if (yDir != 0 && xDir == 0) {
		set_sprite_tile(20+oldestProjectile, projectiles[oldestProjectile].type);
		if (yDir == 1) {
			set_sprite_prop(20+oldestProjectile, S_FLIPY); 

		}
		else {

			set_sprite_prop(20+oldestProjectile, 0); 
		}

	}
	else if (xDir != 0 && yDir == 0) {
		set_sprite_tile(20+oldestProjectile, projectiles[oldestProjectile].type+1);
		if (xDir == 1) {
			set_sprite_prop(20+oldestProjectile, 0); 
		}
		else {
			set_sprite_prop(20+oldestProjectile, S_FLIPX); 
		}
	}
	else {
		set_sprite_tile(20+oldestProjectile, projectiles[oldestProjectile].type+2);
		if (xDir == 1 && yDir == -1) {
			set_sprite_prop(20+oldestProjectile, 0); //default is right & up
		}
		else if (xDir == 1 && yDir == 1) {
			set_sprite_prop(20+oldestProjectile, S_FLIPY); 
		}
		else if (xDir == -1 && yDir == 1) {
			set_sprite_prop(20+oldestProjectile, S_FLIPY | S_FLIPX); 
		}  
		else if (xDir == -1 && yDir == -1) {
			set_sprite_prop(20+oldestProjectile, S_FLIPX); 
		}
	}
	//set_sprite_tile(20+oldestProjectile, projectiles[oldestProjectile].type);
	move_sprite(20+oldestProjectile, playerDrawX, playerDrawY);
	fireCooldown = projectiles[oldestProjectile].delay;

	playSound(projectiles[oldestProjectile].type);



}


void moveProjectiles() {
	for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
		projectiles[i].x -= xOverflow;
		projectiles[i].y -= yOverflow;

		if (projectiles[i].active) {
			int16_t newY = projectiles[i].y + projectiles[i].ySpeed;
			int16_t newX = projectiles[i].x + projectiles[i].xSpeed;

			move_sprite(20+i, newX, newY);
			projectiles[i].y = newY;
			projectiles[i].x = newX;



			//if (abs(projectiles[i].x - playerDrawX) > 100 || abs(projectiles[i].y - playerDrawY) > 100) {
			if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {

				projectiles[i].active = 0;
				set_sprite_tile(20+i, 0x7f);
			}
		}
	}
	
}


void initProjectiles() {
	set_sprite_data(20, 9, ProjectileTiles);

	for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
		projectiles[i].active == 0;	

	}
}

void initGame() {


	xDir = 0;
	yDir = -1;
	xSpeed = 0;
	ySpeed = 0;

	//subpixel positions
	playerX = 80<<5;
	playerY = 80<<5;
	//on screen positions
	playerDrawX = 80;
	playerDrawY = 80;

	//background position
	bgX = 0;
	bgY = 0;
	
	hull = maxHull;
	shield = maxShield;

	DISPLAY_ON;
	SPRITES_8x8;
	set_sprite_data(0, 8, cross);
	set_sprite_tile(0, 0);
	//move_sprite(0, playerX, playerY);
	SHOW_SPRITES;
	
	

	font_init();
	//font_color(0, 0);
    min_font = font_load(font_min); // 36 tiles of characters
    font_set(min_font);
	set_win_tiles(1,0,4,1,hullabel);
	set_win_tiles(1,1,4,1,shieldlabel);



	//load healthbar block to bkg 
	set_bkg_data(0x50,1,healthblock);
	//unsigned char healthmap[] = {0x50,0x50,0x50,0x50,0x50};
	setHealthBar(0, hull);
	setHealthBar(1, shield);

	move_win(7,126);




	set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
	move_bkg(0,0);

	set_bkg_data(0x51, 9, ProjectileTiles);

	set_win_tiles(10, 0,4,1,weaponlabel);
	set_win_tiles(10, 1,4,1,scorelabel);

	setGunIcon();
	SHOW_BKG;
	SHOW_WIN;;

	bcd = MAKE_BCD(00000);
	updateScore();
	

}

void main(){

	
    STAT_REG = 0x45;
    LYC_REG = 0x7e; //line 126
    disable_interrupts();
    add_LCD(interruptLCD);
    enable_interrupts();
    set_interrupts(VBL_IFLAG | LCD_IFLAG);   



	NR52_REG = 0x80; // sound on 
    NR50_REG = 0x77; // volume
    NR51_REG = 0xFF; // all channels


	//printf("PRESS A TO START");
	waitpad(J_A);
	uint16_t seed = LY_REG;
	seed |= (uint16_t)DIV_REG << 8;
	initrand(seed);


	while(1) {

		initGame();
		initEnemies(1);
		initProjectiles();

		while(1) {
			SHOW_SPRITES;

			joydata = joypad(); // query for button states

			updateDirection(); // set player direction
			//move player, in future also checks collision damage with background objs
			//also updates enemy positions, if background moves
			move(); 
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

			if (joydata & J_SELECT && switchDelay == 0) {
				currentGun++;
				if (currentGun >= GUNCOUNT) {
					currentGun = 0;
				}
				setGunIcon();
				switchDelay = 30;
			}
			if (switchDelay != 0) {
				switchDelay--;
			}
			moveProjectiles();

			//TODO: use this pattern to access arrays in a loop...
			// create a pointer to array and increment when needed
			/*
			struct Enemy *ptr = enemies;
			printf("%d ", (ptr->damage));
			ptr++;
			printf("%d\n", (ptr->damage));
			*/


	        SHOW_WIN;	
			wait_vbl_done(); // Idle until next frame
		}

	}

}
