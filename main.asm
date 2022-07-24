;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initGame
	.globl _updateShieldsAndHull
	.globl _checkCollision
	.globl _takeDamage
	.globl _move
	.globl _initEnemies
	.globl _updateEnemyPositions
	.globl _moveEnemiesWithBackground
	.globl _abs
	.globl _u16Clamp
	.globl _uClamp
	.globl _clamp
	.globl _updateDirection
	.globl _setHealthBar
	.globl _interruptLCD
	.globl _rand
	.globl _initrand
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _printf
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _waitpad
	.globl _joypad
	.globl _maxShield
	.globl _maxHull
	.globl _bgY
	.globl _bgX
	.globl _playerDrawY
	.globl _playerDrawX
	.globl _playerY
	.globl _playerX
	.globl _ySpeed
	.globl _xSpeed
	.globl _yDir
	.globl _xDir
	.globl _PLAYERSIZE
	.globl _blob
	.globl _shieldlabel
	.globl _hullabel
	.globl _min_font
	.globl _shield
	.globl _hull
	.globl _joydata
	.globl _enemies
	.globl _ENEMYCOUNT
	.globl _EMPTYSPRITE
	.globl _BLANK
	.globl _enemy1
	.globl _healthblock
	.globl _backgroundtiles
	.globl _background1
	.globl _cross
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_enemies::
	.ds 55
_joydata::
	.ds 1
_hull::
	.ds 1
_shield::
	.ds 1
_min_font::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_hullabel::
	.ds 4
_shieldlabel::
	.ds 4
_blob::
	.ds 11
_PLAYERSIZE::
	.ds 1
_xDir::
	.ds 1
_yDir::
	.ds 1
_xSpeed::
	.ds 1
_ySpeed::
	.ds 1
_playerX::
	.ds 2
_playerY::
	.ds 2
_playerDrawX::
	.ds 1
_playerDrawY::
	.ds 1
_bgX::
	.ds 2
_bgY::
	.ds 2
_maxHull::
	.ds 1
_maxShield::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:52: void interruptLCD(){
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;main.c:53: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:54: }
	ret
_cross:
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_background1:
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x29	; 41
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2a	; 42
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
_backgroundtiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
_healthblock:
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
_enemy1:
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
_BLANK:
	.db #0x26	; 38
_EMPTYSPRITE:
	.db #0x50	; 80	'P'
_ENEMYCOUNT:
	.db #0x05	; 5
;main.c:56: void setHealthBar(uint8_t row, uint8_t hp) {
;	---------------------------------
; Function setHealthBar
; ---------------------------------
_setHealthBar::
	add	sp, #-5
;main.c:57: if (hp >= 80) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x50
	jr	C, 00102$
;main.c:58: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x50};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x50
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x50
;main.c:59: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:60: return;
	jp	00109$
00102$:
;main.c:62: if (hp >= 60) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00104$
;main.c:63: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x00};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x50
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;main.c:64: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:65: return;
	jp	00109$
00104$:
;main.c:67: if (hp >= 40) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00106$
;main.c:68: unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x50
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;main.c:69: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:70: return;
	jr	00109$
00106$:
;main.c:72: if (hp >= 20) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x14
	jr	C, 00108$
;main.c:73: unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x50
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x50
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;main.c:74: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:75: return;
	jr	00109$
00108$:
;main.c:77: unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x50
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;main.c:78: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:79: return;
00109$:
;main.c:81: }
	add	sp, #5
	ret
