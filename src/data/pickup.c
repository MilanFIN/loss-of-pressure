typedef struct Pickup {

	int16_t x;
	int16_t y;
	uint8_t active;
	uint8_t type; //tile hex for first tile 
};

struct Pickup ammo =  {
	0, //int16_t x;
	0, //int16_t y;
	0, //uint8_t active;
	0 //uint8_t type; //tile hex for first tile 
};

struct Pickup weapon =  {
	0, //int16_t x;
	0, //int16_t y;
	0, //uint8_t active;
	0 //uint8_t type; //tile hex for first tile 
};