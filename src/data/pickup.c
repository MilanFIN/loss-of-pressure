typedef struct Pickup {

	int16_t x;
	int16_t y;
	uint8_t active;
	uint8_t type; 
	uint8_t amount; //ammo count, only for missiles,
	uint8_t tile; //tile hex in vramn
};

const struct Pickup upgrade =  {
	0, //int16_t x;
	0, //int16_t y;
	0, //uint8_t active;
	0, //uint8_t type; 
	0, //not used
	0x70
};

const struct Pickup ammo =  {
	0, //int16_t x;
	0, //int16_t y;
	0, //uint8_t active;
	1, //uint8_t type; 
	5, //amount of missiles to add
	0x72
};