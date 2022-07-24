

typedef struct Enemy {
	int16_t x;
	int16_t y;

	uint8_t sprite0;
	uint8_t sprite1;

	unsigned int spriteCount;

	uint8_t alive;
	uint8_t visible;
	uint8_t damage;
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