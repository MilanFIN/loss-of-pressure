typedef struct Explosion {
	uint8_t visible;
	uint8_t x;
	uint8_t y;
	uint8_t frame;
	uint8_t frameCounter;
	uint8_t tile; //tile hex in vramn
};

const struct Explosion ex =  {
	0, //visible
	0, //uint8_t x;
	0, //uint8_t y;
	0,//frame
	0, //uint8_t framecounter;
	0 //uint8_t tile; //tile hex in vramn
};