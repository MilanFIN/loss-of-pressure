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
	.globl _setGunIcon
	.globl _checkCollision
	.globl _takeDamage
	.globl _move
	.globl _initEnemies
	.globl _updateEnemyPositions
	.globl _playSound
	.globl _updateDirection
	.globl _incrementScore
	.globl _updateScore
	.globl _setHealthBar
	.globl _interruptLCD
	.globl _bcd2text
	.globl _bcd_add
	.globl _rand
	.globl _initrand
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _waitpad
	.globl _joypad
	.globl _add_LCD
	.globl _INCREMENT
	.globl _bcd
	.globl _score
	.globl _gunMap
	.globl _switchDelay
	.globl _currentGun
	.globl _enemyCollisionCount
	.globl _yOverflow
	.globl _xOverflow
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
	.globl _fireCooldown
	.globl _oldestProjectile
	.globl _missile
	.globl _doubleGun
	.globl _singleGun
	.globl _blob
	.globl _scorelabel
	.globl _weaponlabel
	.globl _shieldlabel
	.globl _hullabel
	.globl _min_font
	.globl _shield
	.globl _hull
	.globl _joydata
	.globl _projectiles
	.globl _enemies
	.globl _GUNCOUNT
	.globl _maxShield
	.globl _maxHull
	.globl _PLAYERSIZE
	.globl _PROJECTILECOUNT
	.globl _ySpawnPositions
	.globl _xSpawnPositions
	.globl _ENEMYCOUNT
	.globl _EMPTYSPRITE
	.globl _BLANK
	.globl _BLANKSIZE
	.globl _Player1
	.globl _ProjectileTiles
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
	.ds 80
_projectiles::
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
_weaponlabel::
	.ds 4
_scorelabel::
	.ds 4
_blob::
	.ds 16
_singleGun::
	.ds 11
_doubleGun::
	.ds 11
_missile::
	.ds 11
_oldestProjectile::
	.ds 1
_fireCooldown::
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
_xOverflow::
	.ds 2
_yOverflow::
	.ds 2
_enemyCollisionCount::
	.ds 1
_currentGun::
	.ds 1
_switchDelay::
	.ds 1
_gunMap::
	.ds 3
_score::
	.ds 2
_bcd::
	.ds 4
_INCREMENT::
	.ds 4
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
;main.c:101: void interruptLCD()
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;main.c:103: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:104: }
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
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
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
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x2b	; 43
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
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x2b	; 43
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
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x2b	; 43
_backgroundtiles:
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x3a	; 58
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x9a	; 154
	.db #0x5e	; 94
	.db #0xe9	; 233
	.db #0x7a	; 122	'z'
	.db #0x87	; 135
	.db #0x76	; 118	'v'
	.db #0xb9	; 185
	.db #0x3c	; 60
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x3c	; 60
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
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x1c	; 28
	.db #0x23	; 35
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x1b	; 27
	.db #0x64	; 100	'd'
	.db #0x31	; 49	'1'
	.db #0x4e	; 78	'N'
	.db #0xb1	; 177
	.db #0xce	; 206
	.db #0xbb	; 187
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xbe	; 190
	.db #0x01	; 1
	.db #0xbc	; 188
	.db #0x02	; 2
	.db #0xce	; 206
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x61	; 97	'a'
	.db #0xf4	; 244
	.db #0x02	; 2
	.db #0x94	; 148
	.db #0x62	; 98	'b'
	.db #0xe4	; 228
	.db #0x02	; 2
	.db #0x6c	; 108	'l'
	.db #0x82	; 130
	.db #0x70	; 112	'p'
	.db #0x8c	; 140
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x8e	; 142
	.db #0xf7	; 247
	.db #0x8f	; 143
	.db #0xf3	; 243
	.db #0x86	; 134
	.db #0xf9	; 249
	.db #0x42	; 66	'B'
	.db #0x7d	; 125
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x28	; 40
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x66	; 102	'f'
	.db #0x24	; 36
	.db #0xe7	; 231
	.db #0x66	; 102	'f'
	.db #0xf7	; 247
	.db #0xe7	; 231
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0xef	; 239
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x24	; 36
_ProjectileTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0x99	; 153
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0x60	; 96
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x7e	; 126
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x20	; 32
_Player1:
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x68	; 104	'h'
	.db #0x58	; 88	'X'
	.db #0x50	; 80	'P'
	.db #0x71	; 113	'q'
	.db #0xd0	; 208
	.db #0xb2	; 178
	.db #0xd5	; 213
	.db #0xb6	; 182
	.db #0xd5	; 213
	.db #0xb6	; 182
	.db #0xd5	; 213
	.db #0xb6	; 182
	.db #0xcd	; 205
	.db #0xbe	; 190
	.db #0xc5	; 197
	.db #0xbe	; 190
	.db #0x65	; 101	'e'
	.db #0x5e	; 94
	.db #0x3e	; 62
	.db #0x2f	; 47
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x1a	; 26
	.db #0x0a	; 10
	.db #0x8e	; 142
	.db #0x0b	; 11
	.db #0x4d	; 77	'M'
	.db #0xab	; 171
	.db #0x6d	; 109	'm'
	.db #0xab	; 171
	.db #0x6d	; 109	'm'
	.db #0xab	; 171
	.db #0x6d	; 109	'm'
	.db #0xb3	; 179
	.db #0x7d	; 125
	.db #0xa3	; 163
	.db #0x7d	; 125
	.db #0xa6	; 166
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0xf4	; 244
	.db #0xc8	; 200
	.db #0xc8	; 200
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x31	; 49	'1'
	.db #0x2f	; 47
	.db #0x12	; 18
	.db #0x1e	; 30
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0xaf	; 175
	.db #0xf0	; 240
	.db #0xaf	; 175
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0x12	; 18
	.db #0x1e	; 30
	.db #0x31	; 49	'1'
	.db #0x2f	; 47
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0xf6	; 246
	.db #0xfa	; 250
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0xf6	; 246
	.db #0xfa	; 250
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x38	; 56	'8'
	.db #0x27	; 39
	.db #0x60	; 96
	.db #0x5e	; 94
	.db #0x60	; 96
	.db #0x5c	; 92
	.db #0x41	; 65	'A'
	.db #0x79	; 121	'y'
	.db #0xc4	; 196
	.db #0xb7	; 183
	.db #0x99	; 153
	.db #0xfe	; 254
	.db #0xb3	; 179
	.db #0xec	; 236
	.db #0x67	; 103	'g'
	.db #0x58	; 88	'X'
	.db #0x2e	; 46
	.db #0x31	; 49	'1'
	.db #0x5c	; 92
	.db #0x73	; 115	's'
	.db #0x69	; 105	'i'
	.db #0x5e	; 94
	.db #0x37	; 55	'7'
	.db #0x2d	; 45
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x90	; 144
	.db #0x70	; 112	'p'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0xc3	; 195
	.db #0x65	; 101	'e'
	.db #0xa7	; 167
	.db #0xa7	; 167
	.db #0x65	; 101	'e'
	.db #0xa3	; 163
	.db #0x65	; 101	'e'
	.db #0x03	; 3
	.db #0xcd	; 205
	.db #0x41	; 65	'A'
	.db #0xdf	; 223
	.db #0x86	; 134
	.db #0xba	; 186
	.db #0x86	; 134
	.db #0xfa	; 250
	.db #0x1c	; 28
	.db #0xe4	; 228
	.db #0x78	; 120	'x'
	.db #0xb8	; 184
	.db #0xc0	; 192
	.db #0xc0	; 192
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
_BLANKSIZE:
	.db #0x03	; 3
