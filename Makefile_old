AS = /home/milan/Documents/gameboy/gbdk/bin/lcc -Wa-l -Wl-m -c
CC = /home/milan/Documents/gameboy/gbdk/bin/lcc -Wa-l -Wl-m


BIN = main.gb
OBJS = main.o

all: $(BIN)

%.s: %.ms
	maccer -o $@ $<

$(BIN): $(OBJS)
	$(CC) -o $(BIN) $(OBJS)

clean:
	rm -rf $(BIN) $(OBJS) *~
