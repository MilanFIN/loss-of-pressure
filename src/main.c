#include <gb/gb.h>  
#include <stdio.h>
#include "data/cross.c" 

#include "data/background1.c"
#include "data/backgroundtiles.c"
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


/*
TODO: 
- projectiles ++ speed, vähentää hitautta, kun alle 4 projectilea näkyvillä kerralla, collision hajoaa jos nopeus nousee
- räjähdyssprite viholliselle
- >100hp = pelaaja kuoli -> aseta hp = 0 ja trikkaa seuraava
	- animoitu rähändys pelaajalle pelin päättyessä
- maalle sijoittuvia ratoja, esim pilvenpiirtäjiä
- aavikkoa?

- missilelle areal damage osumasta, esim kaikki viholliset läpi ja tarkista etäisyys


- äänet
	- ampumiseen, pitää korjata 
	- pickup
	- shield kun täysi
	- eri ääni oma damage ja viholliset


*/


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

uint8_t joydata;

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


const uint8_t MAXGUNLEVEL = 1; //0&1
uint8_t gunLevel = 0;
uint8_t currentGun = 0;
uint8_t missiles = 1;
uint8_t splashArea = 10;


BCD MISSILES = MAKE_BCD(0);
uint8_t switchDelay = 0;
//ugly references directly to vram locations, where gun icons are loaded to
unsigned char gunMap[] = {0x53, 0x5b, 0x61};

struct Pickup pickup;


uint16_t score = 0;
BCD SCORE = MAKE_BCD(00000);
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
	len = bcd2text(&SCORE, 0x01, buf);
	set_win_tiles(15, 1, 5, 1, buf+3);
}

void updateMissileCount(int8_t amount) {
	if (amount == -1) {
		missiles--;
		bcd_sub(&MISSILES, &INCREMENT);
	}
	else {
		for(uint8_t i=0; i<amount;i++) {
			++missiles;
			bcd_add(&MISSILES, &INCREMENT);
		}
	}
	uint8_t len = 0;
	unsigned char buf[10];
	len = bcd2text(&MISSILES, 0x01, buf);
	set_win_tiles(18, 0, 2, 1, buf+6);

}

void incrementScore() {
	score += 1;
	bcd_add(&SCORE, &INCREMENT);
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

	/*
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
	*/

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
	else if (xDir < 0 && yDir < 0) {
		set_sprite_tile(0, 8);
		set_sprite_tile(1, 10);
		set_sprite_prop(0, S_FLIPX); 
		set_sprite_prop(1, S_FLIPX); 
	}
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

inline uint16_t i16abs(int16_t value) {
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

void initEnemies(uint8_t loadSprites) {

	if (loadSprites) {
		//loading enemy sprites to vram
		set_sprite_data(0x40, 5, enemy1);
		set_sprite_data(0x50, 8, largeenemies);
	}

	struct Enemy *eptr = enemies;
	//initializing enemy list with structs
  	for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	  	if (eptr->alive == 0) {

			uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) enemyOptionCount;
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


	  	}
		eptr++;
  	}

}