_BLANK:
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x2c	; 44
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
_PLAYERSIZE:
	.db #0x10	; 16
_maxHull:
	.db #0x64	;  100	'd'
_maxShield:
	.db #0x64	;  100	'd'
_GUNCOUNT:
	.db #0x03	; 3
;main.c:107: void setHealthBar(uint8_t row, uint8_t hp) {
;	---------------------------------
; Function setHealthBar
; ---------------------------------
_setHealthBar::
	add	sp, #-5
;main.c:109: if (hp >= 80) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x50
	jr	C, 00102$
;main.c:110: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x50};
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
;main.c:111: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:112: return;
	jp	00109$
00102$:
;main.c:114: if (hp >= 60) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00104$
;main.c:115: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x00};
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
;main.c:116: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:117: return;
	jp	00109$
00104$:
;main.c:119: if (hp >= 40) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00106$
;main.c:120: unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
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
;main.c:121: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:122: return;
	jr	00109$
00106$:
;main.c:124: if (hp >= 20) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x14
	jr	C, 00108$
;main.c:125: unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
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
;main.c:126: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:127: return;
	jr	00109$
00108$:
;main.c:129: unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
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
;main.c:130: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:131: return;
00109$:
;main.c:133: }
	add	sp, #5
	ret
;main.c:135: void updateScore() {
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
	add	sp, #-10
;main.c:139: len = bcd2text(&bcd, 0x01, buf);
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	de, #_bcd
	push	de
	call	_bcd2text
	add	sp, #5
	pop	bc
;main.c:140: set_win_tiles(15, 1, 5, 1, buf+3);
	inc	bc
	inc	bc
	inc	bc
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x10f
	push	hl
	call	_set_win_tiles
;main.c:141: }
	add	sp, #16
	ret
