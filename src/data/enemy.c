

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
	int16_t hp; 
};

struct Enemy minispike =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x40,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	25, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	50 //hp
};

struct Enemy minibomb =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x42,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	25, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	50 //hp
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
	25, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	50 //hp
};

struct Enemy miniufo =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x46,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	25, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	50 //hp
};

struct Enemy minibubble =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x48,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	25, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	50 //hp
};
struct Enemy minidual =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x4a,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	25, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	50 //hp
};


struct Enemy minifighter =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x4c,// sprite0;
	0,//uint8_t sprite1;

	1,// spriteCount;

	1, // alive;
	1, // visible;
	25, // damage;

	5,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	50 //hp
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
	0,// ySpeed; 
	70 //hp
};


struct Enemy owl =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x5c,// sprite0;
	0x5f,//uint8_t sprite1;

	2,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	100 //hp
};

struct Enemy calvine =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x60,// sprite0;
	0x62,//uint8_t sprite1;

	2,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	100 //hp
};

struct Enemy xwing =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x64,// sprite0;
	0x68,//uint8_t sprite1;

	2,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	100 //hp
};

struct Enemy destroyer =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x68,// sprite0;
	0x6a,//uint8_t sprite1;

	2,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	100 //hp
};

struct Enemy doublefuse =  {
	0,//x
	0, //y
	0, // xReserve;
	0, // yReserve;

	0x6c,// sprite0;
	0x6e,//uint8_t sprite1;

	2,// spriteCount;

	1, // alive;
	1, // visible;
	50, // damage;

	3,// speed;
	1,// accel;
	0,// xSpeed;
	0,// ySpeed; 
	100 //hp
};
const uint8_t enemyOptionCount = 10;
struct Enemy enemyOptions[10];
