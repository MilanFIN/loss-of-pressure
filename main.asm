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
	.globl _initProjectiles
	.globl _moveProjectiles
	.globl _fire
	.globl _updateShieldsAndHull
	.globl _checkCollision
	.globl _takeDamage
	.globl _move
	.globl _initEnemies
	.globl _updateEnemyPositions
	.globl _moveSpritesWithBackground
	.globl _abs
	.globl _i16Clamp
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
	.globl _yOverflow
	.globl _xOverflow
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
	.globl _fireCooldown
	.globl _oldestProjectile
	.globl _weakProjectile
	.globl _blob
	.globl _shieldlabel
	.globl _hullabel
	.globl _min_font
	.globl _shield
	.globl _hull
	.globl _joydata
	.globl _projectiles
	.globl _enemies
	.globl _PROJECTILECOUNT
	.globl _ySpawnPositions
	.globl _xSpawnPositions
	.globl _ENEMYCOUNT
	.globl _EMPTYSPRITE
	.globl _BLANK
	.globl _projectile1
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
	.ds 100
_projectiles::
	.ds 45
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
	.ds 20
_weakProjectile::
	.ds 9
_oldestProjectile::
	.ds 1
_fireCooldown::
	.ds 1
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
_xOverflow::
	.ds 2
_yOverflow::
	.ds 2
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
;main.c:76: void interruptLCD(){
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;main.c:77: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:78: }
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
_projectile1:
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
_xSpawnPositions:
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0xb0	; 176
_ySpawnPositions:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0x5c	; 92
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
_PROJECTILECOUNT:
	.db #0x05	; 5
;main.c:80: void setHealthBar(uint8_t row, uint8_t hp) {
;	---------------------------------
; Function setHealthBar
; ---------------------------------
_setHealthBar::
	add	sp, #-5
;main.c:81: if (hp >= 80) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x50
	jr	C, 00102$
;main.c:82: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x50};
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
;main.c:83: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:84: return;
	jp	00109$
00102$:
;main.c:86: if (hp >= 60) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00104$
;main.c:87: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x00};
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
;main.c:88: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:89: return;
	jp	00109$
00104$:
;main.c:91: if (hp >= 40) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00106$
;main.c:92: unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
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
;main.c:93: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:94: return;
	jr	00109$
00106$:
;main.c:96: if (hp >= 20) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x14
	jr	C, 00108$
;main.c:97: unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
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
;main.c:98: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:99: return;
	jr	00109$
00108$:
;main.c:101: unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
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
;main.c:102: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:103: return;
00109$:
;main.c:105: }
	add	sp, #5
	ret
