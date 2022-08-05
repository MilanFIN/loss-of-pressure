

typedef struct Enemy {
	int16_t x;
	int16_t y;

	int8_t xReserve;
	int8_t yReserve;

	uint8_t sprite0;
	uint8_t sprite1;

	uint8_t spriteCount;

	uint8_t alive;
	uint8_t visible;
	uint8_t damage;

	int8_t speed;
	uint8_t accel;
	int8_t xSpeed;
	int8_t ySpeed; 
};

struct Enemy blob =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x30,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0// ySpeed; 
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