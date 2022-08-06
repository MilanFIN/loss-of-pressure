

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

	0x40,// sprite0;
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

struct Enemy bomb =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x42,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0// ySpeed; 
};

struct Enemy miniship =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x44,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0// ySpeed; 
};

struct Enemy bigblob =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x50,// sprite0;
	0x52,//uint8_t sprite1;

	2,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0// ySpeed; 
};

struct Enemy shieldship =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x54,// sprite0;
	0x56,//uint8_t sprite1;

	2,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0// ySpeed; 
};
const uint8_t enemyOptionCount = 5;
struct Enemy enemyOptions[5];