;main.c:143: void incrementScore() {
;	---------------------------------
; Function incrementScore
; ---------------------------------
_incrementScore::
;main.c:144: score += 1;
	ld	hl, #_score
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:145: bcd_add(&bcd, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_bcd
	push	de
	call	_bcd_add
	add	sp, #4
;main.c:146: }
	ret
;main.c:148: void updateDirection() {
;	---------------------------------
; Function updateDirection
; ---------------------------------
_updateDirection::
	add	sp, #-4
;main.c:152: if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;main.c:153: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:154: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00102$:
;main.c:156: if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;main.c:157: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:158: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00106$:
;main.c:160: if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;main.c:161: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:162: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00110$:
;main.c:164: if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;main.c:165: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:166: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00114$:
;main.c:170: if ((joydata & J_UP) && (joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;main.c:171: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:172: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00118$:
;main.c:174: if ((joydata & J_UP) && (joydata & J_LEFT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
	ld	a, d
	or	a, e
	jr	Z, 00121$
;main.c:175: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:176: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00121$:
;main.c:178: if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00124$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;main.c:179: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;main.c:180: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00124$:
;main.c:182: if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
	ld	a, b
	or	a, c
	jr	Z, 00127$
	ld	a, d
	or	a, e
	jr	Z, 00127$
;main.c:183: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;main.c:184: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00127$:
;main.c:189: if (xDir == 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00130$
	ld	a, (#_yDir)
	or	a, a
;main.c:190: return;
	jp	Z,00195$
00130$:
;main.c:222: if (xDir == 0 && yDir > 0) {
	ld	hl, #_yDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00387$
	bit	7, d
	jr	NZ, 00388$
	cp	a, a
	jr	00388$
00387$:
	bit	7, d
	jr	Z, 00388$
	scf
00388$:
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, (#_xDir)
	or	a,a
	jr	NZ, 00160$
	or	a,c
	jr	Z, 00160$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x40
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x40
;main.c:226: set_sprite_prop(1, S_FLIPY); 
	jp	00195$
00160$:
;main.c:228: else if (xDir == 0 && yDir < 0) {
	ld	a, (#_yDir)
	rlca
	and	a,#0x01
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00156$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00156$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x00
;main.c:232: set_sprite_prop(1, 0); 
	jp	00195$
00156$:
;main.c:234: else if (xDir > 0 && yDir == 0) {
	ld	hl, #_xDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00389$
	bit	7, d
	jr	NZ, 00390$
	cp	a, a
	jr	00390$
00389$:
	bit	7, d
	jr	Z, 00390$
	scf
00390$:
	ld	a, #0x00
	rla
	ld	b, a
	or	a, a
	jr	Z, 00152$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00152$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x06
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x00
;main.c:238: set_sprite_prop(1, 0); 
	jp	00195$
00152$:
;main.c:240: else if (xDir < 0 && yDir == 0) {
	ld	a, (#_xDir)
	rlca
	and	a,#0x01
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00148$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00148$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x04
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x06
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x20
;main.c:244: set_sprite_prop(1, S_FLIPX); 
	jp	00195$
00148$:
;main.c:246: else if (xDir > 0 && yDir < 0) {
	ld	a, b
	or	a, a
	jr	Z, 00144$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00144$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x00
;main.c:250: set_sprite_prop(1, 0); 
	jr	00195$
00144$:
;main.c:252: else if (xDir > 0 && yDir > 0) {
	ld	a, b
	or	a, a
	jr	Z, 00140$
	ld	a, c
	or	a, a
	jr	Z, 00140$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x40
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x40
;main.c:256: set_sprite_prop(1, S_FLIPY); 
	jr	00195$
00140$:
;main.c:258: else if (xDir < 0 && yDir > 0) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00136$
	ld	a, c
	or	a, a
	jr	Z, 00136$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x60
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x60
;main.c:262: set_sprite_prop(1, S_FLIPY | S_FLIPX); 
	jr	00195$
00136$:
;main.c:264: else if (xDir < 0 && yDir < 0) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00195$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00195$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x20
;main.c:268: set_sprite_prop(1, S_FLIPX); 
00195$:
;main.c:270: }
	add	sp, #4
	ret
;main.c:299: void playSound(uint8_t type) {
;	---------------------------------
; Function playSound
; ---------------------------------
_playSound::
;main.c:300: if (type == 20) { //singlegun
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00102$
;main.c:301: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;main.c:302: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;main.c:303: NR12_REG = 0x43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;main.c:304: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:305: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;main.c:306: return;
	ret
00102$:
;main.c:308: if (type == 23) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x17
	jr	NZ, 00104$
;main.c:309: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;main.c:310: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;main.c:311: NR12_REG = 0x53;
	ld	a, #0x53
	ldh	(_NR12_REG + 0), a
;main.c:312: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;main.c:313: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00104$:
;main.c:315: if (type == 26) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x1a
	jr	NZ, 00106$
;main.c:316: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;main.c:317: NR11_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR11_REG + 0), a
;main.c:318: NR12_REG = 0x55;
	ld	a, #0x55
	ldh	(_NR12_REG + 0), a
;main.c:319: NR13_REG = 0x70;//0Xbe;//0x6D;
	ld	a, #0x70
	ldh	(_NR13_REG + 0), a
;main.c:320: NR14_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR14_REG + 0), a
00106$:
;main.c:322: if (type == 0) {  // explosion
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:323: NR41_REG = 0x20;  
	ld	a, #0x20
	ldh	(_NR41_REG + 0), a
;main.c:324: NR42_REG = 0xa2;//0xa3;  
	ld	a, #0xa2
	ldh	(_NR42_REG + 0), a
;main.c:325: NR43_REG = 0x57;  
	ld	a, #0x57
	ldh	(_NR43_REG + 0), a
;main.c:326: NR44_REG = 0x80;  
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;main.c:332: }
	ret
;main.c:335: void updateEnemyPositions() {
;	---------------------------------
; Function updateEnemyPositions
; ---------------------------------
_updateEnemyPositions::
	add	sp, #-16
;main.c:337: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	ld	(hl), #0x00
00143$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jp	NC, 00120$
;main.c:338: if (!enemies[i].alive) {
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x04
00279$:
	ldhl	sp,	#13
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00279$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_enemies
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
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00119$
;main.c:341: enemies[i].x -= xOverflow;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ldhl	sp,	#12
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:342: enemies[i].y -= yOverflow;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
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
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:345: if (enemies[i].x < playerDrawX) {
	ld	hl, #_playerDrawX
	ld	c, (hl)
	ld	b, #0x00
;main.c:346: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
;main.c:345: if (enemies[i].x < playerDrawX) {
	ldhl	sp,	#11
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00280$
	bit	7, d
	jr	NZ, 00281$
	cp	a, a
	jr	00281$
00280$:
	bit	7, d
	jr	Z, 00281$
	scf
00281$:
	jr	NC, 00104$
;main.c:346: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,	#14
	ld	a, (hl-)
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00105$
00104$:
;main.c:349: enemies[i].xSpeed -= enemies[i].accel;
	ldhl	sp,	#13
	ld	a, (hl+)
	sub	a, (hl)
	ld	c, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00105$:
;main.c:351: if (enemies[i].y < playerDrawY) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_playerDrawY
	ld	c, (hl)
	ld	b, #0x00
;main.c:352: enemies[i].ySpeed += enemies[i].accel;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
;main.c:351: if (enemies[i].y < playerDrawY) {
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00282$
	bit	7, d
	jr	NZ, 00283$
	cp	a, a
	jr	00283$
00282$:
	bit	7, d
	jr	Z, 00283$
	scf
00283$:
	jr	NC, 00107$
;main.c:352: enemies[i].ySpeed += enemies[i].accel;
	ldhl	sp,	#14
	ld	a, (hl-)
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00108$
00107$:
;main.c:355: enemies[i].ySpeed -= enemies[i].accel;
	ldhl	sp,	#13
	ld	a, (hl+)
	sub	a, (hl)
	ld	c, a
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00108$:
;main.c:358: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
	xor	a, a
	sub	a, e
	ld	(hl), a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
;main.c:275: return (value < min) ? min : (value > max) ? max : value;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00284$
	bit	7, d
	jr	NZ, 00285$
	cp	a, a
	jr	00285$
00284$:
	bit	7, d
	jr	Z, 00285$
	scf
00285$:
	jr	NC, 00149$
	ldhl	sp,	#13
	ld	a, (hl)
	jr	00150$
00149$:
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	bit	7, e
	jr	Z, 00286$
	bit	7, d
	jr	NZ, 00287$
	cp	a, a
	jr	00287$
00286$:
	bit	7, d
	jr	Z, 00287$
	scf
00287$:
	jr	NC, 00151$
	ldhl	sp,	#12
	ld	a, (hl)
	jr	00152$
00151$:
	ldhl	sp,	#14
	ld	a, (hl)
00152$:
00150$:
;main.c:358: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#8
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;main.c:359: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ld	a, (bc)
	ld	b, a
	ld	c, b
	xor	a, a
	sub	a, b
	ld	b, a
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;main.c:275: return (value < min) ? min : (value > max) ? max : value;
	ld	e, b
	ld	a,l
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00288$
	bit	7, d
	jr	NZ, 00289$
	cp	a, a
	jr	00289$
00288$:
	bit	7, d
	jr	Z, 00289$
	scf
00289$:
	jr	NC, 00153$
	ld	c, b
	jr	00154$
00153$:
	ld	e, l
	ld	a,c
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00290$
	bit	7, d
	jr	NZ, 00291$
	cp	a, a
	jr	00291$
00290$:
	bit	7, d
	jr	Z, 00291$
	scf
00291$:
	jr	C, 00156$
	ld	c, l
00156$:
00154$:
;main.c:359: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;main.c:362: enemies[i].xReserve += enemies[i].xSpeed;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, b
	ld	b, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;main.c:363: enemies[i].yReserve += enemies[i].ySpeed;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
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
;main.c:367: if (enemies[i].xReserve >> 3 > 0) {
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	sra	b
	sra	b
	sra	b
	ld	e, b
	xor	a, a
	ld	d, a
	sub	a, b
	bit	7, e
	jr	Z, 00292$
	bit	7, d
	jr	NZ, 00293$
	cp	a, a
	jr	00293$
00292$:
	bit	7, d
	jr	Z, 00293$
	scf
00293$:
	jr	NC, 00112$
;main.c:368: int8_t xMovement = enemies[i].xReserve >> 3;
	ld	a, c
	sra	a
	sra	a
	sra	a
	ldhl	sp,	#12
	ld	(hl), a
;main.c:369: enemies[i].x += xMovement;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#12
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
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:370: enemies[i].xReserve -=  xMovement << 3;
	ldhl	sp,#13
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
	jr	00113$
00112$:
;main.c:373: else if ((-enemies[i].xReserve) >> 3 > 0){
	ld	a, c
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
	jr	Z, 00294$
	bit	7, d
	jr	NZ, 00295$
	cp	a, a
	jr	00295$
00294$:
	bit	7, d
	jr	Z, 00295$
	scf
00295$:
	jr	NC, 00113$
;main.c:374: int8_t xMovement = -((-enemies[i].xReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#12
	ld	(hl), c
;main.c:375: enemies[i].x += xMovement;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#12
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
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:376: enemies[i].xReserve +=  (-xMovement) << 3;
	ldhl	sp,#13
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
00113$:
;main.c:363: enemies[i].yReserve += enemies[i].ySpeed;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;main.c:379: if (enemies[i].yReserve >> 3 > 0) {
	ld	b, c
	sra	b
	sra	b
	sra	b
	ld	e, b
	xor	a, a
	ld	d, a
	sub	a, b
	bit	7, e
	jr	Z, 00296$
	bit	7, d
	jr	NZ, 00297$
	cp	a, a
	jr	00297$
00296$:
	bit	7, d
	jr	Z, 00297$
	scf
00297$:
	jr	NC, 00117$
;main.c:380: int8_t yMovement = enemies[i].yReserve >> 3;
	ldhl	sp,	#14
	ld	(hl), b
;main.c:381: enemies[i].y += yMovement;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#14
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
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:382: enemies[i].yReserve -=  yMovement << 3;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00119$
00117$:
;main.c:384: else if ((-enemies[i].yReserve) >> 3 > 0){
	ld	a, c
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
	jr	Z, 00298$
	bit	7, d
	jr	NZ, 00299$
	cp	a, a
	jr	00299$
00298$:
	bit	7, d
	jr	Z, 00299$
	scf
00299$:
	jr	NC, 00119$
;main.c:385: int8_t yMovement = -((-enemies[i].yReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#14
	ld	(hl), c
;main.c:386: enemies[i].y += yMovement;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#14
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, c
	ld	h, b
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:387: enemies[i].yReserve +=  (-yMovement) << 3;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	xor	a, a
	ldhl	sp,	#14
	sub	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	c, a
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00119$:
;main.c:337: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	inc	(hl)
	jp	00143$
00120$:
;main.c:398: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	ld	(hl), #0x00
00145$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jp	NC, 00147$
;main.c:400: if (enemies[i].alive) {
	ld	a, (hl)
	ld	d, #0x00
	add	a, a
	rl	d
	add	a, a
	rl	d
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ld	hl, #_enemies
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
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00135$
;main.c:401: if (enemies[i].visible == 1) {
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;main.c:402: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
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
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
;main.c:404: set_sprite_tile(10+i, 0x7f);
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
;main.c:402: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#5
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;main.c:404: set_sprite_tile(10+i, 0x7f);
	add	a, #0x0a
	ldhl	sp,	#14
	ld	(hl), a
;main.c:402: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	a, b
	rlca
	and	a,#0x01
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;main.c:401: if (enemies[i].visible == 1) {
	push	hl
	ldhl	sp,	#13
	ld	a, (hl)
	dec	a
	pop	hl
	jr	NZ, 00132$
;main.c:402: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	a, l
	or	a, a
	jr	NZ, 00121$
	ld	e, b
	ld	d, #0x00
	ld	a, #0xac
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00303$
	bit	7, d
	jr	NZ, 00304$
	cp	a, a
	jr	00304$
00303$:
	bit	7, d
	jr	Z, 00304$
	scf
00304$:
	jr	C, 00121$
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	bit	7, b
	jr	NZ, 00121$
	ld	e, b
	ld	d, #0x00
	ld	a, #0x98
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00305$
	bit	7, d
	jr	NZ, 00306$
	cp	a, a
	jr	00306$
00305$:
	bit	7, d
	jr	Z, 00306$
	scf
00306$:
	jr	NC, 00135$
00121$:
;main.c:403: enemies[i].visible = 0;
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:404: set_sprite_tile(10+i, 0x7f);
	ldhl	sp,	#14
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
;main.c:404: set_sprite_tile(10+i, 0x7f);
	jr	00135$
00132$:
;main.c:408: if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
	bit	0, l
	jr	NZ, 00135$
	ld	a, c
	sub	a, #0xac
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00135$
	ldhl	sp,#12
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
	jr	Z, 00307$
	bit	7, d
	jr	NZ, 00308$
	cp	a, a
	jr	00308$
00307$:
	bit	7, d
	jr	Z, 00308$
	scf
00308$:
	jr	NC, 00135$
	ld	a, c
	sub	a, #0x98
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00135$
;main.c:409: enemies[i].visible = 1;
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:410: set_sprite_tile(10+i, enemies[i].sprite0);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#14
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
;main.c:410: set_sprite_tile(10+i, enemies[i].sprite0);
00135$:
;main.c:415: move_sprite(10+i, enemies[i].x+4, enemies[i].y+12);
	ldhl	sp,	#15
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_enemies
	add	hl, de
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
	ld	a, (bc)
	add	a, #0x0c
	ld	b, a
	ld	a, (hl)
	add	a, #0x04
	ld	c, a
	ldhl	sp,	#15
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
;main.c:398: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	inc	(hl)
	jp	00145$
00147$:
;main.c:417: }
	add	sp, #16
	ret
;main.c:419: void initEnemies(uint8_t loadSprites) {
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	add	sp, #-7
;main.c:421: if (loadSprites) {
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
;main.c:423: set_sprite_data(0x30, 1, enemy1);
	ld	de, #_enemy1
	push	de
	ld	hl, #0x130
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:428: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
00116$:
	ld	c, #0x00
00109$:
	ld	hl, #_ENEMYCOUNT
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jp	NC, 00111$
;main.c:429: if (enemies[i].alive == 0) {
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_enemies
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	or	a, a
	jr	NZ, 00110$
;main.c:431: enemies[i] = blob;
	pop	de
	push	de
	push	bc
	ld	hl, #0x0010
	push	hl
	ld	hl, #_blob
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x07
;main.c:435: enemies[i].x = xSpawnPositions[posIndex];
	ld	b, a
	add	a,#<(_xSpawnPositions)
	ld	e, a
	ld	a, #>(_xSpawnPositions)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	pop	de
	push	de
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:436: enemies[i].y = ySpawnPositions[posIndex];
	pop	de
	push	de
	inc	de
	inc	de
	ld	a, b
	add	a, #<(_ySpawnPositions)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, #>(_ySpawnPositions)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:438: set_sprite_tile(10+i, enemies[i].sprite0);
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
	ld	a, c
	add	a, #0x0a
	ldhl	sp,	#6
	ld	(hl), a
	ld	e, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), b
;main.c:441: move_sprite(10+i, enemies[i].x, enemies[i].y);
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), b
;main.c:441: move_sprite(10+i, enemies[i].x, enemies[i].y);
00110$:
;main.c:428: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	inc	c
	jp	00109$
00111$:
;main.c:444: }
	add	sp, #7
	ret
;main.c:447: void move() {
;	---------------------------------
; Function move
; ---------------------------------
_move::
	add	sp, #-8
;main.c:451: if (joydata & J_A) {
	ld	a, (#_joydata)
	bit	4, a
	jr	Z, 00102$
;main.c:452: xSpeed += xDir + xDir + xDir;
	ld	hl, #_xDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_xSpeed
	add	a, (hl)
	ld	(hl), a
;main.c:453: ySpeed += yDir + yDir + yDir;
	ld	hl, #_yDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_ySpeed
	add	a, (hl)
	ld	(hl), a
00102$:
;main.c:457: xSpeed = clamp(xSpeed, -100, 100);
	ld	hl, #_xSpeed
	ld	c, (hl)
;main.c:275: return (value < min) ? min : (value > max) ? max : value;
	ld	a, c
	xor	a, #0x80
	sub	a, #0x1c
	jr	NC, 00165$
	ld	c, #0x9c
	jr	00166$
00165$:
	ld	e, c
	ld	a,#0x64
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00342$
	bit	7, d
	jr	NZ, 00343$
	cp	a, a
	jr	00343$
00342$:
	bit	7, d
	jr	Z, 00343$
	scf
00343$:
	jr	NC, 00167$
	ld	c, #0x64
00167$:
00166$:
	ld	hl, #_xSpeed
	ld	(hl), c
;main.c:458: ySpeed = clamp(ySpeed, -100, 100);
	ld	hl, #_ySpeed
	ld	c, (hl)
;main.c:275: return (value < min) ? min : (value > max) ? max : value;
	ld	a, c
	xor	a, #0x80
	sub	a, #0x1c
	jr	NC, 00169$
	ld	c, #0x9c
	jr	00170$
00169$:
	ld	e, c
	ld	a,#0x64
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00344$
	bit	7, d
	jr	NZ, 00345$
	cp	a, a
	jr	00345$
00344$:
	bit	7, d
	jr	Z, 00345$
	scf
00345$:
	jr	NC, 00171$
	ld	c, #0x64
00171$:
00170$:
	ld	hl, #_ySpeed
	ld	(hl), c
;main.c:460: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;main.c:461: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;main.c:466: uint8_t xCollisionPoint = playerDrawX; 
	ld	hl, #_playerDrawX
	ld	c, (hl)
;main.c:469: xCollisionPoint = playerDrawX +8; //right edge
	ld	b, (hl)
;main.c:468: if (xSpeed > 0) {
	ld	hl, #_xSpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00346$
	bit	7, d
	jr	NZ, 00347$
	cp	a, a
	jr	00347$
00346$:
	bit	7, d
	jr	Z, 00347$
	scf
00347$:
	jr	NC, 00104$
;main.c:469: xCollisionPoint = playerDrawX +8; //right edge
	ld	a, b
	add	a, #0x08
	ld	c, a
00104$:
;main.c:471: if (xSpeed < 0) {
	ld	a, (#_xSpeed)
	bit	7, a
	jr	Z, 00106$
;main.c:472: xCollisionPoint = playerDrawX -8; //left edge
	ld	a, b
	add	a, #0xf8
	ld	c, a
00106$:
;main.c:476: int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;
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
;main.c:480: uint8_t bgindY = ((playerDrawY + bgY) >> 3)%32; 
	ld	hl, #_playerDrawY
	ld	c, (hl)
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
;	spillPairReg hl
;	spillPairReg hl
	pop	de
;main.c:483: uint16_t ind = 32*bgindY + bgindX;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;main.c:484: uint8_t result = 1; // 0 incase of clear path, 1 for blocked
	ld	c, #0x01
;main.c:485: for (uint8_t i=0; i<BLANKSIZE; i++) {
	ld	hl, #_background1
	add	hl, de
	ld	b, (hl)
	ld	e, #0x00
00158$:
	ld	a, (#_BLANKSIZE)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, e
	sub	a, (hl)
	jr	NC, 00109$
;main.c:486: if (background1[ind] == BLANK[i] ) {
	ld	hl, #_BLANK
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ld	a, b
;main.c:487: result = 0;
	sub	a,d
	jr	NZ, 00159$
	ld	c,a
;main.c:488: break;
	jr	00109$
00159$:
;main.c:485: for (uint8_t i=0; i<BLANKSIZE; i++) {
	inc	e
	jr	00158$
00109$:
;main.c:492: if (result == 0) {
	ld	a, c
	or	a, a
	jp	NZ, 00114$
;main.c:493: playerX+=xSpeed;
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
	ld	b, h
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;main.c:495: uint16_t limitedPlayerX = u16Clamp(playerX, 58<<5, 110<<5);//0->160, with 8 px margin for left edge & 50px for the edges
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x40
	ld	a, b
	sbc	a, #0x07
	jr	NC, 00173$
	ld	bc, #0x0740
	jr	00174$
00173$:
	ld	a, #0xc0
	cp	a, c
	ld	a, #0x0d
	sbc	a, b
	jr	NC, 00175$
	ld	bc, #0x0dc0
00175$:
00174$:
	ld	e,c
	ld	d,b
;main.c:497: xOverflow = (playerX - limitedPlayerX);
	ld	a, (#_playerX)
	sub	a, e
	ld	(#_xOverflow),a
	ld	a, (#_playerX + 1)
	sbc	a, d
	ld	hl, #_xOverflow + 1
;main.c:498: if (xOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_xOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00111$
;main.c:499: xOverflow = xOverflow >> 5;
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
	jr	00112$
00111$:
;main.c:502: xOverflow = -((-xOverflow) >> 5);
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
00112$:
;main.c:504: bgX += xOverflow;
	ld	a, (#_bgX)
	ld	hl, #_xOverflow
	add	a, (hl)
	ld	hl, #_bgX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_xOverflow + 1
	adc	a, (hl)
	ld	(#_bgX + 1),a
;main.c:505: playerX = limitedPlayerX;
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;main.c:506: playerDrawX=playerX >> 5;
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
	jr	00115$
00114$:
;main.c:514: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
00115$:
;main.c:522: uint8_t yCollisionPoint = playerDrawY; 
	ld	a, (#_playerDrawY)
	ldhl	sp,	#7
	ld	(hl), a
;main.c:525: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	hl, #_playerDrawY
	ld	c, (hl)
;main.c:524: if (ySpeed > 0) {
	ld	hl, #_ySpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00350$
	bit	7, d
	jr	NZ, 00351$
	cp	a, a
	jr	00351$
00350$:
	bit	7, d
	jr	Z, 00351$
	scf
00351$:
	jr	NC, 00117$
;main.c:525: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#7
	ld	(hl), a
00117$:
;main.c:527: if (ySpeed < 0) {
	ld	a, (#_ySpeed)
	bit	7, a
	jr	Z, 00119$
;main.c:528: yCollisionPoint = playerDrawY -8; //top edge, 
	ld	a, c
	add	a, #0xf8
	ldhl	sp,	#7
	ld	(hl), a
00119$:
;main.c:532: bgindX = ((playerDrawX + bgX) >> 3)%32;
	ld	a, (#_playerDrawX)
	ld	c, #0x00
	ldhl	sp,	#3
	ld	(hl+), a
	ld	a, c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_bgX
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
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
	ld	de, #0x0020
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__modsint
	add	sp, #4
	ldhl	sp,	#5
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;main.c:535: bgindY = ((yCollisionPoint + bgY) >> 3)%32; 
	ldhl	sp,	#7
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_bgY
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
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
	ld	de, #0x0020
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__modsint
	add	sp, #4
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(hl), a
;main.c:538: ind = 32*bgindY + bgindX;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x05
00352$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00352$
	dec	hl
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	pop	de
	push	de
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;main.c:539: result = 1;
	ldhl	sp,	#3
	ld	(hl), #0x01
;main.c:540: for (uint8_t j=0; j<BLANKSIZE; j++) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_background1
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#7
	ld	(hl), #0x00
00161$:
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00122$
;main.c:541: if (background1[ind] == BLANK[j] ) {
	ld	de, #_BLANK
	ldhl	sp,	#7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00162$
;main.c:542: result = 0;
	ldhl	sp,	#3
	ld	(hl), #0x00
;main.c:543: break;
	jr	00122$
00162$:
;main.c:540: for (uint8_t j=0; j<BLANKSIZE; j++) {
	ldhl	sp,	#7
	inc	(hl)
	jr	00161$
00122$:
;main.c:546: if (result == 0) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jp	NZ, 00127$
;main.c:547: playerY += ySpeed;
	ld	a, (#_ySpeed)
	ld	c, a
	rlca
	sbc	a, a
	ld	hl, #_playerY
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	b, a
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	b, a
	ld	a, c
	ld	(hl+), a
;main.c:549: uint16_t limitedPlayerY = u16Clamp(playerY, 61<<5, 107<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, #0xa0
	ld	a, d
	sbc	a, #0x07
	jr	NC, 00177$
	ld	de, #0x07a0
	jr	00178$
00177$:
	ld	a, #0x60
	cp	a, e
	ld	a, #0x0d
	sbc	a, d
	jr	NC, 00179$
	ld	de, #0x0d60
00179$:
00178$:
	ld	c, e
	ld	b, d
;main.c:551: yOverflow = (playerY - limitedPlayerY);
	ld	a, (#_playerY)
	sub	a, e
	ld	(#_yOverflow),a
	ld	a, (#_playerY + 1)
	sbc	a, d
	ld	hl, #_yOverflow + 1
;main.c:552: if (yOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_yOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00124$
;main.c:553: yOverflow = yOverflow >> 5;
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
	jr	00125$
00124$:
;main.c:556: yOverflow = -((-yOverflow) >> 5);
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
00125$:
;main.c:558: bgY += yOverflow;
	ld	a, (#_bgY)
	ld	hl, #_yOverflow
	add	a, (hl)
	ld	hl, #_bgY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_yOverflow + 1
	adc	a, (hl)
	ld	(#_bgY + 1),a
;main.c:559: playerY = limitedPlayerY;
	ld	hl, #_playerY
	ld	a, c
	ld	(hl+), a
;main.c:560: playerDrawY=playerY >> 5;
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
	jr	00128$
00127$:
;main.c:565: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
00128$:
;main.c:466: uint8_t xCollisionPoint = playerDrawX; 
	ld	a, (#_playerDrawX)
	ldhl	sp,	#7
	ld	(hl), a
;main.c:525: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, (#_playerDrawY)
	add	a, #0x08
	ldhl	sp,	#6
	ld	(hl), a
;main.c:568: if (xDir >= 0) {
	ld	a, (#_xDir)
	bit	7, a
	jr	NZ, 00130$
;main.c:569: move_sprite(0, playerDrawX , playerDrawY + 8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	de, #_shadow_OAM
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 1)
	ld	a, (hl)
	ld	(de), a
;main.c:571: move_sprite(1, playerDrawX +8, playerDrawY +8);
	ld	a, (#_playerDrawY)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0x08
	ld	(hl), a
	ld	a, (#_playerDrawX)
	add	a, #0x08
	ldhl	sp,	#7
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 5)
	ld	a, (hl)
	ld	(de), a
;main.c:571: move_sprite(1, playerDrawX +8, playerDrawY +8);
	jr	00131$
00130$:
;main.c:574: move_sprite(1, playerDrawX , playerDrawY +8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 4)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:576: move_sprite(0, playerDrawX +8, playerDrawY +8);
	ld	a, (#_playerDrawY)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0x08
	ld	(hl), a
	ld	a, (#_playerDrawX)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #_shadow_OAM
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 1)
	ld	a, (hl)
	ld	(de), a
;main.c:576: move_sprite(0, playerDrawX +8, playerDrawY +8);
00131$:
;main.c:581: if (bgX >= 256) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00133$
;main.c:582: bgX = bgX % 256;
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
00133$:
;main.c:584: if (bgX < 0) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00135$
;main.c:585: bgX = 255 - (bgX % 256);
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
00135$:
;main.c:587: if (bgY >= 256) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00137$
;main.c:588: bgY = bgY % 256;
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
00137$:
;main.c:590: if (bgY < 0) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00139$
;main.c:591: bgY = 255 - (bgY % 256);
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
00139$:
;main.c:594: move_bkg(bgX, bgY);
	ld	hl, #_bgY
	ld	c, (hl)
	ld	a, (#_bgX)
	ldh	(_SCX_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;main.c:597: if (ySpeed > 0) ySpeed--;
	ld	hl, #_ySpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00355$
	bit	7, d
	jr	NZ, 00356$
	cp	a, a
	jr	00356$
00355$:
	bit	7, d
	jr	Z, 00356$
	scf
00356$:
	jr	NC, 00141$
	ld	hl, #_ySpeed
	dec	(hl)
00141$:
;main.c:598: if (ySpeed < 0) ySpeed++;
	ld	hl, #_ySpeed
	bit	7, (hl)
	jr	Z, 00143$
	inc	(hl)
00143$:
;main.c:599: if (xSpeed > 0) xSpeed--;
	ld	hl, #_xSpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00357$
	bit	7, d
	jr	NZ, 00358$
	cp	a, a
	jr	00358$
00357$:
	bit	7, d
	jr	Z, 00358$
	scf
00358$:
	jr	NC, 00145$
	ld	hl, #_xSpeed
	dec	(hl)
00145$:
;main.c:600: if (xSpeed < 0) xSpeed++;
	ld	hl, #_xSpeed
	bit	7, (hl)
	jr	Z, 00163$
	inc	(hl)
00163$:
;main.c:604: }
	add	sp, #8
	ret
;main.c:606: void takeDamage(int16_t amount) {
;	---------------------------------
; Function takeDamage
; ---------------------------------
_takeDamage::
	dec	sp
;main.c:607: if (amount > shield) {
	ld	a, (#_shield)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
;main.c:609: hull -= (amount - shield);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;main.c:607: if (amount > shield) {
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
;main.c:608: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;main.c:609: hull -= (amount - shield);
	ld	a, (#_hull)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_hull),a
	jr	00104$
00102$:
;main.c:612: shield -= amount;
	ld	a, (#_shield)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_shield),a
00104$:
;main.c:614: }
	inc	sp
	ret
;main.c:616: void checkCollision() {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-23
;main.c:623: struct Enemy *eptr = enemies;
;main.c:624: uint8_t i = enemyCollisionCount;
	ld	hl, #_enemyCollisionCount
	ld	c, (hl)
;main.c:626: while (i < ENEMYCOUNT) {
	ld	hl, #_ENEMYCOUNT
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jp	NC, 00121$
;main.c:627: eptr += enemyCollisionCount;
	ld	hl, #_enemyCollisionCount
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	b, a
	ld	a, h
	adc	a, #>(_enemies)
	ldhl	sp,	#0
	ld	(hl), b
	inc	hl
	ld	(hl), a
;main.c:628: if (eptr->visible && eptr->alive) {
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
	jp	Z, 00121$
	pop	de
	push	de
	ld	hl, #0x0009
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
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jp	Z, 00121$
;main.c:631: if (abs(eptr->x - playerDrawX) <= 8 ) {
	pop	de
	push	de
	ld	a, (de)
	ld	hl, #_playerDrawX
	ld	b, (hl)
	sub	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;main.c:294: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00128$
;main.c:295: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;main.c:631: if (abs(eptr->x - playerDrawX) <= 8 ) {
00128$:
	ld	e, l
	ld	a,#0x08
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00214$
	bit	7, d
	jr	NZ, 00215$
	cp	a, a
	jr	00215$
00214$:
	bit	7, d
	jr	Z, 00215$
	scf
00215$:
	jr	C, 00104$
;main.c:632: if (abs(eptr->y - playerDrawY) <= 8) {
	pop	de
	push	de
	inc	de
	inc	de
	ld	a, (de)
	ld	hl, #_playerDrawY
	ld	b, (hl)
	sub	a, b
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;main.c:294: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00132$
;main.c:295: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;main.c:632: if (abs(eptr->y - playerDrawY) <= 8) {
00132$:
	ld	e, l
	ld	a,#0x08
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00216$
	bit	7, d
	jr	NZ, 00217$
	cp	a, a
	jr	00217$
00216$:
	bit	7, d
	jr	Z, 00217$
	scf
00217$:
	jr	C, 00104$
;main.c:633: set_sprite_tile(0x30+i, 0x7f);
	ld	a, c
	add	a, #0x30
	ld	b, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, b
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
	ld	(hl), #0x7f
;main.c:634: eptr->alive = 0;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:635: eptr->visible = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:636: takeDamage(eptr->damage);
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, #0x00
	push	bc
	ld	e, a
	push	de
	call	_takeDamage
	pop	hl
	xor	a, a
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
00104$:
;main.c:644: struct Projectile *pptr = projectiles;
	ldhl	sp,	#20
	ld	a, #<(_projectiles)
	ld	(hl+), a
	ld	(hl), #>(_projectiles)
;main.c:646: while (j < PROJECTILECOUNT) {
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#22
	ld	(hl), #0x00
00113$:
	ld	hl, #_PROJECTILECOUNT
	ld	b, (hl)
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, b
	jp	NC, 00121$
;main.c:647: if (pptr->active) {
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jp	Z, 00112$
;main.c:648: if (eptr->x > pptr->x - 8 && eptr->x - (8>>(eptr->spriteCount-1)) < pptr->x) {
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	b, (hl)
	ld	e, a
	ld	d, b
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#14
	ld	e, l
	ld	d, h
	ldhl	sp,	#18
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00218$
	bit	7, d
	jr	NZ, 00219$
	cp	a, a
	jr	00219$
00218$:
	bit	7, d
	jr	Z, 00219$
	scf
00219$:
	jp	NC, 00112$
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	dec	b
	ldhl	sp,	#12
	ld	a, #0x08
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	inc	b
	jr	00221$
00220$:
	ldhl	sp,	#13
	sra	(hl)
	dec	hl
	rr	(hl)
00221$:
	dec	b
	jr	NZ, 00220$
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, e
	ldhl	sp,	#18
	ld	(hl), b
	inc	hl
	ld	(hl), a
	ldhl	sp,	#18
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00222$
	bit	7, d
	jr	NZ, 00223$
	cp	a, a
	jr	00223$
00222$:
	bit	7, d
	jr	Z, 00223$
	scf
00223$:
	jp	NC, 00112$
;main.c:649: if (eptr->y > pptr->y - 8 && eptr->y -(8>>(eptr->spriteCount-1)) < pptr->y ) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	b, (hl)
	ld	e, a
	ld	d, b
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#17
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#16
	ld	e, l
	ld	d, h
	ldhl	sp,	#18
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00224$
	bit	7, d
	jr	NZ, 00225$
	cp	a, a
	jr	00225$
00224$:
	bit	7, d
	jr	Z, 00225$
	scf
00225$:
	jp	NC, 00112$
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, e
	ldhl	sp,	#18
	ld	(hl), b
	inc	hl
	ld	(hl), a
	ldhl	sp,	#18
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00226$
	bit	7, d
	jr	NZ, 00227$
	cp	a, a
	jr	00227$
00226$:
	bit	7, d
	jr	Z, 00227$
	scf
00227$:
	jr	NC, 00112$
;main.c:650: set_sprite_tile(0x30+i, 0x7f);
	ld	a, c
	add	a, #0x30
	ld	b, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x7f
;main.c:651: eptr->alive = 0;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:652: eptr->visible = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:653: initEnemies(0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
	pop	bc
;main.c:654: set_sprite_tile(20+j, 0x7f);
	ldhl	sp,	#22
	ld	a, (hl)
	add	a, #0x14
	ld	b, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, b
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
;main.c:655: playSound(0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
;main.c:656: pptr->active = 0;
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:657: incrementScore();
	push	bc
	call	_incrementScore
	call	_updateScore
	pop	bc
00112$:
;main.c:662: j++;
	ldhl	sp,	#22
	inc	(hl)
;main.c:663: pptr++;
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#22
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#21
	ld	(hl), a
	jp	00113$
;main.c:666: break;
00121$:
;main.c:669: if (enemyCollisionCount == 0) {
	ld	a, (#_enemyCollisionCount)
	or	a, a
	jr	NZ, 00123$
;main.c:670: enemyCollisionCount = ENEMYCOUNT - 1;
	ld	a, (#_ENEMYCOUNT)
	dec	a
	ld	(#_enemyCollisionCount),a
	jr	00136$
00123$:
;main.c:673: enemyCollisionCount--;
	ld	hl, #_enemyCollisionCount
	dec	(hl)
00136$:
;main.c:678: }
	add	sp, #23
	ret
;main.c:681: void setGunIcon() {
;	---------------------------------
; Function setGunIcon
; ---------------------------------
_setGunIcon::
;main.c:684: set_win_tiles(15, 0,1,1,gunMap+currentGun);
	ld	bc, #_gunMap+0
	ld	a, c
	ld	hl, #_currentGun
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	push	bc
	ld	hl, #0x101
	push	hl
	ld	hl, #0x0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:686: }
	ret
;main.c:696: void fire() {
;	---------------------------------
; Function fire
; ---------------------------------
_fire::
;main.c:698: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	inc	(hl)
	ld	a, (hl)
;main.c:699: if (oldestProjectile >= PROJECTILECOUNT) {
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ld	hl, #_oldestProjectile
	ld	a, (hl)
	sub	a, c
	jr	C, 00102$
;main.c:700: oldestProjectile = 0;
	ld	(hl), #0x00
00102$:
;main.c:703: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00104$
;main.c:704: projectiles[oldestProjectile] = singleGun;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	de, #0x000b
	push	de
	ld	de, #_singleGun
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
00104$:
;main.c:706: if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00106$
;main.c:707: projectiles[oldestProjectile] = doubleGun;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	de, #0x000b
	push	de
	ld	de, #_doubleGun
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
00106$:
;main.c:709: if (currentGun == 2) {
	ld	a, (#_currentGun)
	sub	a, #0x02
	jr	NZ, 00108$
;main.c:710: projectiles[oldestProjectile] = missile;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	de, #0x000b
	push	de
	ld	de, #_missile
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
00108$:
;main.c:712: projectiles[oldestProjectile].x = playerDrawX;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
;main.c:713: projectiles[oldestProjectile].y = playerDrawY;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
;main.c:714: projectiles[oldestProjectile].xSpeed = xDir * projectiles[oldestProjectile].speed;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	a, (#_xDir)
	push	af
	inc	sp
	call	__muluschar
	pop	hl
	ld	a, e
	pop	bc
	ld	(bc), a
;main.c:715: projectiles[oldestProjectile].ySpeed = yDir * projectiles[oldestProjectile].speed;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0006
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	a, (#_yDir)
	push	af
	inc	sp
	call	__muluschar
	pop	hl
	ld	a, e
	pop	bc
	ld	(bc), a
;main.c:719: set_sprite_tile(20+oldestProjectile, projectiles[oldestProjectile].type);
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000a
	add	hl, bc
	ld	c, (hl)
	ld	a, (#_oldestProjectile)
	add	a, #0x14
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, a
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
;main.c:724: fireCooldown = projectiles[oldestProjectile].delay;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
	ld	(#_fireCooldown),a
;main.c:726: playSound(projectiles[oldestProjectile].type);
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_playSound
	inc	sp
;main.c:730: }
	ret
;main.c:733: void moveProjectiles() {
;	---------------------------------
; Function moveProjectiles
; ---------------------------------
_moveProjectiles::
	add	sp, #-7
;main.c:734: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00112$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jp	NC, 00114$
;main.c:735: projectiles[i].x -= xOverflow;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
;main.c:736: projectiles[i].y -= yOverflow;
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
;main.c:738: if (projectiles[i].active) {
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00113$
;main.c:739: int16_t newY = projectiles[i].y + projectiles[i].ySpeed;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:740: int16_t newX = projectiles[i].x + projectiles[i].xSpeed;
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
;main.c:743: projectiles[i].y = newY;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:744: projectiles[i].x = newX;
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:748: move_sprite(20+i, newX +4 , newY +12);
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x0c
	ld	e, a
	ld	a, c
	add	a, #0x04
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	add	a, #0x14
	ld	(hl), a
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;main.c:752: if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	NZ, 00101$
	ld	e, h
	ld	d, #0x00
	ld	a, #0xaa
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00147$
	bit	7, d
	jr	NZ, 00148$
	cp	a, a
	jr	00148$
00147$:
	bit	7, d
	jr	Z, 00148$
	scf
00148$:
	jr	C, 00101$
;main.c:736: projectiles[i].y -= yOverflow;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
;main.c:752: if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
	ld	b, a
	bit	7, b
	jr	NZ, 00101$
	ld	e, b
	ld	d, #0x00
	ld	a, #0x9a
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00149$
	bit	7, d
	jr	NZ, 00150$
	cp	a, a
	jr	00150$
00149$:
	bit	7, d
	jr	Z, 00150$
	scf
00150$:
	jr	NC, 00113$
00101$:
;main.c:754: projectiles[i].active = 0;
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_projectiles
	add	hl, de
	ld	bc, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;main.c:755: set_sprite_tile(20+i, 0x7f);
	ldhl	sp,	#5
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
;main.c:755: set_sprite_tile(20+i, 0x7f);
00113$:
;main.c:734: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#6
	inc	(hl)
	jp	00112$
00114$:
;main.c:760: }
	add	sp, #7
	ret
;main.c:763: void initProjectiles() {
;	---------------------------------
; Function initProjectiles
; ---------------------------------
_initProjectiles::
;main.c:764: set_sprite_data(0x20, 1, ProjectileTiles); //TODO NOSTA MÄÄRÄÄ
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x120
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:766: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	xor	a, a
00103$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	cp	a, c
	ret	NC
	inc	a
;main.c:770: }
	jr	00103$
;main.c:772: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;main.c:775: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;main.c:776: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
;main.c:777: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
;main.c:778: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
;main.c:781: playerX = 80<<5;
	ld	hl, #_playerX
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;main.c:782: playerY = 80<<5;
	ld	hl, #_playerY
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;main.c:784: playerDrawX = 80;
	ld	hl, #_playerDrawX
	ld	(hl), #0x50
;main.c:785: playerDrawY = 80;
	ld	hl, #_playerDrawY
	ld	(hl), #0x50
;main.c:788: bgX = 0;
	xor	a, a
	ld	hl, #_bgX
	ld	(hl+), a
	ld	(hl), a
;main.c:789: bgY = 0;
	xor	a, a
	ld	hl, #_bgY
	ld	(hl+), a
	ld	(hl), a
;main.c:791: hull = maxHull;
	ld	a, (#_maxHull)
	ld	(#_hull),a
;main.c:792: shield = maxShield;
	ld	a, (#_maxShield)
	ld	(#_shield),a
;main.c:794: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:795: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;main.c:796: set_sprite_data(0, 12, Player1);
	ld	de, #_Player1
	push	de
	ld	hl, #0xc00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;main.c:802: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:806: font_init();
	call	_font_init
;main.c:808: min_font = font_load(font_min); // 36 tiles of characters
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_min_font
	ld	a, e
	ld	(hl+), a
;main.c:809: font_set(min_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:810: set_win_tiles(1,0,4,1,hullabel);
	ld	de, #_hullabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:811: set_win_tiles(1,1,4,1,shieldlabel);
	ld	de, #_shieldlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:816: set_bkg_data(0x50,1,healthblock);
	ld	de, #_healthblock
	push	de
	ld	hl, #0x150
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:818: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:819: setHealthBar(1, shield);
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
;main.c:826: set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:827: set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
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
;main.c:830: set_bkg_data(0x51, 9, ProjectileTiles);
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x951
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:832: set_win_tiles(10, 0,4,1,weaponlabel);
	ld	de, #_weaponlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:833: set_win_tiles(10, 1,4,1,scorelabel);
	ld	de, #_scorelabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x10a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;main.c:835: setGunIcon();
	call	_setGunIcon
;main.c:836: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:837: SHOW_WIN;;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:839: bcd = MAKE_BCD(00000);
	xor	a, a
	ld	hl, #_bcd
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;main.c:840: updateScore();
;main.c:843: }
	jp	_updateScore
;main.c:845: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:848: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG + 0), a
;main.c:849: LYC_REG = 0x7e; //line 126
	ld	a, #0x7e
	ldh	(_LYC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;main.c:851: add_LCD(interruptLCD);
	ld	de, #_interruptLCD
	push	de
	call	_add_LCD
	inc	sp
	inc	sp
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;main.c:853: set_interrupts(VBL_IFLAG | LCD_IFLAG);   
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;main.c:857: NR52_REG = 0x80; // sound on 
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:858: NR50_REG = 0x77; // volume
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:859: NR51_REG = 0xFF; // all channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:863: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:864: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;main.c:865: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;main.c:866: initrand(seed);
	push	bc
	call	_initrand
	pop	hl
;main.c:871: initGame();
	call	_initGame
;main.c:872: initEnemies(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;main.c:873: initProjectiles();
	call	_initProjectiles
;main.c:875: while(1) {
00114$:
;main.c:876: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:878: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;main.c:880: updateDirection(); // set player direction
	call	_updateDirection
;main.c:883: move(); 
	call	_move
;main.c:885: updateEnemyPositions();
	call	_updateEnemyPositions
;main.c:888: checkCollision(); 
	call	_checkCollision
;main.c:689: if (shield < maxShield) {
	ld	hl, #_maxShield
	ld	c, (hl)
	ld	e, c
	ld	hl, #_shield
	ld	d, (hl)
	ld	a, (hl)
	sub	a, c
	bit	7, e
	jr	Z, 00171$
	bit	7, d
	jr	NZ, 00172$
	cp	a, a
	jr	00172$
00171$:
	bit	7, d
	jr	Z, 00172$
	scf
00172$:
	jr	NC, 00122$
;main.c:690: shield += 1;
	ld	hl, #_shield
	inc	(hl)
00122$:
;main.c:692: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:693: setHealthBar(1, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;main.c:893: if (joydata & J_B && fireCooldown == 0) {
	ld	a, (#_joydata)
	bit	5, a
	jr	Z, 00102$
	ld	a, (#_fireCooldown)
	or	a, a
	jr	NZ, 00102$
;main.c:894: fire();
	call	_fire
00102$:
;main.c:896: if (fireCooldown > 0) {
	ld	hl, #_fireCooldown
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;main.c:897: --fireCooldown;
	dec	(hl)
00105$:
;main.c:900: if (joydata & J_SELECT && switchDelay == 0) {
	ld	a, (#_joydata)
	bit	6, a
	jr	Z, 00109$
	ld	a, (#_switchDelay)
	or	a, a
	jr	NZ, 00109$
;main.c:901: currentGun++;
	ld	hl, #_currentGun
	inc	(hl)
;main.c:902: if (currentGun >= GUNCOUNT) {
	ld	hl, #_GUNCOUNT
	ld	c, (hl)
	ld	hl, #_currentGun
	ld	a, (hl)
	sub	a, c
	jr	C, 00107$
;main.c:903: currentGun = 0;
	ld	(hl), #0x00
00107$:
;main.c:905: setGunIcon();
	call	_setGunIcon
;main.c:906: switchDelay = 30;
	ld	hl, #_switchDelay
	ld	(hl), #0x1e
00109$:
;main.c:908: if (switchDelay != 0) {
	ld	hl, #_switchDelay
	ld	a, (hl)
	or	a, a
	jr	Z, 00112$
;main.c:909: switchDelay--;
	dec	(hl)
00112$:
;main.c:911: moveProjectiles();
	call	_moveProjectiles
;main.c:923: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:924: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
;main.c:929: }
	jp	00114$
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
__xinit__weaponlabel:
	.db #0x21	; 33
	.db #0x0f	; 15
	.db #0x1a	; 26
	.db #0x18	; 24
__xinit__scorelabel:
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x1c	; 28
	.db #0x0f	; 15
__xinit__blob:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
__xinit__singleGun:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x20	; 32
__xinit__doubleGun:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x23	; 35
__xinit__missile:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x26	; 38
__xinit__oldestProjectile:
	.db #0x00	; 0
__xinit__fireCooldown:
	.db #0x00	; 0
__xinit__xDir:
	.db #0x00	;  0
__xinit__yDir:
	.db #0xff	; -1
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
__xinit__xOverflow:
	.dw #0x0000
__xinit__yOverflow:
	.dw #0x0000
__xinit__enemyCollisionCount:
	.db #0x00	; 0
__xinit__currentGun:
	.db #0x00	; 0
__xinit__switchDelay:
	.db #0x00	; 0
__xinit__gunMap:
	.db #0x51	; 81	'Q'
	.db #0x56	; 86	'V'
	.db #0x58	; 88	'X'
__xinit__score:
	.dw #0x0000
__xinit__bcd:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__INCREMENT:
	.byte #0x01, #0x00, #0x00, #0x00	; 1
	.area _CABS (ABS)