;main.c:83: void updateDirection() {
;	---------------------------------
; Function updateDirection
; ---------------------------------
_updateDirection::
	add	sp, #-4
;main.c:87: if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
	ld	hl, #_joydata
	ld	e, (hl)
	ld	a, e
	and	a, #0x01
	ldhl	sp,	#0
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, e
	and	a, #0x04
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, e
	and	a, #0x08
	ld	c, a
	ld	b, #0x00
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
	ld	a, b
	or	a, c
	jr	NZ, 00102$
;main.c:88: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:89: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00102$:
;main.c:91: if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
	ld	a, e
	and	a, #0x02
	ld	e, a
	ld	d, #0x00
	ld	a, d
	or	a, e
	jr	Z, 00106$
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00106$
	ld	a, b
	or	a, c
	jr	NZ, 00106$
;main.c:92: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:93: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00106$:
;main.c:95: if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00110$
	ld	a, d
	or	a, e
	jr	NZ, 00110$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00110$
;main.c:96: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:97: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00110$:
;main.c:99: if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00114$
	ld	a, d
	or	a, e
	jr	NZ, 00114$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00114$
;main.c:100: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:101: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00114$:
;main.c:105: if ((joydata & J_UP) && (joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;main.c:106: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:107: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00118$:
;main.c:109: if ((joydata & J_UP) && (joydata & J_LEFT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
	ld	a, d
	or	a, e
	jr	Z, 00121$
;main.c:110: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:111: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00121$:
;main.c:113: if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00124$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;main.c:114: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:115: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00124$:
;main.c:117: if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
	ld	a, b
	or	a, c
	jr	Z, 00127$
	ld	a, d
	or	a, e
	jr	Z, 00127$
;main.c:118: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:119: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00127$:
;main.c:124: if (xDir == 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00130$
	ld	a, (#_yDir)
	or	a, a
;main.c:125: return;
	jp	Z,00157$
00130$:
;main.c:128: uint8_t direction = 0;
	ld	c, #0x00
;main.c:130: if (xDir == 0 && yDir < 0) {
	ld	a, (#_yDir)
	rlca
	and	a,#0x01
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00133$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
;main.c:131: direction = 0;
	ld	c, #0x00
00133$:
;main.c:133: if (xDir > 0 && yDir < 0) {
	ld	hl, #_xDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00349$
	bit	7, d
	jr	NZ, 00350$
	cp	a, a
	jr	00350$
00349$:
	bit	7, d
	jr	Z, 00350$
	scf
00350$:
	ld	a, #0x00
	rla
	ld	b, a
	or	a, a
	jr	Z, 00136$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00136$
;main.c:134: direction = 1;
	ld	c, #0x01
00136$:
;main.c:136: if (xDir > 0 && yDir == 0) {
	ld	a, b
	or	a, a
	jr	Z, 00139$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00139$
;main.c:137: direction = 2;
	ld	c, #0x02
00139$:
;main.c:139: if (xDir > 0 && yDir > 0) {
	ld	hl, #_yDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00351$
	bit	7, d
	jr	NZ, 00352$
	cp	a, a
	jr	00352$
00351$:
	bit	7, d
	jr	Z, 00352$
	scf
00352$:
	ld	a, #0x00
	rla
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, b
	or	a, a
	jr	Z, 00142$
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
;main.c:140: direction = 3;
	ld	c, #0x03
00142$:
;main.c:142: if (xDir == 0 && yDir > 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00145$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
;main.c:143: direction = 4;
	ld	c, #0x04
00145$:
;main.c:145: if (xDir < 0 && yDir > 0) {
	ld	a, (#_xDir)
	rlca
	and	a,#0x01
	ld	b, a
	or	a, a
	jr	Z, 00148$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00148$
;main.c:146: direction = 5;
	ld	c, #0x05
00148$:
;main.c:148: if (xDir < 0 && yDir == 0) {
	ld	a, b
	or	a, a
	jr	Z, 00151$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00151$
;main.c:149: direction = 6;
	ld	c, #0x06
00151$:
;main.c:151: if (xDir < 0 && yDir < 0) {
	ld	a, b
	or	a, a
	jr	Z, 00154$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00154$
;main.c:152: direction = 7;
	ld	c, #0x07
00154$:
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:155: set_sprite_tile(0, direction);
00157$:
;main.c:156: }
	add	sp, #4
	ret
;main.c:159: int8_t clamp( int8_t value, int8_t min, int8_t max )
;	---------------------------------
; Function clamp
; ---------------------------------
_clamp::
;main.c:161: return (value < min) ? min : (value > max) ? max : value;
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00117$
	bit	7, d
	jr	NZ, 00118$
	cp	a, a
	jr	00118$
00117$:
	bit	7, d
	jr	Z, 00118$
	scf
00118$:
	jr	NC, 00103$
	ldhl	sp,	#3
	ld	e, (hl)
	ret
00103$:
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	bit	7, e
	jr	Z, 00119$
	bit	7, d
	jr	NZ, 00120$
	cp	a, a
	jr	00120$
00119$:
	bit	7, d
	jr	Z, 00120$
	scf
00120$:
	jr	NC, 00105$
	ldhl	sp,	#4
	ld	e, (hl)
	ret
00105$:
	ldhl	sp,	#2
	ld	e, (hl)
;main.c:162: }
	ret
;main.c:165: uint8_t uClamp( uint8_t value, uint8_t min, uint8_t max )
;	---------------------------------
; Function uClamp
; ---------------------------------
_uClamp::
;main.c:167: return (value < min) ? min : (value > max) ? max : value;
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, (hl)
	jr	NC, 00103$
	ld	e, (hl)
	ret
00103$:
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NC, 00105$
	inc	hl
	inc	hl
	ld	e, (hl)
	ret
00105$:
	ldhl	sp,	#2
	ld	e, (hl)
;main.c:168: }
	ret
;main.c:170: uint16_t u16Clamp( uint16_t value, uint16_t min, uint16_t max )
;	---------------------------------
; Function u16Clamp
; ---------------------------------
_u16Clamp::
;main.c:172: return (value < min) ? min : (value > max) ? max : value;
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00103$
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ret
00103$:
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00105$
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ret
00105$:
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;main.c:173: }
	ret
;main.c:175: int8_t abs(int8_t value) {
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;main.c:176: if (value >= 0) return value;
	ldhl	sp,	#2
	bit	7, (hl)
	jr	NZ, 00102$
	ld	e, (hl)
	ret
00102$:
;main.c:177: else return - value;
	xor	a, a
	ldhl	sp,	#2
	sub	a, (hl)
	ld	e, a
;main.c:178: }
	ret
;main.c:180: void moveEnemiesWithBackground(int16_t x, int16_t y) {
;	---------------------------------
; Function moveEnemiesWithBackground
; ---------------------------------
_moveEnemiesWithBackground::
	add	sp, #-5
;main.c:181: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#4
	ld	(hl), #0x00
00103$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NC, 00105$
;main.c:182: enemies[i].x -= x;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_enemies
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	e, c
	ld	d, b
	ld	a, (hl+)
	ld	(de), a
	inc	de
;main.c:183: enemies[i].y -= y;
	ld	a, (hl-)
	ld	(de), a
	inc	bc
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:181: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#4
	inc	(hl)
	jr	00103$
00105$:
;main.c:185: }
	add	sp, #5
	ret
;main.c:187: void updateEnemyPositions() {
;	---------------------------------
; Function updateEnemyPositions
; ---------------------------------
_updateEnemyPositions::
	add	sp, #-12
;main.c:188: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#11
	ld	(hl), #0x00
00121$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jp	NC, 00123$
;main.c:190: if (enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00115$
;main.c:191: if (enemies[i].visible == 1) {
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;main.c:192: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;main.c:194: set_sprite_tile(10+i, EMPTYSPRITE);
	ldhl	sp,	#11
	ld	a, (hl)
;main.c:192: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#7
	ld	(hl), c
	inc	hl
	ld	(hl), b
;main.c:194: set_sprite_tile(10+i, EMPTYSPRITE);
	inc	hl
	add	a, #0x0a
;main.c:192: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	rlca
	and	a,#0x01
	ld	(hl), a
;main.c:191: if (enemies[i].visible == 1) {
	ldhl	sp,	#4
	ld	a, (hl)
	dec	a
	jp	NZ,00112$
;main.c:192: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#10
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
	ldhl	sp,	#7
	ld	a, #0xac
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00183$
	bit	7, d
	jr	NZ, 00184$
	cp	a, a
	jr	00184$
00183$:
	bit	7, d
	jr	Z, 00184$
	scf
00184$:
	jr	C, 00101$
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	bit	7, b
	jr	NZ, 00101$
	ld	e, b
	ld	d, #0x00
	ld	a, #0x98
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00185$
	bit	7, d
	jr	NZ, 00186$
	cp	a, a
	jr	00186$
00185$:
	bit	7, d
	jr	Z, 00186$
	scf
00186$:
	jp	NC, 00115$
00101$:
;main.c:193: enemies[i].visible = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:194: set_sprite_tile(10+i, EMPTYSPRITE);
	ld	a, (#_EMPTYSPRITE)
	ldhl	sp,	#10
	ld	(hl-), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00187$:
	ldhl	sp,	#8
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00187$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;main.c:194: set_sprite_tile(10+i, EMPTYSPRITE);
	jp	00115$
00112$:
;main.c:198: if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
	ldhl	sp,	#10
	bit	0, (hl)
	jp	NZ, 00115$
	ldhl	sp,	#7
	ld	a, (hl+)
	sub	a, #0xac
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00188$
	bit	7, d
	jr	NZ, 00189$
	cp	a, a
	jr	00189$
00188$:
	bit	7, d
	jr	Z, 00189$
	scf
00189$:
	jp	NC, 00115$
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00190$
	bit	7, d
	jr	NZ, 00191$
	cp	a, a
	jr	00191$
00190$:
	bit	7, d
	jr	Z, 00191$
	scf
00191$:
	jr	NC, 00115$
	ld	a, c
	sub	a, #0x98
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00115$
;main.c:199: enemies[i].visible = 1;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:200: set_sprite_tile(10+i, enemies[i].sprite0);
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	(hl-), a
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00192$:
	ldhl	sp,	#8
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00192$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;main.c:200: set_sprite_tile(10+i, enemies[i].sprite0);
00115$:
;main.c:205: move_sprite(10+i, enemies[i].x, enemies[i].y);
	ldhl	sp,	#11
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_enemies
	add	hl, de
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	add	a, #0x0a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	e, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	d, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(de), a
	inc	de
	ldhl	sp,	#10
;main.c:188: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ld	a, (hl+)
	ld	(de), a
	inc	(hl)
	jp	00121$
00123$:
;main.c:207: }
	add	sp, #12
	ret
;main.c:209: void initEnemies() {
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	add	sp, #-5
;main.c:212: set_sprite_data(9, 1, enemy1);
	ld	de, #_enemy1
	push	de
	ld	hl, #0x109
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:215: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#4
	ld	(hl), #0x00
00105$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jp	NC, 00107$
;main.c:216: enemies[i].x = (rand() & 7) << 3;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_enemies
	add	hl,bc
	push	hl
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x07
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	l, c
	ld	h, b
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:217: enemies[i].y = (rand() & 7) << 3;
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	e, h
	ldhl	sp,	#0
	ld	(hl+), a
	ld	a, e
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:219: enemies[i].sprite0 = 9;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	(hl), #0x09
;main.c:220: enemies[i].spriteCount = 1;
	ld	hl, #0x0006
	add	hl, bc
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:221: enemies[i].alive = 1;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x01
;main.c:222: enemies[i].visible = 1;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x01
;main.c:223: enemies[i].damage = 50;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x32
;main.c:225: set_sprite_tile(10+i, enemies[i].sprite0);
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	add	a, #0x0a
	ld	(hl), a
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;main.c:226: move_sprite(10+i, enemies[i].x, enemies[i].y);
	ldhl	sp,	#0
	ld	e, (hl)
	ld	a, (bc)
	ldhl	sp,	#3
	ld	(hl-), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	c, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	b, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(bc), a
	inc	bc
	ldhl	sp,	#3
;main.c:215: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ld	a, (hl+)
	ld	(bc), a
	inc	(hl)
	jp	00105$
00107$:
;main.c:228: }
	add	sp, #5
	ret
;main.c:231: void move() {
;	---------------------------------
; Function move
; ---------------------------------
_move::
	add	sp, #-8
;main.c:235: if (joydata & J_A) {
	ld	a, (#_joydata)
	bit	4, a
	jr	Z, 00102$
;main.c:236: xSpeed += xDir + xDir + xDir;
	ld	hl, #_xDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_xSpeed
	add	a, (hl)
	ld	(hl), a
;main.c:237: ySpeed += yDir + yDir + yDir;
	ld	hl, #_yDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_ySpeed
	add	a, (hl)
	ld	(hl), a
00102$:
;main.c:241: xSpeed = clamp(xSpeed, -100, 100);
	ld	hl, #0x649c
	push	hl
	ld	a, (#_xSpeed)
	push	af
	inc	sp
	call	_clamp
	add	sp, #3
	ld	hl, #_xSpeed
	ld	(hl), e
;main.c:242: ySpeed = clamp(ySpeed, -100, 100);
	ld	hl, #0x649c
	push	hl
	ld	a, (#_ySpeed)
	push	af
	inc	sp
	call	_clamp
	add	sp, #3
	ld	hl, #_ySpeed
	ld	(hl), e
;main.c:244: int16_t xOverflow = 0;
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
;main.c:245: int16_t yOverflow = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), a
;main.c:250: uint8_t xCollisionPoint = playerDrawX -4; 
	ld	hl, #_playerDrawX
	ld	b, (hl)
	ld	a, b
	add	a, #0xfc
	ld	c, a
;main.c:252: if (xSpeed > 0) {
	ld	hl, #_xSpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00229$
	bit	7, d
	jr	NZ, 00230$
	cp	a, a
	jr	00230$
00229$:
	bit	7, d
	jr	Z, 00230$
	scf
00230$:
	jr	NC, 00104$
;main.c:253: xCollisionPoint = playerDrawX; //right edge
	ld	hl, #_playerDrawX
	ld	c, (hl)
00104$:
;main.c:255: if (xSpeed < 0) {
	ld	a, (#_xSpeed)
	bit	7, a
	jr	Z, 00106$
;main.c:256: xCollisionPoint = playerDrawX -8; //left edge
	ld	a, b
	add	a, #0xf8
	ld	c, a
00106$:
;main.c:260: int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;
	ld	b, #0x00
	ld	a, c
	ld	hl, #_bgX
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	de, #0x0020
	push	de
	push	bc
	call	__modsint
	add	sp, #4
;main.c:264: uint8_t bgindY = ((playerDrawY-12 + bgY) >> 3)%32; 
	ld	a, (#_playerDrawY)
	ld	b, #0x00
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, c
	ld	hl, #_bgY
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	push	de
	ld	hl, #0x0020
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	pop	de
;main.c:267: uint16_t ind = 32*bgindY + bgindX;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;main.c:268: uint8_t result = background1[ind] != BLANK[0];
	ld	bc,#_background1
	add	hl,bc
	ld	c, (hl)
	ld	hl, #_BLANK
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	a, #0x01
	jr	Z, 00232$
	xor	a, a
00232$:
;main.c:269: if (result == 0) {
	xor	a,#0x01
	jp	NZ, 00111$
;main.c:270: playerX+=xSpeed;
	ld	a, (#_xSpeed)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_playerX
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_playerX + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	a, h
	ld	hl, #_playerX
	ld	(hl), c
	inc	hl
;main.c:272: uint16_t limitedPlayerX = u16Clamp(playerX, 58<<5, 110<<5);//0->160, with 8 px margin for left edge & 50px for the edges
	ld	(hl-), a
	ld	de, #0x0dc0
	push	de
	ld	de, #0x0740
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_u16Clamp
	add	sp, #6
	ld	c, e
	ld	b, d
;main.c:274: xOverflow = (playerX - limitedPlayerX);
	ld	hl, #_playerX
	ld	a, (hl+)
	sub	a, c
	ld	e, a
	ld	a, (hl)
	sbc	a, b
	ld	d, a
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
;main.c:275: if (xOverflow >= 0) {
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	bit	7, (hl)
	jr	NZ, 00108$
;main.c:276: xOverflow = xOverflow >> 5;
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	jr	00109$
00108$:
;main.c:279: xOverflow = -((-xOverflow) >> 5);
	ld	de, #0x0000
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	de, #0x0000
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
00109$:
;main.c:281: bgX += xOverflow;
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_bgX
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:282: playerX = limitedPlayerX;
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;main.c:283: playerDrawX=playerX >> 5;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	hl, #_playerDrawX
	ld	(hl), c
	jr	00112$
00111$:
;main.c:291: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
00112$:
;main.c:299: uint8_t yCollisionPoint = playerDrawY -12; 
	ld	hl, #_playerDrawY
	ld	b, (hl)
	ld	a, b
	add	a, #0xf4
	ld	c, a
;main.c:301: if (ySpeed > 0) {
	ld	hl, #_ySpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00233$
	bit	7, d
	jr	NZ, 00234$
	cp	a, a
	jr	00234$
00233$:
	bit	7, d
	jr	Z, 00234$
	scf
00234$:
	jr	NC, 00114$
;main.c:302: yCollisionPoint = playerDrawY - 8; //bottom edge, only half the height, so -8
	ld	a, b
	add	a, #0xf8
	ld	c, a
00114$:
;main.c:304: if (ySpeed < 0) {
	ld	a, (#_ySpeed)
	bit	7, a
	jr	Z, 00116$
;main.c:305: yCollisionPoint = playerDrawY -16; //top edge, 
	ld	a, b
	add	a, #0xf0
	ld	c, a
00116$:
;main.c:309: bgindX = ((playerDrawX -4 + bgX) >> 3)%32;
	ld	a, (#_playerDrawX)
	ld	b, #0x00
	add	a, #0xfc
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	ld	a, e
	ld	hl, #_bgX
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, (hl)
	ld	d, a
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	push	bc
	ld	hl, #0x0020
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
;main.c:312: bgindY = ((yCollisionPoint + bgY) >> 3)%32; 
	ld	b, #0x00
	ld	a, c
	ld	hl, #_bgY
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	push	de
	ld	hl, #0x0020
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	pop	de
;main.c:315: ind = 32*bgindY + bgindX;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;main.c:316: result = background1[ind] != BLANK[0];
	ld	de, #_background1
	add	hl, de
	ld	c, (hl)
	ld	hl, #_BLANK
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	a, #0x01
	jr	Z, 00236$
	xor	a, a
00236$:
;main.c:317: if (result == 0) {
	xor	a,#0x01
	jp	NZ, 00121$
;main.c:318: playerY += ySpeed;
	ld	a, (#_ySpeed)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_playerY
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_playerY + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_playerY
	ld	a, c
	ld	(hl+), a
;main.c:320: uint16_t limitedPlayerY = u16Clamp(playerY, 61<<5, 107<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
	ld	a, b
	ld	(hl-), a
	ld	de, #0x0d60
	push	de
	ld	de, #0x07a0
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_u16Clamp
	add	sp, #6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:322: yOverflow = (playerY - limitedPlayerY);
	ld	hl, #_playerY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	inc	sp
	inc	sp
	push	bc
	bit	7, b
	jr	NZ, 00118$
;main.c:324: yOverflow = yOverflow >> 5;
	ldhl	sp,	#1
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	jr	00119$
00118$:
;main.c:327: yOverflow = -((-yOverflow) >> 5);
	ld	de, #0x0000
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	ld	de, #0x0000
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
00119$:
;main.c:329: bgY += yOverflow;
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_bgY
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:330: playerY = limitedPlayerY;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(#_playerY),a
	ldhl	sp,	#5
	ld	a, (hl)
	ld	hl, #_playerY + 1
;main.c:331: playerDrawY=playerY >> 5;
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	hl, #_playerDrawY
	ld	(hl), c
	jr	00122$
00121$:
;main.c:336: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
00122$:
;main.c:340: move_sprite(0, playerDrawX, playerDrawY);
	ld	hl, #_playerDrawY
	ld	c, (hl)
	ld	hl, #_playerDrawX
	ld	b, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:343: if (bgX >= 256) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00124$
;main.c:344: bgX = bgX % 256;
	xor	a, a
	inc	a
	push	af
	push	bc
	call	__modsint
	add	sp, #4
	ld	hl, #_bgX
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00124$:
;main.c:346: if (bgX < 0) {
	ld	a, (#_bgX)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (#_bgX + 1)
	ldhl	sp,	#7
	ld	(hl), a
	bit	7, (hl)
	jr	Z, 00126$
;main.c:347: bgX = 255 - (bgX % 256);
	dec	hl
	xor	a, a
	inc	a
	push	af
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__modsint
	add	sp, #4
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	de, #0x00ff
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	ld	(#_bgX),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#_bgX + 1),a
00126$:
;main.c:349: if (bgY >= 256) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00128$
;main.c:350: bgY = bgY % 256;
	xor	a, a
	inc	a
	push	af
	push	bc
	call	__modsint
	add	sp, #4
	ld	hl, #_bgY
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00128$:
;main.c:352: if (bgY < 0) {
	ld	a, (#_bgY)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, (#_bgY + 1)
	ldhl	sp,	#7
	ld	(hl), a
	bit	7, (hl)
	jr	Z, 00130$
;main.c:353: bgY = 255 - (bgY % 256);
	dec	hl
	xor	a, a
	inc	a
	push	af
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__modsint
	add	sp, #4
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	de, #0x00ff
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl)
	ld	(#_bgY),a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(#_bgY + 1),a
00130$:
;main.c:356: move_bkg(bgX, bgY);
	ld	hl, #_bgY
	ld	c, (hl)
	ld	a, (#_bgX)
	ldh	(_SCX_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;main.c:357: moveEnemiesWithBackground(xOverflow, yOverflow);
	pop	de
	push	de
	push	de
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_moveEnemiesWithBackground
	add	sp, #4
;main.c:360: if (ySpeed > 0) ySpeed--;
	ld	hl, #_ySpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00237$
	bit	7, d
	jr	NZ, 00238$
	cp	a, a
	jr	00238$
00237$:
	bit	7, d
	jr	Z, 00238$
	scf
00238$:
	jr	NC, 00132$
	ld	hl, #_ySpeed
	dec	(hl)
00132$:
;main.c:361: if (ySpeed < 0) ySpeed++;
	ld	hl, #_ySpeed
	bit	7, (hl)
	jr	Z, 00134$
	inc	(hl)
00134$:
;main.c:362: if (xSpeed > 0) xSpeed--;
	ld	hl, #_xSpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00239$
	bit	7, d
	jr	NZ, 00240$
	cp	a, a
	jr	00240$
00239$:
	bit	7, d
	jr	Z, 00240$
	scf
00240$:
	jr	NC, 00136$
	ld	hl, #_xSpeed
	dec	(hl)
00136$:
;main.c:363: if (xSpeed < 0) xSpeed++;
	ld	hl, #_xSpeed
	bit	7, (hl)
	jr	Z, 00141$
	inc	(hl)
00141$:
;main.c:367: }
	add	sp, #8
	ret
;main.c:369: void takeDamage(int16_t amount) {
;	---------------------------------
; Function takeDamage
; ---------------------------------
_takeDamage::
	dec	sp
;main.c:370: if (amount > shield) {
	ld	a, (#_shield)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
;main.c:372: hull -= (amount - shield);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:370: if (amount > shield) {
	ldhl	sp,	#3
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00111$
	bit	7, d
	jr	NZ, 00112$
	cp	a, a
	jr	00112$
00111$:
	bit	7, d
	jr	Z, 00112$
	scf
00112$:
	jr	NC, 00102$
;main.c:371: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;main.c:372: hull -= (amount - shield);
	ld	a, (#_hull)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_hull),a
	jr	00104$
00102$:
;main.c:375: shield -= amount;
	ld	a, (#_shield)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_shield),a
00104$:
;main.c:377: }
	inc	sp
	ret
;main.c:379: void checkCollision() {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-14
;main.c:382: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#13
	ld	(hl), #0x00
00112$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, c
	jp	NC, 00114$
;main.c:383: if (enemies[i].visible && enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00113$
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jp	Z, 00113$
;main.c:384: uint8_t x = enemies[i].x;
;main.c:385: uint8_t y = enemies[i].y;
	inc	hl
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	inc	de
	inc	de
	ld	a, (de)
	ld	(hl), a
;main.c:387: if (x > playerDrawX - PLAYERSIZE && x - (8>>(enemies[i].spriteCount-1)) < playerDrawX
	ld	a, (#_playerDrawX)
	ldhl	sp,	#11
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, (#_PLAYERSIZE)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
	ld	b, #0x00
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00157$
	bit	7, d
	jr	NZ, 00158$
	cp	a, a
	jr	00158$
00157$:
	bit	7, d
	jr	Z, 00158$
	scf
00158$:
	jp	NC, 00113$
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	dec	e
	ldhl	sp,	#7
	ld	a, #0x08
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	inc	e
	jr	00160$
00159$:
	ldhl	sp,	#8
	sra	(hl)
	dec	hl
	rr	(hl)
00160$:
	dec	e
	jr	NZ, 00159$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#11
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00161$
	bit	7, d
	jr	NZ, 00162$
	cp	a, a
	jr	00162$
00161$:
	bit	7, d
	jr	Z, 00162$
	scf
00162$:
	jp	NC, 00113$
;main.c:388: && y > playerDrawY - PLAYERSIZE && y -(8>>(enemies[i].spriteCount-1)) < playerDrawY ) 
	ld	a, (#_playerDrawY)
	ldhl	sp,	#9
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#11
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	NC, 00113$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00165$
	bit	7, d
	jr	NZ, 00166$
	cp	a, a
	jr	00166$
00165$:
	bit	7, d
	jr	Z, 00166$
	scf
00166$:
	jr	NC, 00113$
;main.c:390: set_sprite_tile(10+i, EMPTYSPRITE);
	ld	hl, #_EMPTYSPRITE
	ld	c, (hl)
	ldhl	sp,	#13
	ld	a, (hl)
	add	a, #0x0a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;main.c:391: enemies[i].alive = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:392: takeDamage(enemies[i].damage);
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_takeDamage
	pop	hl
00113$:
;main.c:382: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#13
	inc	(hl)
	jp	00112$
00114$:
;main.c:399: }
	add	sp, #14
	ret
;main.c:402: void updateShieldsAndHull() {
;	---------------------------------
; Function updateShieldsAndHull
; ---------------------------------
_updateShieldsAndHull::
;main.c:403: if (shield < maxShield) {
	ld	hl, #_maxShield
	ld	e, (hl)
	ld	a, (#_shield)
	ld	d,a
	ld	hl, #_maxShield
	sub	a, (hl)
	bit	7, e
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	jr	NC, 00102$
;main.c:404: shield += 1;
	ld	hl, #_shield
	inc	(hl)
00102$:
;main.c:406: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:407: setHealthBar(1, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:408: }
	ret
;main.c:410: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;main.c:413: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:414: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
;main.c:415: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
;main.c:416: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
;main.c:419: playerX = 80<<5;
	ld	hl, #_playerX
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;main.c:420: playerY = 80<<5;
	ld	hl, #_playerY
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;main.c:422: playerDrawX = 80;
	ld	hl, #_playerDrawX
	ld	(hl), #0x50
;main.c:423: playerDrawY = 80;
	ld	hl, #_playerDrawY
	ld	(hl), #0x50
;main.c:426: bgX = 0;
	xor	a, a
	ld	hl, #_bgX
	ld	(hl+), a
	ld	(hl), a
;main.c:427: bgY = 0;
	xor	a, a
	ld	hl, #_bgY
	ld	(hl+), a
	ld	(hl), a
;main.c:429: hull = maxHull;
	ld	a, (#_maxHull)
	ld	(#_hull),a
;main.c:430: shield = maxShield;
	ld	a, (#_maxShield)
	ld	(#_shield),a
;main.c:432: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:433: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;main.c:434: set_sprite_data(0, 8, cross);
	ld	de, #_cross
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:437: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:441: font_init();
	call	_font_init
;main.c:442: min_font = font_load(font_min); // 36 tiles of characters
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_min_font
	ld	a, e
	ld	(hl+), a
;main.c:443: font_set(min_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:444: set_win_tiles(1,0,4,1,hullabel);
	ld	de, #_hullabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:445: set_win_tiles(1,1,5,1,shieldlabel);
	ld	de, #_shieldlabel
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:450: set_bkg_data(0x50,1,healthblock);
	ld	de, #_healthblock
	push	de
	ld	hl, #0x150
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:452: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:453: setHealthBar(1, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x7c
	ldh	(_WY_REG + 0), a
;main.c:456: SHOW_WIN;;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:461: set_bkg_data(0x25, 6, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x625
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:462: set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
	ld	de, #_background1
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;main.c:464: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:470: }
	ret
;main.c:472: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:483: printf("PRESS A TO START");
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;main.c:484: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:485: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;main.c:486: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;main.c:487: initrand(seed);
	push	bc
	call	_initrand
	pop	hl
;main.c:492: initGame();
	call	_initGame
;main.c:493: initEnemies();
	call	_initEnemies
;main.c:495: while(1) {
00102$:
;main.c:496: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;main.c:498: updateDirection(); // set player direction
	call	_updateDirection
;main.c:501: move(); 
	call	_move
;main.c:503: updateEnemyPositions();
	call	_updateEnemyPositions
;main.c:506: checkCollision(); 
	call	_checkCollision
;main.c:508: updateShieldsAndHull();
	call	_updateShieldsAndHull
;main.c:510: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:511: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
;main.c:516: }
	jr	00102$
___str_0:
	.ascii "PRESS A TO START"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__hullabel:
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x16	; 22
__xinit__shieldlabel:
	.db #0x1d	; 29
	.db #0x12	; 18
	.db #0x16	; 22
	.db #0x0e	; 14
__xinit__blob:
	.dw #0x000a
	.dw #0x000a
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0001
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__PLAYERSIZE:
	.db #0x08	; 8
__xinit__xDir:
	.db #0x00	;  0
__xinit__yDir:
	.db #0x00	;  0
__xinit__xSpeed:
	.db #0x00	;  0
__xinit__ySpeed:
	.db #0x00	;  0
__xinit__playerX:
	.dw #0x0a00
__xinit__playerY:
	.dw #0x0a00
__xinit__playerDrawX:
	.db #0x50	; 80	'P'
__xinit__playerDrawY:
	.db #0x50	; 80	'P'
__xinit__bgX:
	.dw #0x0000
__xinit__bgY:
	.dw #0x0000
__xinit__maxHull:
	.db #0x64	;  100	'd'
__xinit__maxShield:
	.db #0x64	;  100	'd'
	.area _CABS (ABS)
