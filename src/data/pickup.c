typedef struct Pickup {
	uint8_t visible;
	int16_t x;
	int16_t y;
	uint8_t active;
	uint8_t type; 
	uint8_t amount; //amount to add to a property (hp, ammo etc),
	uint8_t tile; //tile hex in vramn
};

const struct Pickup upgrade =  {
	1, //visible
	0, //int16_t x;
	0, //int16_t y;
	0, //uint8_t active;
	0, //uint8_t type; 
	0, //not used
	0x70
};

const struct Pickup ammo =  {
	1, //visible
	0, //int16_t x;
	0, //int16_t y;
	0, //uint8_t active;
	1, //uint8_t type; 
	5, //amount of missiles to add
	0x72
};

const struct Pickup health =  {
	1, //visible
	0, //int16_t x;
	0, //int16_t y;
	0, //uint8_t active;
	2, //uint8_t type; 
	50, //amount of hull points to add
	0x74
};