void updateEnemyPositions() {
	//update enemy speeds and positions
	
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
	}




	for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
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
					initEnemies(0);
				}
			}
		}
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
		if (background1[ind] == BLANK[i] ) {
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
		if (background1[ind] == BLANK[j] ) {
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

void spawnPickup(int16_t x, int16_t y) {
	uint8_t spawn = ((uint8_t)rand()) % (uint8_t) 16;
	if (spawn == 0) {
		uint8_t type = ((uint8_t)rand()) % (uint8_t) 4;
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

void checkCollision() {
	//playerDrawX


	//option 1


	struct Enemy *eptr = enemies + enemyCollisionCount;
	uint8_t i = enemyCollisionCount;

	if (eptr->visible && eptr->alive) {

		if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
			(eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
			if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
				(eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
				
				set_sprite_tile(10+(i<<1), 0x7f);
				set_sprite_tile(10+(i<<1)+1, 0x7f);
				eptr->alive = 0;
				eptr->visible = 0;
				takeDamage(eptr->damage);
				initEnemies(0);
				playSound(0);

			}
		}
		

		struct Projectile *pptr = projectiles;
		uint8_t j = 0;
		while (j < PROJECTILECOUNT) {
			if (pptr->active) {

				//if (eptr->x > pptr->x - 8 && eptr->x - (8>>(eptr->spriteCount-1)) < pptr->x) {
				//	if (eptr->y > pptr->y - 8 && eptr->y -(8>>(eptr->spriteCount-1)) < pptr->y ) {
				if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
					(eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
					if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
						(eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {

							set_sprite_tile(30+j, 0x7f);
							pptr->active = 0;

							if (pptr->type == 0x2c) { //missile
								for (uint8_t k=0; k < ENEMYCOUNT;++k) {
									int16_t dmgDropOff = ((i16abs(pptr->x - enemies[k].x) + i16abs(pptr->y - enemies[k].y))<<1);
									printf("%d\n", dmgDropOff);
									//TODO deduct hp & kill enemies if needed, spawn pickups etc
								}

							}
							else { //all single target guns
								eptr->hp -= pptr->damage;

								if (eptr->hp <= 0) {

									set_sprite_tile(10+(i<<1), 0x7f);
									set_sprite_tile(10+(i<<1)+1, 0x7f);

									spawnPickup(eptr->x, eptr->y);

									eptr->alive = 0;
									eptr->visible = 0;
									playSound(0);
									incrementScore();
									updateScore();
								}



							}


							initEnemies(0);


					}
				}
			}
			
			j++;
			pptr++;
		}
	}

	if (enemyCollisionCount == 0) {
		enemyCollisionCount = ENEMYCOUNT - 1;
	}
	else {
		enemyCollisionCount--;
	}



}


void setGunIcon() {

	if (currentGun == 0) {
		set_win_tiles(15, 0,1,1,gunMap+gunLevel);
	}
	else {
		set_win_tiles(15, 0,1,1,gunMap+2);
	}
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
		if (gunLevel == 0) {
			projectiles[oldestProjectile] = singleGun;
		}
		else {
			projectiles[oldestProjectile] = doubleGun;
		}
	}
	if (currentGun == 1) {
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

	playSound(projectiles[oldestProjectile].type);



}


void moveProjectiles() {
	for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
		projectiles[i].x -= xOverflow;
		projectiles[i].y -= yOverflow;

		if (projectiles[i].active) {
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

void tickPickups() {
	pickup.x -= xOverflow;
	pickup.y -= yOverflow;

	move_sprite(3, pickup.x + 4, pickup.y + 12);
	if (pickup.active) {
		if (pickup.visible) {
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

void initEnemyOptions() {
	enemyOptions[0] = blob;
	enemyOptions[1] = bomb;
	enemyOptions[2] = miniship;
	enemyOptions[3] = shieldship;

	enemyOptions[4] = bigblob;
}


void initProjectiles() {
	set_sprite_data(0x20, 17, ProjectileTiles); 

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
	SPRITES_8x16;
	set_sprite_data(0, 12, Player1);

	set_sprite_tile(0, 0);
	set_sprite_tile(1, 2);

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



	// TODO: debug 
	set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
	
	
	
	move_bkg(0,0);

	set_bkg_data(0x51, 18, ProjectileTiles);

	set_win_tiles(10, 0,4,1,weaponlabel);
	set_win_tiles(10, 1,4,1,scorelabel);

	setGunIcon();
	SHOW_BKG;
	SHOW_WIN;;

	SCORE = MAKE_BCD(00000);
	updateScore();
	MISSILES = MAKE_BCD(1);
	updateMissileCount(0);
	set_win_tiles(17, 0,1,1,gunMap+2);


	//init pickup, not active yet, so settting empty tile
	pickup = upgrade;//upgrade;
	//init pickup upgrade/missile, using tile #40, 0x7f is an empty tile
	set_sprite_data(0x70, 6, Pickups);
	set_sprite_tile(3, 0x7f); //0x7f
	//pickup.x = 100;
	//pickup.y = 80;
	move_sprite(3, pickup.x + 4, pickup.y + 12);

}

void main(){


	initEnemyOptions();

	
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
				if (currentGun == 0) {
					currentGun = 1;
				}
				else if (currentGun == 1) {
					currentGun = 0;
				}
				setGunIcon();
				switchDelay = 30;
			}
			if (switchDelay != 0) {
				switchDelay--;
			}
			moveProjectiles();
			tickPickups();



			if (hull > 100) {
				hull = 0;
			}

	        SHOW_WIN;	
			wait_vbl_done(); // Idle until next frame
		}

	}

}
