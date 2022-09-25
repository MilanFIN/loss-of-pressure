# Loss Of Pressure

A Game Boy game written in C using gbdk-2020

It's a 2d space fighting game where the player has to evade incoming enemies and shoot them while looking out for pickups for upgrades.

The .gb file should be playable with most gameboy emulators. 
Also works on original hardware either with a flashcart or by reflashing a reproduction cartridge. 
For flashing cartridges, GBxCart RW has the widest compatability with cheap chinese stuff.
Saving is not implemented as the cartridges I used didn't have any sram.

## Compiling

Get gbdk-2020, then set GBDK_HOME variable in Makefile to point to the compiler location.

To build just run `make` at project root. The game binary is generated under build/gb/<name>main.gb

For running the game check out bgb emulator to see vram contents at runtime in addition to other debug features.

## Binaries

See https://milanfin.itch.io/TBD

## Images

tbd
