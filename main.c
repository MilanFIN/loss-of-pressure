#include <gb/gb.h>  
#include <stdio.h>
#include "data/cross.c" 

#include "data/background1.c"
#include "data/backgroundtiles.c"
#include "data/windowmap.c"
#include "data/healthblock.c"
#include <gbdk/font.h>


//global variables
const unsigned char BLANK[1] = {0x26}; 

int8_t xDir = 0;
int8_t yDir = 0;
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
int8_t maxHull = 100;

int8_t shield;
int8_t maxShield = 100;

font_t min_font;



void interruptLCD(){
    HIDE_WIN;
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


int8_t clamp( int8_t value, int8_t min, int8_t max )
{
    return (value < min) ? min : (value > max) ? max : value;
}


uint8_t uClamp( uint8_t value, uint8_t min, uint8_t max )
{
    return (value < min) ? min : (value > max) ? max : value;
}

uint16_t u16Clamp( uint16_t value, uint16_t min, uint16_t max )
{
    return (value < min) ? min : (value > max) ? max : value;
}

int8_t abs(int8_t value) {
	if (value >= 0) return value;
	else return - value;
}


void move() {

	//gas 
	
	if (joydata & J_A) {
		xSpeed += xDir + xDir + xDir;
		ySpeed += yDir + yDir + yDir;
	}
	

	xSpeed = clamp(xSpeed, -100, 100);
	ySpeed = clamp(ySpeed, -100, 100);

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
	uint8_t result = background1[ind] != BLANK[0];
	if (result == 0) {
		playerX+=xSpeed;

		uint16_t limitedPlayerX = u16Clamp(playerX, 58<<5, 110<<5);//0->160, with 8 px margin for left edge & 50px for the edges
		
		int16_t xOverflow = (playerX - limitedPlayerX);
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
	result = background1[ind] != BLANK[0];
	if (result == 0) {
		playerY += ySpeed;

		uint16_t limitedPlayerY = u16Clamp(playerY, 61<<5, 107<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
		
		int16_t yOverflow = (playerY - limitedPlayerY);
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
	//scroll_bkg(1, 0);

	//int8_t winOffset = bgX % 8;
	//move_win(winOffset, 120);

	//bleed speed
	if (ySpeed > 0) ySpeed--;
	if (ySpeed < 0) ySpeed++;
	if (xSpeed > 0) xSpeed--;
	if (xSpeed < 0) xSpeed++;

	
	
}

void checkCollision() {
	//TODO
}


void init() {


	xDir = 0;
	yDir = 0;
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
    min_font = font_load(font_min); // 36 tiles of characters
    font_set(min_font);
	set_win_tiles(1,0,4,1,hullabel);
	set_win_tiles(1,1,5,1,shieldlabel);



	//load healthbar block to bkg 
	set_bkg_data(0x50,1,healthblock);
	//unsigned char healthmap[] = {0x50,0x50,0x50,0x50,0x50};
	setHealthBar(0, hull);
	setHealthBar(1, shield);

	
	//set_win_tiles(5,0,5,1,healthmap);
	//set_win_tiles(5,1,5,1,healthmap);

	move_win(7,124);
	SHOW_WIN;;




	set_bkg_data(0x25, 6, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
	move_bkg(0,0);
	SHOW_BKG;

}

void main(){

    STAT_REG = 0x45;
    LYC_REG = 0x0e;//0x08;  //  Fire LCD Interupt on the 8th scan line (just first row)
    disable_interrupts();
    add_LCD(interruptLCD);
    enable_interrupts();
    set_interrupts(VBL_IFLAG | LCD_IFLAG);   

	while(1) {

		init();

		while(1) {
			joydata = joypad(); // query for button states

			updateDirection(); // set player direction
			move(); //move player, also takes damage in case of sudden stop against background elements

			checkCollision(); //todo check for collisions with other sprites
	        SHOW_WIN;	
			wait_vbl_done(); // Idle until next frame
		}

	}

}