;main.c:107: void updateDirection() {
;	---------------------------------
; Function updateDirection
; ---------------------------------
_updateDirection::
	add	sp, #-4
;main.c:111: if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;main.c:112: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:113: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00102$:
;main.c:115: if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;main.c:116: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:117: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00106$:
;main.c:119: if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;main.c:120: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:121: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00110$:
;main.c:123: if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;main.c:124: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:125: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00114$:
;main.c:129: if ((joydata & J_UP) && (joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;main.c:130: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:131: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00118$:
;main.c:133: if ((joydata & J_UP) && (joydata & J_LEFT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
	ld	a, d
	or	a, e
	jr	Z, 00121$
;main.c:134: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:135: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00121$:
;main.c:137: if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00124$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;main.c:138: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:139: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00124$:
;main.c:141: if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
	ld	a, b
	or	a, c
	jr	Z, 00127$
	ld	a, d
	or	a, e
	jr	Z, 00127$
;main.c:142: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:143: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00127$:
;main.c:148: if (xDir == 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00130$
	ld	a, (#_yDir)
	or	a, a
;main.c:149: return;
	jp	Z,00157$
00130$:
;main.c:152: uint8_t direction = 0;
	ld	c, #0x00
;main.c:154: if (xDir == 0 && yDir < 0) {
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
;main.c:155: direction = 0;
	ld	c, #0x00
00133$:
;main.c:157: if (xDir > 0 && yDir < 0) {
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
;main.c:158: direction = 1;
	ld	c, #0x01
00136$:
;main.c:160: if (xDir > 0 && yDir == 0) {
	ld	a, b
	or	a, a
	jr	Z, 00139$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00139$
;main.c:161: direction = 2;
	ld	c, #0x02
00139$:
;main.c:163: if (xDir > 0 && yDir > 0) {
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
;main.c:164: direction = 3;
	ld	c, #0x03
00142$:
;main.c:166: if (xDir == 0 && yDir > 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00145$
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
;main.c:167: direction = 4;
	ld	c, #0x04
00145$:
;main.c:169: if (xDir < 0 && yDir > 0) {
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
;main.c:170: direction = 5;
	ld	c, #0x05
00148$:
;main.c:172: if (xDir < 0 && yDir == 0) {
	ld	a, b
	or	a, a
	jr	Z, 00151$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00151$
;main.c:173: direction = 6;
	ld	c, #0x06
00151$:
;main.c:175: if (xDir < 0 && yDir < 0) {
	ld	a, b
	or	a, a
	jr	Z, 00154$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00154$
;main.c:176: direction = 7;
	ld	c, #0x07
00154$:
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:179: set_sprite_tile(0, direction);
00157$:
;main.c:180: }
	add	sp, #4
	ret
;main.c:183: int8_t clamp( int8_t value, int8_t min, int8_t max )
;	---------------------------------
; Function clamp
; ---------------------------------
_clamp::
;main.c:185: return (value < min) ? min : (value > max) ? max : value;
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
;main.c:186: }
	ret
;main.c:189: uint8_t uClamp( uint8_t value, uint8_t min, uint8_t max )
;	---------------------------------
; Function uClamp
; ---------------------------------
_uClamp::
;main.c:191: return (value < min) ? min : (value > max) ? max : value;
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
;main.c:192: }
	ret
;main.c:194: uint16_t u16Clamp( uint16_t value, uint16_t min, uint16_t max )
;	---------------------------------
; Function u16Clamp
; ---------------------------------
_u16Clamp::
;main.c:196: return (value < min) ? min : (value > max) ? max : value;
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
;main.c:197: }
	ret
;main.c:199: int16_t i16Clamp( int16_t value, int16_t min, int16_t max )
;	---------------------------------
; Function i16Clamp
; ---------------------------------
_i16Clamp::
;main.c:201: return (value < min) ? min : (value > max) ? max : value;
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
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
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
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
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
;main.c:202: }
	ret
;main.c:203: int8_t abs(int8_t value) {
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;main.c:204: if (value >= 0) return value;
	ldhl	sp,	#2
	bit	7, (hl)
	jr	NZ, 00102$
	ld	e, (hl)
	ret
00102$:
;main.c:205: else return - value;
	xor	a, a
	ldhl	sp,	#2
	sub	a, (hl)
	ld	e, a
;main.c:206: }
	ret
;main.c:208: void moveSpritesWithBackground(int8_t x, int8_t y) {
;	---------------------------------
; Function moveSpritesWithBackground
; ---------------------------------
_moveSpritesWithBackground::
	add	sp, #-5
;main.c:209: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#4
	ld	(hl), #0x00
00103$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NC, 00105$
;main.c:210: enemies[i].x -= x;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#7
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:211: enemies[i].y -= y;
	pop	de
	push	de
	ld	hl, #0x0002
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
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#8
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:209: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#4
	inc	(hl)
	jr	00103$
00105$:
;main.c:222: }
	add	sp, #5
	ret
;main.c:226: void updateEnemyPositions() {
;	---------------------------------
; Function updateEnemyPositions
; ---------------------------------
_updateEnemyPositions::
	add	sp, #-15
;main.c:229: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#14
	ld	(hl), #0x00
00138$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	jp	NC, 00117$
;main.c:231: enemies[i].x -= xOverflow;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	b, a
	inc	de
	ld	a, (de)
	ld	c, a
	ld	e, b
	ld	d, c
	ld	hl, #_xOverflow
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
	pop	de
	push	de
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:271: enemies[i].y += yMovement;
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;main.c:232: enemies[i].y -= yOverflow;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_yOverflow
	sub	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	sbc	a, (hl)
	ld	b, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:235: if (enemies[i].x < playerDrawX) {
	ld	a, (#_playerDrawX)
	ldhl	sp,	#8
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:236: enemies[i].xSpeed += enemies[i].accel;
	pop	de
	push	de
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
;main.c:248: enemies[i].xSpeed = i16Clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
;main.c:236: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:235: if (enemies[i].x < playerDrawX) {
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00242$
	bit	7, d
	jr	NZ, 00243$
	cp	a, a
	jr	00243$
00242$:
	bit	7, d
	jr	Z, 00243$
	scf
00243$:
	jr	NC, 00102$
;main.c:236: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00103$
00102$:
;main.c:239: enemies[i].xSpeed -= enemies[i].accel;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	c, e
	ld	b, a
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00103$:
;main.c:241: if (enemies[i].y < playerDrawY) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_playerDrawY)
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:242: enemies[i].ySpeed += enemies[i].accel;
	pop	de
	push	de
	ld	hl, #0x0012
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;main.c:236: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;main.c:242: enemies[i].ySpeed += enemies[i].accel;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
;main.c:236: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,	#12
	ld	(hl), b
	inc	hl
	ld	(hl), #0x00
;main.c:242: enemies[i].ySpeed += enemies[i].accel;
	ld	b, a
;main.c:241: if (enemies[i].y < playerDrawY) {
	ldhl	sp,	#8
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00244$
	bit	7, d
	jr	NZ, 00245$
	cp	a, a
	jr	00245$
00244$:
	bit	7, d
	jr	Z, 00245$
	scf
00245$:
	jr	NC, 00105$
;main.c:242: enemies[i].ySpeed += enemies[i].accel;
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00106$
00105$:
;main.c:245: enemies[i].ySpeed -= enemies[i].accel;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	c, e
	ld	b, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00106$:
;main.c:248: enemies[i].xSpeed = i16Clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	pop	de
	push	de
	ld	hl, #0x000d
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
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0000
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	push	bc
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_i16Clamp
	add	sp, #6
	ld	c, e
	ld	b, d
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:249: enemies[i].ySpeed = i16Clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	de, #0x0000
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	push	bc
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_i16Clamp
	add	sp, #6
	ld	c, e
	ld	b, d
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:252: enemies[i].xReserve += enemies[i].xSpeed;
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
	ldhl	sp,	#11
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;main.c:253: enemies[i].yReserve += enemies[i].ySpeed;
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;main.c:257: if (enemies[i].xReserve >> 3 > 0) {
	ldhl	sp,	#11
;main.c:252: enemies[i].xReserve += enemies[i].xSpeed;
	ld	a, (hl+)
	ld	c, a
	sra	c
	sra	c
	sra	c
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;main.c:257: if (enemies[i].xReserve >> 3 > 0) {
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00246$
	bit	7, d
	jr	NZ, 00247$
	cp	a, a
	jr	00247$
00246$:
	bit	7, d
	jr	Z, 00247$
	scf
00247$:
	jr	NC, 00110$
;main.c:258: int8_t xMovement = enemies[i].xReserve >> 3;
	ldhl	sp,	#11
	ld	a, (hl)
	sra	a
	sra	a
	sra	a
	ld	(hl), a
;main.c:259: enemies[i].x += xMovement;
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:260: enemies[i].xReserve -=  xMovement << 3;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	push	af
	ld	a, (hl+)
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00111$
00110$:
;main.c:263: else if ((-enemies[i].xReserve) >> 3 > 0){
	ldhl	sp,	#11
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00248$
	bit	7, d
	jr	NZ, 00249$
	cp	a, a
	jr	00249$
00248$:
	bit	7, d
	jr	Z, 00249$
	scf
00249$:
	jr	NC, 00111$
;main.c:264: int8_t xMovement = -((-enemies[i].xReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#11
	ld	(hl), c
;main.c:265: enemies[i].x += xMovement;
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:266: enemies[i].xReserve +=  (-xMovement) << 3;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	xor	a, a
	sub	a, (hl)
	inc	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00111$:
;main.c:269: if (enemies[i].yReserve >> 3 > 0) {
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
	ld	a, (hl-)
	sra	a
	sra	a
	sra	a
	ld	(hl), a
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00250$
	bit	7, d
	jr	NZ, 00251$
	cp	a, a
	jr	00251$
00250$:
	bit	7, d
	jr	Z, 00251$
	scf
00251$:
	jr	NC, 00115$
;main.c:270: int8_t yMovement = enemies[i].yReserve >> 3;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	(hl), a
;main.c:271: enemies[i].y += yMovement;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#13
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:272: enemies[i].yReserve -=  yMovement << 3;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	ldhl	sp,	#15
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00139$
00115$:
;main.c:274: else if ((-enemies[i].yReserve) >> 3 > 0){
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ld	de, #0x0000
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00252$
	bit	7, d
	jr	NZ, 00253$
	cp	a, a
	jr	00253$
00252$:
	bit	7, d
	jr	Z, 00253$
	scf
00253$:
	jr	NC, 00139$
;main.c:275: int8_t yMovement = -((-enemies[i].yReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#13
	ld	(hl), c
;main.c:276: enemies[i].y += yMovement;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#13
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:277: enemies[i].yReserve +=  (-yMovement) << 3;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	xor	a, a
	ldhl	sp,	#13
	sub	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	c, a
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00139$:
;main.c:229: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#14
	inc	(hl)
	jp	00138$
00117$:
;main.c:288: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#14
	ld	(hl), #0x00
00141$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	jp	NC, 00143$
;main.c:290: if (enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
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
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#13
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00132$
;main.c:291: if (enemies[i].visible == 1) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
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
	ld	a, (de)
	ld	(hl), a
;main.c:292: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
;main.c:294: set_sprite_tile(10+i, 0x7f);
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
;main.c:292: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#4
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;main.c:294: set_sprite_tile(10+i, 0x7f);
	add	a, #0x0a
	ldhl	sp,	#13
	ld	(hl), a
;main.c:292: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	a, b
	rlca
	and	a,#0x01
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;main.c:291: if (enemies[i].visible == 1) {
	push	hl
	ldhl	sp,	#12
	ld	a, (hl)
	dec	a
	pop	hl
	jr	NZ, 00129$
;main.c:292: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	a, l
	or	a, a
	jr	NZ, 00118$
	ld	e, b
	ld	d, #0x00
	ld	a, #0xac
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00256$
	bit	7, d
	jr	NZ, 00257$
	cp	a, a
	jr	00257$
00256$:
	bit	7, d
	jr	Z, 00257$
	scf
00257$:
	jr	C, 00118$
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	bit	7, b
	jr	NZ, 00118$
	ld	e, b
	ld	d, #0x00
	ld	a, #0x98
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00258$
	bit	7, d
	jr	NZ, 00259$
	cp	a, a
	jr	00259$
00258$:
	bit	7, d
	jr	Z, 00259$
	scf
00259$:
	jr	NC, 00132$
00118$:
;main.c:293: enemies[i].visible = 0;
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:294: set_sprite_tile(10+i, 0x7f);
	ldhl	sp,	#13
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x7f
;main.c:294: set_sprite_tile(10+i, 0x7f);
	jr	00132$
00129$:
;main.c:298: if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
	bit	0, l
	jr	NZ, 00132$
	ld	a, c
	sub	a, #0xac
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00132$
	ldhl	sp,#11
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
	jr	Z, 00260$
	bit	7, d
	jr	NZ, 00261$
	cp	a, a
	jr	00261$
00260$:
	bit	7, d
	jr	Z, 00261$
	scf
00261$:
	jr	NC, 00132$
	ld	a, c
	sub	a, #0x98
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00132$
;main.c:299: enemies[i].visible = 1;
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:300: set_sprite_tile(10+i, enemies[i].sprite0);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#13
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;main.c:300: set_sprite_tile(10+i, enemies[i].sprite0);
00132$:
;main.c:305: move_sprite(10+i, enemies[i].x, enemies[i].y);
	ldhl	sp,	#14
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_enemies
	add	hl, de
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	b, a
	ld	c, (hl)
	ldhl	sp,	#14
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
	ld	de, #_shadow_OAM
	add	hl, de
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:288: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#14
	inc	(hl)
	jp	00141$
00143$:
;main.c:307: }
	add	sp, #15
	ret
;main.c:309: void initEnemies(uint8_t loadSprites) {
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	add	sp, #-11
;main.c:311: if (loadSprites) {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
;main.c:313: set_sprite_data(9, 2, enemy1);
	ld	de, #_enemy1
	push	de
	ld	hl, #0x209
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:318: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
00116$:
	ldhl	sp,	#10
	ld	(hl), #0x00
00109$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, c
	jp	NC, 00111$
;main.c:319: if (enemies[i].alive == 0) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
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
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	NZ, 00110$
;main.c:321: enemies[i] = blob;
	inc	hl
	ld	bc, #_blob
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	push	hl
	push	bc
	push	de
	call	___memcpy
	add	sp, #6
;main.c:324: uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
	call	_rand
	ld	a, e
	and	a, #0x07
	ld	c, a
;main.c:325: enemies[i].x = xSpawnPositions[posIndex];
	ld	hl, #_xSpawnPositions
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:326: enemies[i].y = ySpawnPositions[posIndex];
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	hl, #_ySpawnPositions
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:329: set_sprite_tile(10+i, enemies[i].sprite0);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	add	a, #0x0a
	ldhl	sp,	#5
	ld	(hl), a
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00134$:
	ldhl	sp,	#8
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00134$
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
	ld	d, (hl)
	ldhl	sp,	#4
;main.c:330: move_sprite(10+i, enemies[i].x, enemies[i].y);
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00135$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00135$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;main.c:330: move_sprite(10+i, enemies[i].x, enemies[i].y);
00110$:
;main.c:318: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#10
	inc	(hl)
	jp	00109$
00111$:
;main.c:333: }
	add	sp, #11
	ret
;main.c:336: void move() {
;	---------------------------------
; Function move
; ---------------------------------
_move::
;main.c:340: if (joydata & J_A) {
	ld	a, (#_joydata)
	bit	4, a
	jr	Z, 00102$
;main.c:341: xSpeed += xDir + xDir + xDir;
	ld	hl, #_xDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_xSpeed
	add	a, (hl)
	ld	(hl), a
;main.c:342: ySpeed += yDir + yDir + yDir;
	ld	hl, #_yDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_ySpeed
	add	a, (hl)
	ld	(hl), a
00102$:
;main.c:346: xSpeed = clamp(xSpeed, -100, 100);
	ld	hl, #0x649c
	push	hl
	ld	a, (#_xSpeed)
	push	af
	inc	sp
	call	_clamp
	add	sp, #3
	ld	hl, #_xSpeed
	ld	(hl), e
;main.c:347: ySpeed = clamp(ySpeed, -100, 100);
	ld	hl, #0x649c
	push	hl
	ld	a, (#_ySpeed)
	push	af
	inc	sp
	call	_clamp
	add	sp, #3
	ld	hl, #_ySpeed
	ld	(hl), e
;main.c:349: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;main.c:350: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;main.c:355: uint8_t xCollisionPoint = playerDrawX -4; 
	ld	hl, #_playerDrawX
	ld	b, (hl)
	ld	a, b
	add	a, #0xfc
	ld	c, a
;main.c:357: if (xSpeed > 0) {
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
;main.c:358: xCollisionPoint = playerDrawX; //right edge
	ld	hl, #_playerDrawX
	ld	c, (hl)
00104$:
;main.c:360: if (xSpeed < 0) {
	ld	a, (#_xSpeed)
	bit	7, a
	jr	Z, 00106$
;main.c:361: xCollisionPoint = playerDrawX -8; //left edge
	ld	a, b
	add	a, #0xf8
	ld	c, a
00106$:
;main.c:365: int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;
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
;main.c:369: uint8_t bgindY = ((playerDrawY-12 + bgY) >> 3)%32; 
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
;main.c:372: uint16_t ind = 32*bgindY + bgindX;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;main.c:373: uint8_t result = background1[ind] != BLANK[0];
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
;main.c:374: if (result == 0) {
	xor	a,#0x01
	jp	NZ, 00111$
;main.c:375: playerX+=xSpeed;
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
;main.c:377: uint16_t limitedPlayerX = u16Clamp(playerX, 58<<5, 110<<5);//0->160, with 8 px margin for left edge & 50px for the edges
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
;main.c:379: xOverflow = (playerX - limitedPlayerX);
	ld	a, (#_playerX)
	sub	a, c
	ld	(#_xOverflow),a
	ld	a, (#_playerX + 1)
	sbc	a, b
	ld	hl, #_xOverflow + 1
;main.c:380: if (xOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_xOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00108$
;main.c:381: xOverflow = xOverflow >> 5;
	ld	hl, #_xOverflow + 1
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
;main.c:384: xOverflow = -((-xOverflow) >> 5);
	xor	a, a
	ld	hl, #_xOverflow
	sub	a, (hl)
	inc	hl
	ld	e, a
	sbc	a, a
	sub	a, (hl)
	dec	hl
	ld	d, a
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	xor	a, a
	sub	a, e
	ld	(hl+), a
	sbc	a, a
	sub	a, d
	ld	(hl), a
00109$:
;main.c:386: bgX += xOverflow;
	ld	a, (#_bgX)
	ld	hl, #_xOverflow
	add	a, (hl)
	ld	hl, #_bgX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_xOverflow + 1
	adc	a, (hl)
	ld	(#_bgX + 1),a
;main.c:387: playerX = limitedPlayerX;
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;main.c:388: playerDrawX=playerX >> 5;
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
;main.c:396: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
00112$:
;main.c:404: uint8_t yCollisionPoint = playerDrawY -12; 
	ld	hl, #_playerDrawY
	ld	b, (hl)
	ld	a, b
	add	a, #0xf4
	ld	c, a
;main.c:406: if (ySpeed > 0) {
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
;main.c:407: yCollisionPoint = playerDrawY - 8; //bottom edge, only half the height, so -8
	ld	a, b
	add	a, #0xf8
	ld	c, a
00114$:
;main.c:409: if (ySpeed < 0) {
	ld	a, (#_ySpeed)
	bit	7, a
	jr	Z, 00116$
;main.c:410: yCollisionPoint = playerDrawY -16; //top edge, 
	ld	a, b
	add	a, #0xf0
	ld	c, a
00116$:
;main.c:414: bgindX = ((playerDrawX -4 + bgX) >> 3)%32;
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
;main.c:417: bgindY = ((yCollisionPoint + bgY) >> 3)%32; 
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
;main.c:420: ind = 32*bgindY + bgindX;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;main.c:421: result = background1[ind] != BLANK[0];
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
;main.c:422: if (result == 0) {
	xor	a,#0x01
	jp	NZ, 00121$
;main.c:423: playerY += ySpeed;
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
;main.c:425: uint16_t limitedPlayerY = u16Clamp(playerY, 61<<5, 107<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
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
	ld	c, e
	ld	b, d
;main.c:427: yOverflow = (playerY - limitedPlayerY);
	ld	a, (#_playerY)
	sub	a, c
	ld	(#_yOverflow),a
	ld	a, (#_playerY + 1)
	sbc	a, b
	ld	hl, #_yOverflow + 1
;main.c:428: if (yOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_yOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00118$
;main.c:429: yOverflow = yOverflow >> 5;
	ld	hl, #_yOverflow + 1
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
;main.c:432: yOverflow = -((-yOverflow) >> 5);
	xor	a, a
	ld	hl, #_yOverflow
	sub	a, (hl)
	inc	hl
	ld	e, a
	sbc	a, a
	sub	a, (hl)
	dec	hl
	ld	d, a
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	xor	a, a
	sub	a, e
	ld	(hl+), a
	sbc	a, a
	sub	a, d
	ld	(hl), a
00119$:
;main.c:434: bgY += yOverflow;
	ld	a, (#_bgY)
	ld	hl, #_yOverflow
	add	a, (hl)
	ld	hl, #_bgY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_yOverflow + 1
	adc	a, (hl)
	ld	(#_bgY + 1),a
;main.c:435: playerY = limitedPlayerY;
	ld	hl, #_playerY
	ld	a, c
	ld	(hl+), a
;main.c:436: playerDrawY=playerY >> 5;
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
	ld	hl, #_playerDrawY
	ld	(hl), c
	jr	00122$
00121$:
;main.c:441: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
00122$:
;main.c:445: move_sprite(0, playerDrawX, playerDrawY);
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
;main.c:448: if (bgX >= 256) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00124$
;main.c:449: bgX = bgX % 256;
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
;main.c:451: if (bgX < 0) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00126$
;main.c:452: bgX = 255 - (bgX % 256);
	xor	a, a
	inc	a
	push	af
	push	bc
	call	__modsint
	add	sp, #4
	ld	a, #0xff
	sub	a, e
	ld	c, a
	sbc	a, a
	sub	a, d
	ld	hl, #_bgX
	ld	(hl), c
	inc	hl
	ld	(hl), a
00126$:
;main.c:454: if (bgY >= 256) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00128$
;main.c:455: bgY = bgY % 256;
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
;main.c:457: if (bgY < 0) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00130$
;main.c:458: bgY = 255 - (bgY % 256);
	xor	a, a
	inc	a
	push	af
	push	bc
	call	__modsint
	add	sp, #4
	ld	a, #0xff
	sub	a, e
	ld	c, a
	sbc	a, a
	sub	a, d
	ld	hl, #_bgY
	ld	(hl), c
	inc	hl
	ld	(hl), a
00130$:
;main.c:461: move_bkg(bgX, bgY);
	ld	hl, #_bgY
	ld	c, (hl)
	ld	a, (#_bgX)
	ldh	(_SCX_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;main.c:464: if (ySpeed > 0) ySpeed--;
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
;main.c:465: if (ySpeed < 0) ySpeed++;
	ld	hl, #_ySpeed
	bit	7, (hl)
	jr	Z, 00134$
	inc	(hl)
00134$:
;main.c:466: if (xSpeed > 0) xSpeed--;
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
;main.c:467: if (xSpeed < 0) xSpeed++;
	ld	hl, #_xSpeed
	bit	7, (hl)
	ret	Z
	inc	(hl)
;main.c:471: }
	ret
;main.c:473: void takeDamage(int16_t amount) {
;	---------------------------------
; Function takeDamage
; ---------------------------------
_takeDamage::
	dec	sp
;main.c:474: if (amount > shield) {
	ld	a, (#_shield)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
;main.c:476: hull -= (amount - shield);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:474: if (amount > shield) {
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
;main.c:475: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;main.c:476: hull -= (amount - shield);
	ld	a, (#_hull)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_hull),a
	jr	00104$
00102$:
;main.c:479: shield -= amount;
	ld	a, (#_shield)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_shield),a
00104$:
;main.c:481: }
	inc	sp
	ret
;main.c:483: void checkCollision() {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-14
;main.c:486: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#13
	ld	(hl), #0x00
00112$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, c
	jp	NC, 00114$
;main.c:487: if (enemies[i].visible && enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x000b
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
	ld	hl, #0x000a
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
;main.c:488: uint8_t x = enemies[i].x;
;main.c:489: uint8_t y = enemies[i].y;
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
;main.c:491: if (x > playerDrawX - PLAYERSIZE && x - (8>>(enemies[i].spriteCount-1)) < playerDrawX
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
	ld	hl, #0x0008
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
;main.c:492: && y > playerDrawY - PLAYERSIZE && y -(8>>(enemies[i].spriteCount-1)) < playerDrawY ) 
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
;main.c:494: set_sprite_tile(10+i, 0x7f);
	ldhl	sp,	#13
	ld	a, (hl)
	add	a, #0x0a
	ld	c, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x7f
;main.c:495: enemies[i].alive = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:496: takeDamage(enemies[i].damage);
	pop	de
	push	de
	ld	hl, #0x000c
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
;main.c:497: initEnemies(0);
	xor	a, a
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
00113$:
;main.c:486: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#13
	inc	(hl)
	jp	00112$
00114$:
;main.c:518: }
	add	sp, #14
	ret
;main.c:521: void updateShieldsAndHull() {
;	---------------------------------
; Function updateShieldsAndHull
; ---------------------------------
_updateShieldsAndHull::
;main.c:522: if (shield < maxShield) {
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
;main.c:523: shield += 1;
	ld	hl, #_shield
	inc	(hl)
00102$:
;main.c:525: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:526: setHealthBar(1, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:527: }
	ret
;main.c:529: void fire() {
;	---------------------------------
; Function fire
; ---------------------------------
_fire::
;main.c:536: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	inc	(hl)
	ld	a, (hl)
;main.c:537: if (oldestProjectile >= PROJECTILECOUNT) {
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ld	hl, #_oldestProjectile
	ld	a, (hl)
	sub	a, c
	jr	C, 00102$
;main.c:538: oldestProjectile = 0;
	ld	(hl), #0x00
00102$:
;main.c:541: projectiles[oldestProjectile] = weakProjectile;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	de, #0x0009
	push	de
	ld	de, #_weakProjectile
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
;main.c:542: projectiles[oldestProjectile].x = playerDrawX;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	push	hl
	ld	a, (#_playerDrawX)
	pop	hl
	ld	c, #0x00
	ld	(hl+), a
	ld	(hl), c
;main.c:543: projectiles[oldestProjectile].y = playerDrawY;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	inc	hl
	inc	hl
	push	hl
	ld	a, (#_playerDrawY)
	pop	hl
	ld	c, #0x00
	ld	(hl+), a
	ld	(hl), c
;main.c:545: set_sprite_tile(20+oldestProjectile, 20);
	ld	a, (#_oldestProjectile)
	add	a, #0x14
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x14
;main.c:546: move_sprite(20+oldestProjectile, playerDrawX, playerDrawY);
	ld	hl, #_playerDrawY
	ld	b, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	ld	a, (#_oldestProjectile)
	add	a, #0x14
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:547: fireCooldown = 30;
	ld	hl, #_fireCooldown
	ld	(hl), #0x1e
;main.c:549: }
	ret
;main.c:552: void moveProjectiles() {
;	---------------------------------
; Function moveProjectiles
; ---------------------------------
_moveProjectiles::
	add	sp, #-8
;main.c:554: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#7
	ld	(hl), #0x00
00110$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, c
	jp	NC, 00112$
;main.c:555: projectiles[i].x -= xOverflow;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_xOverflow
	sub	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	sbc	a, (hl)
	ld	b, a
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:556: projectiles[i].y -= yOverflow;
	pop	de
	push	de
	ld	hl, #0x0002
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
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_yOverflow
	sub	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	sbc	a, (hl)
	ld	b, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:558: if (projectiles[i].active) {
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00111$
;main.c:559: int16_t newY = projectiles[i].y - 1;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
;main.c:560: move_sprite(20+i, projectiles[i].x, newY);
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	dec	bc
	ld	a, c
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	add	a, #0x14
	ld	(hl), a
	ld	e, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	e, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	d, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:561: projectiles[i].y = newY;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:565: if (abs(projectiles[i].x - playerDrawX) > 100 || abs(projectiles[i].y - playerDrawY) > 100) {
	pop	de
	push	de
	ld	a, (de)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	push	af
	inc	sp
	call	_abs
	inc	sp
	ld	c,e
	ld	a,#0x64
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00135$
	bit	7, d
	jr	NZ, 00136$
	cp	a, a
	jr	00136$
00135$:
	bit	7, d
	jr	Z, 00136$
	scf
00136$:
	jr	C, 00101$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_playerDrawY
	ld	c, (hl)
	sub	a, c
	push	af
	inc	sp
	call	_abs
	inc	sp
	ld	c,e
	ld	a,#0x64
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00137$
	bit	7, d
	jr	NZ, 00138$
	cp	a, a
	jr	00138$
00137$:
	bit	7, d
	jr	Z, 00138$
	scf
00138$:
	jr	NC, 00111$
00101$:
;main.c:566: projectiles[i].active = 0;
	ldhl	sp,	#7
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_projectiles
	add	hl, de
	ld	bc, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;main.c:567: set_sprite_tile(20+i, 0x7f);
	ldhl	sp,	#6
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
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
	ld	(hl), #0x7f
;main.c:567: set_sprite_tile(20+i, 0x7f);
00111$:
;main.c:554: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#7
	inc	(hl)
	jp	00110$
00112$:
;main.c:572: }
	add	sp, #8
	ret
;main.c:575: void initProjectiles() {
;	---------------------------------
; Function initProjectiles
; ---------------------------------
_initProjectiles::
;main.c:576: set_sprite_data(20, 2, projectile1);
	ld	de, #_projectile1
	push	de
	ld	hl, #0x214
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:578: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	xor	a, a
00103$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	cp	a, c
	ret	NC
	inc	a
;main.c:582: }
	jr	00103$
;main.c:584: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;main.c:587: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:588: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
;main.c:589: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
;main.c:590: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
;main.c:593: playerX = 80<<5;
	ld	hl, #_playerX
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;main.c:594: playerY = 80<<5;
	ld	hl, #_playerY
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;main.c:596: playerDrawX = 80;
	ld	hl, #_playerDrawX
	ld	(hl), #0x50
;main.c:597: playerDrawY = 80;
	ld	hl, #_playerDrawY
	ld	(hl), #0x50
;main.c:600: bgX = 0;
	xor	a, a
	ld	hl, #_bgX
	ld	(hl+), a
	ld	(hl), a
;main.c:601: bgY = 0;
	xor	a, a
	ld	hl, #_bgY
	ld	(hl+), a
	ld	(hl), a
;main.c:603: hull = maxHull;
	ld	a, (#_maxHull)
	ld	(#_hull),a
;main.c:604: shield = maxShield;
	ld	a, (#_maxShield)
	ld	(#_shield),a
;main.c:606: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:607: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;main.c:608: set_sprite_data(0, 8, cross);
	ld	de, #_cross
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:611: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:615: font_init();
	call	_font_init
;main.c:616: min_font = font_load(font_min); // 36 tiles of characters
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_min_font
	ld	a, e
	ld	(hl+), a
;main.c:617: font_set(min_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:618: set_win_tiles(1,0,4,1,hullabel);
	ld	de, #_hullabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:619: set_win_tiles(1,1,5,1,shieldlabel);
	ld	de, #_shieldlabel
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:624: set_bkg_data(0x50,1,healthblock);
	ld	de, #_healthblock
	push	de
	ld	hl, #0x150
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:626: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:627: setHealthBar(1, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x7e
	ldh	(_WY_REG + 0), a
;main.c:630: SHOW_WIN;;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:635: set_bkg_data(0x25, 6, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x625
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:636: set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
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
;main.c:638: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:644: }
	ret
;main.c:646: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:658: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:659: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;main.c:660: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;main.c:661: initrand(seed);
	push	bc
	call	_initrand
	pop	hl
;main.c:666: initGame();
	call	_initGame
;main.c:667: initEnemies(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;main.c:668: initProjectiles();
	call	_initProjectiles
;main.c:670: while(1) {
00107$:
;main.c:673: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;main.c:675: updateDirection(); // set player direction
	call	_updateDirection
;main.c:678: move(); 
	call	_move
;main.c:680: updateEnemyPositions();
	call	_updateEnemyPositions
;main.c:683: checkCollision(); 
	call	_checkCollision
;main.c:685: updateShieldsAndHull();
	call	_updateShieldsAndHull
;main.c:688: if (joydata & J_B && fireCooldown == 0) {
	ld	a, (#_joydata)
	bit	5, a
	jr	Z, 00102$
	ld	a, (#_fireCooldown)
	or	a, a
	jr	NZ, 00102$
;main.c:689: fire();
	call	_fire
00102$:
;main.c:691: if (fireCooldown > 0) {
	ld	hl, #_fireCooldown
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;main.c:692: --fireCooldown;
	dec	(hl)
00105$:
;main.c:695: moveProjectiles();
	call	_moveProjectiles
;main.c:699: struct Enemy *ptr = enemies;
;main.c:700: printf("%d ", (ptr->damage));
	ld	a, (#(_enemies + 12) + 0)
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;main.c:701: ptr++;
;main.c:702: printf("%d\n", (ptr->damage));
	ld	a, (#(_enemies + 32) + 0)
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	de, #___str_1
	push	de
	call	_printf
	add	sp, #4
;main.c:706: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:707: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
;main.c:712: }
	jr	00107$
___str_0:
	.ascii "%d "
	.db 0x00
___str_1:
	.ascii "%d"
	.db 0x0a
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
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x09	; 9
	.db #0x00	; 0
	.dw #0x0001
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.dw #0x000a
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
__xinit__weakProjectile:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
__xinit__oldestProjectile:
	.db #0x00	; 0
__xinit__fireCooldown:
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
__xinit__xOverflow:
	.dw #0x0000
__xinit__yOverflow:
	.dw #0x0000
	.area _CABS (ABS)
