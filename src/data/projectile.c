typedef struct Projectile {

	int16_t x;
	int16_t y;
	int8_t offset;
	int8_t xSpeed;
	int8_t ySpeed;
	uint8_t speed;
	int16_t damage;
	uint8_t active;
	uint8_t delay; //cooldown after shot (frames),
	uint8_t type; //tile number for first tile (3 total per type)
};

struct Projectile singleGun =  {
	0, //int16_t x;
	0, //int16_t y;,
	0, //offset
	0, //int8_t xDir;
	-1, //int8_t yDir;
	2, //int8_t speed;
	50, //int8_t damage;
	1, //active
	15, //delay
	0x20
};

struct Projectile doubleGun =  {
	0, //int16_t x;
	0, //int16_t y;
	0, //offset
	0, //int8_t xDir;
	-1, //int8_t yDir;
	2, //int8_t speed;
	70, //int8_t damage;
	1, //active
	15, //delay
	0x26
};

struct Projectile missile =  {
	0, //int16_t x;
	0, //int16_t y;
	0, //offset
	0, //int8_t xDir;
	-1, //int8_t yDir;
	1, //int8_t speed;
	100, //int8_t damage;
	1, //active
	30, //delay
	0x2c
};

