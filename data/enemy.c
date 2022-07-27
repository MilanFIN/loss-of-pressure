

typedef struct Enemy {
	int16_t x;
	int16_t y;

	int8_t xReserve;
	int8_t yReserve;


	uint8_t sprite0;
	uint8_t sprite1;

	unsigned int spriteCount;

	uint8_t alive;
	uint8_t visible;
	uint8_t damage;

	int16_t speed;
	uint8_t accel;
	int16_t xSpeed;
	int16_t ySpeed; 
};

struct Enemy blob = {
		10,
	10,
	0,
	0,
	1,
	1
};


const unsigned char enemy1[] =
{
  0x3C,0x3C,0x7E,0x7E,0xFF,0xFF,0xFF,0xFF,
  0xFF,0xFF,0xFF,0xFF,0x7E,0x7E,0x3C,0x3C
};

/*
 = {
	10,
	10,
	0,
	0,
	1;
};
*/