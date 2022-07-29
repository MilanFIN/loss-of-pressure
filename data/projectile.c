typedef struct Projectile {

	int16_t x;
	int16_t y;
	int8_t xDir;
	int8_t yDir;
	uint8_t speed;
	uint8_t damage;
	uint8_t active;
};

struct Projectile weakProjectile =  {
	0, //int16_t x;
	0, //int16_t y;
	0, //int8_t xDir;
	-1, //int8_t yDir;
	2, //int8_t speed;
	0, //int8_t damage;
	1 //active
};