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
	.globl _initEnemyOptions
	.globl _tickPickups
	.globl _moveProjectiles
	.globl _fire
	.globl _setGunIcon
	.globl _checkCollision
	.globl _spawnPickup
	.globl _takeDamage
	.globl _move
	.globl _updateEnemyPositions
	.globl _initEnemies
	.globl _playSound
	.globl _updateDirection
	.globl _incrementScore
	.globl _updateMissileCount
	.globl _updateScore
	.globl _setHealthBar
	.globl _interruptLCD
	.globl _bcd2text
	.globl _bcd_sub
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
	.globl _SCORE
	.globl _score
	.globl _gunMap
	.globl _switchDelay
	.globl _MISSILES
	.globl _missiles
	.globl _currentGun
	.globl _gunLevel
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
	.globl _shieldship
	.globl _bigblob
	.globl _miniship
	.globl _bomb
	.globl _blob
	.globl _scorelabel
	.globl _weaponlabel
	.globl _shieldlabel
	.globl _hullabel
	.globl _pickup
	.globl _min_font
	.globl _shield
	.globl _hull
	.globl _joydata
	.globl _projectiles
	.globl _enemies
	.globl _enemyOptions
	.globl _MAXGUNLEVEL
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
	.globl _Pickups
	.globl _ammo
	.globl _upgrade
	.globl _ProjectileTiles
	.globl _largeenemies
	.globl _enemy1
	.globl _enemyOptionCount
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
_enemyOptions::
	.ds 80
_enemies::
	.ds 80
_projectiles::
	.ds 60
_joydata::
	.ds 1
_hull::
	.ds 1
_shield::
	.ds 1
_min_font::
	.ds 2
_pickup::
	.ds 8
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
_bomb::
	.ds 16
_miniship::
	.ds 16
_bigblob::
	.ds 16
_shieldship::
	.ds 16
_singleGun::
	.ds 12
_doubleGun::
	.ds 12
_missile::
	.ds 12
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
_gunLevel::
	.ds 1
_currentGun::
	.ds 1
_missiles::
	.ds 1
_MISSILES::
	.ds 4
_switchDelay::
	.ds 1
_gunMap::
	.ds 3
_score::
	.ds 2
_SCORE::
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
;src/main.c:113: void interruptLCD()
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;src/main.c:115: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:116: }
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
_enemyOptionCount:
	.db #0x05	; 5
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
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x5e	; 94
	.db #0x62	; 98	'b'
	.db #0x8f	; 143
	.db #0xf1	; 241
	.db #0xc7	; 199
	.db #0xf9	; 249
	.db #0xc3	; 195
	.db #0xfd	; 253
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0x7a	; 122	'z'
	.db #0x7e	; 126
	.db #0x3c	; 60
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
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0xba	; 186
	.db #0xc4	; 196
	.db #0xba	; 186
	.db #0xc4	; 196
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x3e	; 62
_largeenemies:
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
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
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
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x0c	; 12
	.db #0x43	; 67	'C'
	.db #0x0f	; 15
	.db #0x84	; 132
	.db #0x27	; 39
	.db #0x80	; 128
	.db #0x13	; 19
	.db #0x83	; 131
	.db #0x2a	; 42
	.db #0x83	; 131
	.db #0x16	; 22
	.db #0x80	; 128
	.db #0x23	; 35
	.db #0x84	; 132
	.db #0x07	; 7
	.db #0x43	; 67	'C'
	.db #0x0f	; 15
	.db #0x4c	; 76	'L'
	.db #0x0c	; 12
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0x11	; 17
	.db #0xf0	; 240
	.db #0xe5	; 229
	.db #0x1c	; 28
	.db #0xe5	; 229
	.db #0x1c	; 28
	.db #0x11	; 17
	.db #0xf0	; 240
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
_ProjectileTiles:
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
_upgrade:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
_ammo:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x72	; 114	'r'
_Pickups:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xd7	; 215
	.db #0x56	; 86	'V'
	.db #0xd7	; 215
	.db #0x56	; 86	'V'
	.db #0xd5	; 213
	.db #0x54	; 84	'T'
	.db #0xf5	; 245
	.db #0x74	; 116	't'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xff	; 255
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
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x06	; 6
	.db #0x9f	; 159
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xfd	; 253
	.db #0x78	; 120	'x'
	.db #0xf9	; 249
	.db #0x70	; 112	'p'
	.db #0xf9	; 249
	.db #0x70	; 112	'p'
	.db #0xff	; 255
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
_MAXGUNLEVEL:
	.db #0x01	; 1
;src/main.c:119: void setHealthBar(uint8_t row, uint8_t hp) {
;	---------------------------------
; Function setHealthBar
; ---------------------------------
_setHealthBar::
	add	sp, #-5
;src/main.c:121: if (hp >= 80) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x50
	jr	C, 00102$
;src/main.c:122: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x50};
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
;src/main.c:123: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:124: return;
	jp	00109$
00102$:
;src/main.c:126: if (hp >= 60) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00104$
;src/main.c:127: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x00};
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
;src/main.c:128: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:129: return;
	jp	00109$
00104$:
;src/main.c:131: if (hp >= 40) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00106$
;src/main.c:132: unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
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
;src/main.c:133: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:134: return;
	jr	00109$
00106$:
;src/main.c:136: if (hp >= 20) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x14
	jr	C, 00108$
;src/main.c:137: unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
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
;src/main.c:138: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:139: return;
	jr	00109$
00108$:
;src/main.c:141: unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
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
;src/main.c:142: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:143: return;
00109$:
;src/main.c:145: }
	add	sp, #5
	ret
;src/main.c:147: void updateScore() {
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
	add	sp, #-10
;src/main.c:151: len = bcd2text(&SCORE, 0x01, buf);
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
	ld	de, #_SCORE
	push	de
	call	_bcd2text
	add	sp, #5
	pop	bc
;src/main.c:152: set_win_tiles(15, 1, 5, 1, buf+3);
	inc	bc
	inc	bc
	inc	bc
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x10f
	push	hl
	call	_set_win_tiles
;src/main.c:153: }
	add	sp, #16
	ret
;src/main.c:155: void updateMissileCount(int8_t amount) {
;	---------------------------------
; Function updateMissileCount
; ---------------------------------
_updateMissileCount::
	add	sp, #-13
;src/main.c:156: if (amount == -1) {
	ldhl	sp,	#15
	ld	a, (hl)
	inc	a
	jr	NZ, 00112$
;src/main.c:157: missiles--;
	ld	hl, #_missiles
	dec	(hl)
;src/main.c:158: bcd_sub(&MISSILES, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_sub
	add	sp, #4
	jr	00104$
;src/main.c:161: for(uint8_t i=0; i<amount;i++) {
00112$:
	ldhl	sp,	#12
	ld	(hl), #0x00
00106$:
	ldhl	sp,	#12
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00128$
	bit	7, d
	jr	NZ, 00129$
	cp	a, a
	jr	00129$
00128$:
	bit	7, d
	jr	Z, 00129$
	scf
00129$:
	jr	NC, 00104$
;src/main.c:162: ++missiles;
	ld	hl, #_missiles
	inc	(hl)
;src/main.c:163: bcd_add(&MISSILES, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_add
	add	sp, #4
;src/main.c:161: for(uint8_t i=0; i<amount;i++) {
	ldhl	sp,	#12
	inc	(hl)
	jr	00106$
00104$:
;src/main.c:168: len = bcd2text(&MISSILES, 0x01, buf);
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
	ld	de, #_MISSILES
	push	de
	call	_bcd2text
	add	sp, #5
	pop	bc
;src/main.c:169: set_win_tiles(18, 0, 2, 1, buf+6);
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x12
	push	hl
	call	_set_win_tiles
;src/main.c:171: }
	add	sp, #19
	ret
;src/main.c:173: void incrementScore() {
;	---------------------------------
; Function incrementScore
; ---------------------------------
_incrementScore::
;src/main.c:174: score += 1;
	ld	hl, #_score
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:175: bcd_add(&SCORE, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_SCORE
	push	de
	call	_bcd_add
	add	sp, #4
;src/main.c:176: }
	ret
;src/main.c:178: void updateDirection() {
;	---------------------------------
; Function updateDirection
; ---------------------------------
_updateDirection::
	add	sp, #-4
;src/main.c:182: if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:183: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:184: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00102$:
;src/main.c:186: if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:187: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:188: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00106$:
;src/main.c:190: if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:191: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:192: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00110$:
;src/main.c:194: if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:195: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:196: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00114$:
;src/main.c:200: if ((joydata & J_UP) && (joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;src/main.c:201: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:202: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00118$:
;src/main.c:204: if ((joydata & J_UP) && (joydata & J_LEFT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
	ld	a, d
	or	a, e
	jr	Z, 00121$
;src/main.c:205: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:206: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00121$:
;src/main.c:208: if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00124$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;src/main.c:209: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:210: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00124$:
;src/main.c:212: if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
	ld	a, b
	or	a, c
	jr	Z, 00127$
	ld	a, d
	or	a, e
	jr	Z, 00127$
;src/main.c:213: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:214: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00127$:
;src/main.c:219: if (xDir == 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00130$
	ld	a, (#_yDir)
	or	a, a
;src/main.c:220: return;
	jp	Z,00195$
00130$:
;src/main.c:252: if (xDir == 0 && yDir > 0) {
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
;src/main.c:256: set_sprite_prop(1, S_FLIPY); 
	jp	00195$
00160$:
;src/main.c:258: else if (xDir == 0 && yDir < 0) {
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
;src/main.c:262: set_sprite_prop(1, 0); 
	jp	00195$
00156$:
;src/main.c:264: else if (xDir > 0 && yDir == 0) {
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
;src/main.c:268: set_sprite_prop(1, 0); 
	jp	00195$
00152$:
;src/main.c:270: else if (xDir < 0 && yDir == 0) {
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
;src/main.c:274: set_sprite_prop(1, S_FLIPX); 
	jp	00195$
00148$:
;src/main.c:276: else if (xDir > 0 && yDir < 0) {
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
;src/main.c:280: set_sprite_prop(1, 0); 
	jr	00195$
00144$:
;src/main.c:282: else if (xDir > 0 && yDir > 0) {
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
;src/main.c:286: set_sprite_prop(1, S_FLIPY); 
	jr	00195$
00140$:
;src/main.c:288: else if (xDir < 0 && yDir > 0) {
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
;src/main.c:292: set_sprite_prop(1, S_FLIPY | S_FLIPX); 
	jr	00195$
00136$:
;src/main.c:294: else if (xDir < 0 && yDir < 0) {
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
;src/main.c:298: set_sprite_prop(1, S_FLIPX); 
00195$:
;src/main.c:300: }
	add	sp, #4
	ret
;src/main.c:329: void playSound(uint8_t type) {
;	---------------------------------
; Function playSound
; ---------------------------------
_playSound::
;src/main.c:330: if (type == 20) { //singlegun
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00102$
;src/main.c:331: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:332: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:333: NR12_REG = 0x43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;src/main.c:334: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/main.c:335: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/main.c:336: return;
	ret
00102$:
;src/main.c:338: if (type == 23) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x17
	jr	NZ, 00104$
;src/main.c:339: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:340: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:341: NR12_REG = 0x53;
	ld	a, #0x53
	ldh	(_NR12_REG + 0), a
;src/main.c:342: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/main.c:343: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00104$:
;src/main.c:345: if (type == 26) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x1a
	jr	NZ, 00106$
;src/main.c:346: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:347: NR11_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR11_REG + 0), a
;src/main.c:348: NR12_REG = 0x55;
	ld	a, #0x55
	ldh	(_NR12_REG + 0), a
;src/main.c:349: NR13_REG = 0x70;//0Xbe;//0x6D;
	ld	a, #0x70
	ldh	(_NR13_REG + 0), a
;src/main.c:350: NR14_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR14_REG + 0), a
00106$:
;src/main.c:352: if (type == 0) {  // explosion
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/main.c:353: NR41_REG = 0x20;  
	ld	a, #0x20
	ldh	(_NR41_REG + 0), a
;src/main.c:354: NR42_REG = 0xa2;//0xa3;  
	ld	a, #0xa2
	ldh	(_NR42_REG + 0), a
;src/main.c:355: NR43_REG = 0x57;  
	ld	a, #0x57
	ldh	(_NR43_REG + 0), a
;src/main.c:356: NR44_REG = 0x80;  
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;src/main.c:362: }
	ret
;src/main.c:364: void initEnemies(uint8_t loadSprites) {
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	add	sp, #-7
;src/main.c:366: if (loadSprites) {
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/main.c:368: set_sprite_data(0x40, 5, enemy1);
	ld	de, #_enemy1
	push	de
	ld	hl, #0x540
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:369: set_sprite_data(0x50, 8, largeenemies);
	ld	de, #_largeenemies
	push	de
	ld	hl, #0x850
	push	hl
	call	_set_sprite_data
	add	sp, #4
00102$:
;src/main.c:372: struct Enemy *eptr = enemies;
	ldhl	sp,	#4
	ld	a, #<(_enemies)
	ld	(hl+), a
;src/main.c:374: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ld	a, #>(_enemies)
	ld	(hl+), a
	ld	(hl), #0x00
00116$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jp	NC, 00118$
;src/main.c:375: if (eptr->alive == 0) {
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;src/main.c:377: uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) enemyOptionCount;
	call	_rand
	ldhl	sp,	#2
	ld	(hl), e
	ld	a, (#_enemyOptionCount)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	__moduchar
	pop	hl
;src/main.c:379: (*eptr) = enemyOptions[enemyInd];
	ldhl	sp,#3
	ld	(hl), e
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x04
00146$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00146$
	pop	de
	push	de
	ld	hl, #_enemyOptions
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
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0010
	push	hl
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
;src/main.c:381: uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
	call	_rand
	ld	a, e
	and	a, #0x07
	ldhl	sp,	#3
	ld	(hl), a
;src/main.c:382: eptr->x = xSpawnPositions[posIndex];
	ld	de, #_xSpawnPositions
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:383: eptr->y = ySpawnPositions[posIndex];
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	de, #_ySpawnPositions
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:385: if (eptr->spriteCount == 1) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
;src/main.c:386: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	c, (hl)
	ld	a, (de)
	ld	e, a
	sla	c
	ld	a, c
	add	a, #0x0a
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:385: if (eptr->spriteCount == 1) {
	dec	b
	jr	NZ, 00104$
;src/main.c:386: set_sprite_tile(10+ (i<<1), eptr->sprite0);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), e
;src/main.c:387: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
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
	ld	de, #_shadow_OAM
	add	hl, de
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;src/main.c:387: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	jr	00107$
00104$:
;src/main.c:390: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ld	b, e
	ldhl	sp,	#2
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
	ld	(hl), b
;src/main.c:391: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
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
	ld	de, #_shadow_OAM
	add	hl, de
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#3
;src/main.c:393: set_sprite_tile(10+ (i<<1) +1, eptr->sprite1);
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	a, c
	add	a, #0x0b
	ldhl	sp,	#3
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), e
;src/main.c:394: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/main.c:394: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
00107$:
;src/main.c:399: eptr++;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;src/main.c:374: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ld	(hl+), a
	inc	(hl)
	jp	00116$
00118$:
;src/main.c:402: }
	add	sp, #7
	ret
;src/main.c:405: void updateEnemyPositions() {
;	---------------------------------
; Function updateEnemyPositions
; ---------------------------------
_updateEnemyPositions::
	add	sp, #-16
;src/main.c:408: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	ld	(hl), #0x00
00196$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jp	NC, 00134$
;src/main.c:409: if (!enemies[i].alive) {
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x04
00407$:
	ldhl	sp,	#13
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00407$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_enemies
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
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00133$
;src/main.c:412: enemies[i].x -= xOverflow;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #_xOverflow
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:413: enemies[i].y -= yOverflow;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
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
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:416: if (abs(enemies[i].x - playerDrawX) > 8) {
	ldhl	sp,	#13
	ld	a, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:324: if (value >= 0) return value;
	bit	7, c
	jr	NZ, 00169$
	ld	b, c
	jr	00171$
00169$:
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, c
	ld	b, a
;src/main.c:416: if (abs(enemies[i].x - playerDrawX) > 8) {
00171$:
;src/main.c:425: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
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
;src/main.c:418: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;src/main.c:416: if (abs(enemies[i].x - playerDrawX) > 8) {
	ld	e, b
	ld	a,#0x08
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00408$
	bit	7, d
	jr	NZ, 00409$
	cp	a, a
	jr	00409$
00408$:
	bit	7, d
	jr	Z, 00409$
	scf
00409$:
	jr	NC, 00111$
;src/main.c:417: if (enemies[i].x < playerDrawX) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_playerDrawX)
	ldhl	sp,	#13
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:418: enemies[i].xSpeed += enemies[i].accel;
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;src/main.c:417: if (enemies[i].x < playerDrawX) {
	ldhl	sp,	#11
	ld	e, l
	ld	d, h
	ldhl	sp,	#13
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00410$
	bit	7, d
	jr	NZ, 00411$
	cp	a, a
	jr	00411$
00410$:
	bit	7, d
	jr	Z, 00411$
	scf
00411$:
	jr	NC, 00104$
;src/main.c:418: enemies[i].xSpeed += enemies[i].accel;
	ld	a, c
	add	a, b
	ld	c, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00112$
00104$:
;src/main.c:421: enemies[i].xSpeed -= enemies[i].accel;
	ld	a, c
	sub	a, b
	ld	c, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00112$
00111$:
;src/main.c:425: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00412$
	bit	7, d
	jr	NZ, 00413$
	cp	a, a
	jr	00413$
00412$:
	bit	7, d
	jr	Z, 00413$
	scf
00413$:
	jr	NC, 00107$
	dec	c
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00107$:
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/main.c:426: if (enemies[i].xSpeed < 0) enemies[i].xSpeed++;
	bit	7, c
	jr	Z, 00112$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00112$:
;src/main.c:429: if (abs(enemies[i].y - playerDrawY) > 8) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	ld	hl, #_playerDrawY
	ld	e, (hl)
	sub	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:324: if (value >= 0) return value;
	bit	7, l
	jr	NZ, 00173$
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	jr	00175$
00173$:
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, l
	ld	e, a
	ldhl	sp,	#14
	ld	(hl), e
;src/main.c:429: if (abs(enemies[i].y - playerDrawY) > 8) {
00175$:
;src/main.c:431: enemies[i].ySpeed += enemies[i].accel;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
;src/main.c:438: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/main.c:429: if (abs(enemies[i].y - playerDrawY) > 8) {
	ldhl	sp,	#14
	ld	e, (hl)
	ld	a,#0x08
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00414$
	bit	7, d
	jr	NZ, 00415$
	cp	a, a
	jr	00415$
00414$:
	bit	7, d
	jr	Z, 00415$
	scf
00415$:
	jr	NC, 00121$
;src/main.c:430: if (enemies[i].y < playerDrawY) {
	ld	a, (#_playerDrawY)
	ldhl	sp,	#12
	ld	(hl+), a
;src/main.c:431: enemies[i].ySpeed += enemies[i].accel;
	xor	a, a
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
;src/main.c:430: if (enemies[i].y < playerDrawY) {
	ld	(hl-), a
	dec	hl
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00416$
	bit	7, d
	jr	NZ, 00417$
	cp	a, a
	jr	00417$
00416$:
	bit	7, d
	jr	Z, 00417$
	scf
00417$:
	jr	NC, 00114$
;src/main.c:431: enemies[i].ySpeed += enemies[i].accel;
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#14
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00122$
00114$:
;src/main.c:434: enemies[i].ySpeed -= enemies[i].accel;
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#14
	sub	a, (hl)
	ld	c, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00122$
00121$:
;src/main.c:438: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
	ldhl	sp,	#11
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00418$
	bit	7, d
	jr	NZ, 00419$
	cp	a, a
	jr	00419$
00418$:
	bit	7, d
	jr	Z, 00419$
	scf
00419$:
	jr	NC, 00117$
	ldhl	sp,	#11
	ld	c, (hl)
	dec	c
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00117$:
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/main.c:439: if (enemies[i].ySpeed < 0) enemies[i].ySpeed++;
	bit	7, c
	jr	Z, 00122$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00122$:
;src/main.c:443: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
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
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	(hl+), a
	xor	a, a
	sub	a, c
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
;src/main.c:305: return (value < min) ? min : (value > max) ? max : value;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00420$
	bit	7, d
	jr	NZ, 00421$
	cp	a, a
	jr	00421$
00420$:
	bit	7, d
	jr	Z, 00421$
	scf
00421$:
	jr	NC, 00202$
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	(hl), a
	jr	00203$
00202$:
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	bit	7, e
	jr	Z, 00422$
	bit	7, d
	jr	NZ, 00423$
	cp	a, a
	jr	00423$
00422$:
	bit	7, d
	jr	Z, 00423$
	scf
00423$:
	jr	NC, 00204$
	ldhl	sp,	#12
	ld	e, (hl)
	jr	00205$
00204$:
	ldhl	sp,	#14
	ld	e, (hl)
00205$:
	ldhl	sp,	#14
	ld	(hl), e
00203$:
	ldhl	sp,	#14
	ld	c, (hl)
;src/main.c:443: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:444: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	c, b
	xor	a, a
	sub	a, b
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:305: return (value < min) ? min : (value > max) ? max : value;
	ld	e, b
	ld	a,l
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00424$
	bit	7, d
	jr	NZ, 00425$
	cp	a, a
	jr	00425$
00424$:
	bit	7, d
	jr	Z, 00425$
	scf
00425$:
	jr	NC, 00206$
	ld	c, b
	jr	00207$
00206$:
	ld	e, l
	ld	a,c
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00426$
	bit	7, d
	jr	NZ, 00427$
	cp	a, a
	jr	00427$
00426$:
	bit	7, d
	jr	Z, 00427$
	scf
00427$:
	jr	C, 00209$
	ld	c, l
00209$:
00207$:
;src/main.c:444: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:447: enemies[i].xReserve += enemies[i].xSpeed;
	ldhl	sp,#2
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
	ldhl	sp,#6
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
;src/main.c:448: enemies[i].yReserve += enemies[i].ySpeed;
	ldhl	sp,#2
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
;src/main.c:452: if (enemies[i].xReserve >> 3 > 0) {
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	sra	b
	sra	b
	sra	b
	ld	e, b
	xor	a, a
	ld	d, a
	sub	a, b
	bit	7, e
	jr	Z, 00428$
	bit	7, d
	jr	NZ, 00429$
	cp	a, a
	jr	00429$
00428$:
	bit	7, d
	jr	Z, 00429$
	scf
00429$:
	jr	NC, 00126$
;src/main.c:453: int8_t xMovement = enemies[i].xReserve >> 3;
	ldhl	sp,	#12
	ld	a, (hl)
	sra	a
	sra	a
	sra	a
	ld	(hl), a
;src/main.c:454: enemies[i].x += xMovement;
	ldhl	sp,#2
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
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:455: enemies[i].xReserve -=  xMovement << 3;
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
	jr	00127$
00126$:
;src/main.c:458: else if ((-enemies[i].xReserve) >> 3 > 0){
	ldhl	sp,	#12
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
	jr	Z, 00430$
	bit	7, d
	jr	NZ, 00431$
	cp	a, a
	jr	00431$
00430$:
	bit	7, d
	jr	Z, 00431$
	scf
00431$:
	jr	NC, 00127$
;src/main.c:459: int8_t xMovement = -((-enemies[i].xReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#12
	ld	(hl), c
;src/main.c:460: enemies[i].x += xMovement;
	ldhl	sp,#2
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
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:461: enemies[i].xReserve +=  (-xMovement) << 3;
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
00127$:
;src/main.c:448: enemies[i].yReserve += enemies[i].ySpeed;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/main.c:464: if (enemies[i].yReserve >> 3 > 0) {
	ld	b, c
	sra	b
	sra	b
	sra	b
	ld	e, b
	xor	a, a
	ld	d, a
	sub	a, b
	bit	7, e
	jr	Z, 00432$
	bit	7, d
	jr	NZ, 00433$
	cp	a, a
	jr	00433$
00432$:
	bit	7, d
	jr	Z, 00433$
	scf
00433$:
	jr	NC, 00131$
;src/main.c:465: int8_t yMovement = enemies[i].yReserve >> 3;
	ldhl	sp,	#14
	ld	(hl), b
;src/main.c:466: enemies[i].y += yMovement;
	ldhl	sp,#4
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
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:467: enemies[i].yReserve -=  yMovement << 3;
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
	jr	00133$
00131$:
;src/main.c:469: else if ((-enemies[i].yReserve) >> 3 > 0){
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
	jr	Z, 00434$
	bit	7, d
	jr	NZ, 00435$
	cp	a, a
	jr	00435$
00434$:
	bit	7, d
	jr	Z, 00435$
	scf
00435$:
	jr	NC, 00133$
;src/main.c:470: int8_t yMovement = -((-enemies[i].yReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#14
	ld	(hl), c
;src/main.c:471: enemies[i].y += yMovement;
	ldhl	sp,#4
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
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:472: enemies[i].yReserve +=  (-yMovement) << 3;
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
00133$:
;src/main.c:408: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	inc	(hl)
	jp	00196$
00134$:
;src/main.c:479: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	ld	(hl), #0x00
00198$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jp	NC, 00200$
;src/main.c:481: if (enemies[i].alive) {
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
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00157$
;src/main.c:482: if (enemies[i].visible == 1) {
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/main.c:483: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
;src/main.c:485: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#15
	ld	e, (hl)
;src/main.c:483: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#8
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;src/main.c:485: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl+), a
	ld	a, e
	add	a, a
;src/main.c:483: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	rlca
	and	a,#0x01
;src/main.c:485: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	add	a, #0x0a
	ld	(hl), a
;src/main.c:482: if (enemies[i].visible == 1) {
	ldhl	sp,	#7
	ld	a, (hl)
	dec	a
	jr	NZ, 00154$
;src/main.c:483: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	NZ, 00135$
	ldhl	sp,	#10
	ld	a, #0xac
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00439$
	bit	7, d
	jr	NZ, 00440$
	cp	a, a
	jr	00440$
00439$:
	bit	7, d
	jr	Z, 00440$
	scf
00440$:
	jr	C, 00135$
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	NZ, 00135$
	ld	e, b
	ld	d, #0x00
	ld	a, #0x98
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00441$
	bit	7, d
	jr	NZ, 00442$
	cp	a, a
	jr	00442$
00441$:
	bit	7, d
	jr	Z, 00442$
	scf
00442$:
	jp	NC, 00157$
00135$:
;src/main.c:484: enemies[i].visible = 0;
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:485: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:486: set_sprite_tile(10+(i<<1)+1, 0x7f);
	ldhl	sp,	#12
	ld	a, (hl)
	add	a, #0x0b
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
	ld	(hl), #0x7f
;src/main.c:486: set_sprite_tile(10+(i<<1)+1, 0x7f);
	jp	00157$
00154$:
;src/main.c:490: if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
	ldhl	sp,	#13
	bit	0, (hl)
	jp	NZ, 00148$
	ldhl	sp,	#10
	ld	a, (hl+)
	sub	a, #0xac
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00443$
	bit	7, d
	jr	NZ, 00444$
	cp	a, a
	jr	00444$
00443$:
	bit	7, d
	jr	Z, 00444$
	scf
00444$:
	jr	NC, 00148$
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, h
	xor	a, a
	ld	d, a
	cp	a, l
	sbc	a, h
	bit	7, e
	jr	Z, 00445$
	bit	7, d
	jr	NZ, 00446$
	cp	a, a
	jr	00446$
00445$:
	bit	7, d
	jr	Z, 00446$
	scf
00446$:
	jr	NC, 00148$
	ld	a, l
	sub	a, #0x98
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00148$
;src/main.c:491: enemies[i].visible = 1;
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;src/main.c:492: set_sprite_tile(10+(i<<1), enemies[i].sprite0);
	ldhl	sp,#1
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
;src/main.c:493: if (enemies[i].spriteCount == 2) {
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x02
	jp	NZ,00157$
;src/main.c:494: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#12
	ld	a, (hl)
	add	a, #0x0b
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
;src/main.c:494: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
	jp	00157$
00148$:
;src/main.c:497: else if (enemies[i].x < -100 || enemies[i].x > 272 || enemies[i].y < -100 || enemies[i].y > 252) {
	ldhl	sp,	#8
	ld	a, (hl+)
	sub	a, #0x9c
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00449$
	bit	7, d
	jr	NZ, 00450$
	cp	a, a
	jr	00450$
00449$:
	bit	7, d
	jr	Z, 00450$
	scf
00450$:
	jr	C, 00142$
	ldhl	sp,	#10
	ld	a, #0x10
	sub	a, (hl)
	inc	hl
	ld	a, #0x01
	sbc	a, (hl)
	ld	a, #0x01
	ld	d, a
	bit	7, (hl)
	jr	Z, 00451$
	bit	7, d
	jr	NZ, 00452$
	cp	a, a
	jr	00452$
00451$:
	bit	7, d
	jr	Z, 00452$
	scf
00452$:
	jr	C, 00142$
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x9c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00142$
	ld	e, b
	ld	d, #0x00
	ld	a, #0xfc
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00453$
	bit	7, d
	jr	NZ, 00454$
	cp	a, a
	jr	00454$
00453$:
	bit	7, d
	jr	Z, 00454$
	scf
00454$:
	jr	NC, 00157$
00142$:
;src/main.c:498: enemies[i].alive = 0;
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:499: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:500: set_sprite_tile(10+(i<<1)+1, 0x7f);
	ldhl	sp,	#12
	ld	a, (hl)
	add	a, #0x0b
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
	ld	(hl), #0x7f
;src/main.c:501: initEnemies(0);
	xor	a, a
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
00157$:
;src/main.c:505: if (enemies[i].spriteCount == 1) {
	ldhl	sp,	#15
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	c, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	b, a
	ld	hl, #0x0008
	add	hl, bc
	ld	e, (hl)
;src/main.c:485: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#15
	ld	a, (hl-)
	add	a, a
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x0a
	ldhl	sp,	#10
	ld	(hl), a
;src/main.c:505: if (enemies[i].spriteCount == 1) {
	dec	e
	jr	NZ, 00165$
;src/main.c:506: move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	add	a, #0x0c
	ld	e, a
	ld	a, (bc)
	add	a, #0x04
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#10
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
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
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(de), a
;src/main.c:507: if (enemies[i].xSpeed >= 0) {
	ld	hl, #0x000e
	add	hl, bc
	bit	7, (hl)
	jr	NZ, 00159$
;src/main.c:508: set_sprite_prop(10+(i<<1), 0);
	ldhl	sp,	#10
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x00
;src/main.c:508: set_sprite_prop(10+(i<<1), 0);
	jp	00199$
00159$:
;src/main.c:511: set_sprite_prop(10+(i<<1), S_FLIPX);
	ldhl	sp,	#10
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x20
;src/main.c:511: set_sprite_prop(10+(i<<1), S_FLIPX);
	jp	00199$
00165$:
;src/main.c:516: if (enemies[i].xSpeed >= 0) {
	ld	hl, #0x000e
	add	hl, bc
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
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00162$
;src/main.c:517: set_sprite_prop(10+(i<<1), 0);
	ldhl	sp,	#10
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x00
;src/main.c:518: set_sprite_prop(10+(i<<1)+1, 0);
	ldhl	sp,	#14
	ld	a, (hl)
	add	a, #0x0b
	ldhl	sp,	#11
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x00
;src/main.c:519: move_sprite(10+ (i<<1), enemies[i].x , enemies[i].y + 8);
	ld	hl, #0x0002
	add	hl, bc
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	ld	(hl), a
	ldhl	sp,	#10
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
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
	ldhl	sp,	#14
;src/main.c:520: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	d, a
	ld	a, (bc)
	add	a, #0x08
	ld	e, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;src/main.c:520: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
	jr	00199$
00162$:
;src/main.c:523: set_sprite_prop(10+(i<<1), S_FLIPX);
	ldhl	sp,	#10
	ld	e, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x20
;src/main.c:524: set_sprite_prop(10+(i<<1)+1, S_FLIPX);
	ldhl	sp,	#14
	ld	a, (hl)
	add	a, #0x0b
	ldhl	sp,	#11
	ld	(hl), a
	ld	e, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x20
;src/main.c:525: move_sprite(10+ (i<<1), enemies[i].x +8, enemies[i].y + 8);
	ld	hl, #0x0002
	add	hl, bc
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	add	a, #0x08
	ld	(hl), a
	ldhl	sp,	#10
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
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
	ldhl	sp,	#14
;src/main.c:526: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	d, a
	ld	a, (bc)
	ld	e, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;src/main.c:526: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
00199$:
;src/main.c:479: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	inc	(hl)
	jp	00198$
00200$:
;src/main.c:532: }
	add	sp, #16
	ret
;src/main.c:537: void move() {
;	---------------------------------
; Function move
; ---------------------------------
_move::
	add	sp, #-8
;src/main.c:541: if (joydata & J_A) {
	ld	a, (#_joydata)
	bit	4, a
	jr	Z, 00102$
;src/main.c:542: xSpeed += xDir + xDir + xDir;
	ld	hl, #_xDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_xSpeed
	add	a, (hl)
	ld	(hl), a
;src/main.c:543: ySpeed += yDir + yDir + yDir;
	ld	hl, #_yDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_ySpeed
	add	a, (hl)
	ld	(hl), a
00102$:
;src/main.c:547: xSpeed = clamp(xSpeed, -100, 100);
	ld	hl, #_xSpeed
	ld	c, (hl)
;src/main.c:305: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:548: ySpeed = clamp(ySpeed, -100, 100);
	ld	hl, #_ySpeed
	ld	c, (hl)
;src/main.c:305: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:550: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:551: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:556: uint8_t xCollisionPoint = playerDrawX; 
	ld	hl, #_playerDrawX
	ld	c, (hl)
;src/main.c:559: xCollisionPoint = playerDrawX +8; //right edge
	ld	b, (hl)
;src/main.c:558: if (xSpeed > 0) {
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
;src/main.c:559: xCollisionPoint = playerDrawX +8; //right edge
	ld	a, b
	add	a, #0x08
	ld	c, a
00104$:
;src/main.c:561: if (xSpeed < 0) {
	ld	a, (#_xSpeed)
	bit	7, a
	jr	Z, 00106$
;src/main.c:562: xCollisionPoint = playerDrawX -8; //left edge
	ld	a, b
	add	a, #0xf8
	ld	c, a
00106$:
;src/main.c:566: int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;
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
;src/main.c:570: uint8_t bgindY = ((playerDrawY + bgY) >> 3)%32; 
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
;src/main.c:573: uint16_t ind = 32*bgindY + bgindX;
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
;src/main.c:574: uint8_t result = 1; // 0 incase of clear path, 1 for blocked
	ld	c, #0x01
;src/main.c:575: for (uint8_t i=0; i<BLANKSIZE; i++) {
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
;src/main.c:576: if (background1[ind] == BLANK[i] ) {
	ld	hl, #_BLANK
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ld	a, b
;src/main.c:577: result = 0;
	sub	a,d
	jr	NZ, 00159$
	ld	c,a
;src/main.c:578: break;
	jr	00109$
00159$:
;src/main.c:575: for (uint8_t i=0; i<BLANKSIZE; i++) {
	inc	e
	jr	00158$
00109$:
;src/main.c:582: if (result == 0) {
	ld	a, c
	or	a, a
	jp	NZ, 00114$
;src/main.c:583: playerX+=xSpeed;
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
;src/main.c:585: uint16_t limitedPlayerX = u16Clamp(playerX, 68<<5, 92<<5);//0->160, with 8 px margin for left edge & 50px for the edges
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x80
	ld	a, b
	sbc	a, #0x08
	jr	NC, 00173$
	ld	bc, #0x0880
	jr	00174$
00173$:
	ld	a, #0x80
	cp	a, c
	ld	a, #0x0b
	sbc	a, b
	jr	NC, 00175$
	ld	bc, #0x0b80
00175$:
00174$:
	ld	e,c
	ld	d,b
;src/main.c:587: xOverflow = (playerX - limitedPlayerX);
	ld	a, (#_playerX)
	sub	a, e
	ld	(#_xOverflow),a
	ld	a, (#_playerX + 1)
	sbc	a, d
	ld	hl, #_xOverflow + 1
;src/main.c:588: if (xOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_xOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00111$
;src/main.c:589: xOverflow = xOverflow >> 5;
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
;src/main.c:592: xOverflow = -((-xOverflow) >> 5);
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
;src/main.c:594: bgX += xOverflow;
	ld	a, (#_bgX)
	ld	hl, #_xOverflow
	add	a, (hl)
	ld	hl, #_bgX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_xOverflow + 1
	adc	a, (hl)
	ld	(#_bgX + 1),a
;src/main.c:595: playerX = limitedPlayerX;
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;src/main.c:596: playerDrawX=playerX >> 5;
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
;src/main.c:604: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
00115$:
;src/main.c:612: uint8_t yCollisionPoint = playerDrawY; 
	ld	a, (#_playerDrawY)
	ldhl	sp,	#7
	ld	(hl), a
;src/main.c:615: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	hl, #_playerDrawY
	ld	c, (hl)
;src/main.c:614: if (ySpeed > 0) {
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
;src/main.c:615: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#7
	ld	(hl), a
00117$:
;src/main.c:617: if (ySpeed < 0) {
	ld	a, (#_ySpeed)
	bit	7, a
	jr	Z, 00119$
;src/main.c:618: yCollisionPoint = playerDrawY -8; //top edge, 
	ld	a, c
	add	a, #0xf8
	ldhl	sp,	#7
	ld	(hl), a
00119$:
;src/main.c:622: bgindX = ((playerDrawX + bgX) >> 3)%32;
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
;src/main.c:625: bgindY = ((yCollisionPoint + bgY) >> 3)%32; 
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
;src/main.c:628: ind = 32*bgindY + bgindX;
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
;src/main.c:629: result = 1;
	ldhl	sp,	#3
	ld	(hl), #0x01
;src/main.c:630: for (uint8_t j=0; j<BLANKSIZE; j++) {
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
;src/main.c:631: if (background1[ind] == BLANK[j] ) {
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
;src/main.c:632: result = 0;
	ldhl	sp,	#3
	ld	(hl), #0x00
;src/main.c:633: break;
	jr	00122$
00162$:
;src/main.c:630: for (uint8_t j=0; j<BLANKSIZE; j++) {
	ldhl	sp,	#7
	inc	(hl)
	jr	00161$
00122$:
;src/main.c:637: if (result == 0) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jp	NZ, 00127$
;src/main.c:638: playerY += ySpeed;
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
;src/main.c:640: uint16_t limitedPlayerY = u16Clamp(playerY, 48<<5, 78<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, d
	sub	a, #0x06
	jr	NC, 00177$
	ld	de, #0x0600
	jr	00178$
00177$:
	ld	a, #0xc0
	cp	a, e
	ld	a, #0x09
	sbc	a, d
	jr	NC, 00179$
	ld	de, #0x09c0
00179$:
00178$:
	ld	c, e
	ld	b, d
;src/main.c:642: yOverflow = (playerY - limitedPlayerY);
	ld	a, (#_playerY)
	sub	a, e
	ld	(#_yOverflow),a
	ld	a, (#_playerY + 1)
	sbc	a, d
	ld	hl, #_yOverflow + 1
;src/main.c:643: if (yOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_yOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00124$
;src/main.c:644: yOverflow = yOverflow >> 5;
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
;src/main.c:647: yOverflow = -((-yOverflow) >> 5);
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
;src/main.c:649: bgY += yOverflow;
	ld	a, (#_bgY)
	ld	hl, #_yOverflow
	add	a, (hl)
	ld	hl, #_bgY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_yOverflow + 1
	adc	a, (hl)
	ld	(#_bgY + 1),a
;src/main.c:650: playerY = limitedPlayerY;
	ld	hl, #_playerY
	ld	a, c
	ld	(hl+), a
;src/main.c:651: playerDrawY=playerY >> 5;
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
;src/main.c:656: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
00128$:
;src/main.c:556: uint8_t xCollisionPoint = playerDrawX; 
	ld	a, (#_playerDrawX)
	ldhl	sp,	#7
	ld	(hl), a
;src/main.c:615: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, (#_playerDrawY)
	add	a, #0x08
	ldhl	sp,	#6
	ld	(hl), a
;src/main.c:659: if (xDir >= 0) {
	ld	a, (#_xDir)
	bit	7, a
	jr	NZ, 00130$
;src/main.c:660: move_sprite(0, playerDrawX , playerDrawY + 8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	de, #_shadow_OAM
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 1)
	ld	a, (hl)
	ld	(de), a
;src/main.c:662: move_sprite(1, playerDrawX +8, playerDrawY +8);
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
;src/main.c:662: move_sprite(1, playerDrawX +8, playerDrawY +8);
	jr	00131$
00130$:
;src/main.c:665: move_sprite(1, playerDrawX , playerDrawY +8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 4)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/main.c:667: move_sprite(0, playerDrawX +8, playerDrawY +8);
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
;src/main.c:667: move_sprite(0, playerDrawX +8, playerDrawY +8);
00131$:
;src/main.c:672: if (bgX >= 256) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00133$
;src/main.c:673: bgX = bgX % 256;
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
;src/main.c:675: if (bgX < 0) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00135$
;src/main.c:676: bgX = 255 - (bgX % 256);
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
;src/main.c:678: if (bgY >= 256) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00137$
;src/main.c:679: bgY = bgY % 256;
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
;src/main.c:681: if (bgY < 0) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00139$
;src/main.c:682: bgY = 255 - (bgY % 256);
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
;src/main.c:685: move_bkg(bgX, bgY);
	ld	hl, #_bgY
	ld	c, (hl)
	ld	a, (#_bgX)
	ldh	(_SCX_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/main.c:688: if (ySpeed > 0) ySpeed--;
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
;src/main.c:689: if (ySpeed < 0) ySpeed++;
	ld	hl, #_ySpeed
	bit	7, (hl)
	jr	Z, 00143$
	inc	(hl)
00143$:
;src/main.c:690: if (xSpeed > 0) xSpeed--;
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
;src/main.c:691: if (xSpeed < 0) xSpeed++;
	ld	hl, #_xSpeed
	bit	7, (hl)
	jr	Z, 00163$
	inc	(hl)
00163$:
;src/main.c:695: }
	add	sp, #8
	ret
;src/main.c:697: void takeDamage(int16_t amount) {
;	---------------------------------
; Function takeDamage
; ---------------------------------
_takeDamage::
	dec	sp
;src/main.c:698: if (amount > shield) {
	ld	a, (#_shield)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
;src/main.c:700: hull -= (amount - shield);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/main.c:698: if (amount > shield) {
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
;src/main.c:699: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;src/main.c:700: hull -= (amount - shield);
	ld	a, (#_hull)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_hull),a
	jr	00104$
00102$:
;src/main.c:703: shield -= amount;
	ld	a, (#_shield)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_shield),a
00104$:
;src/main.c:705: }
	inc	sp
	ret
;src/main.c:707: void spawnPickup(int16_t x, int16_t y) {
;	---------------------------------
; Function spawnPickup
; ---------------------------------
_spawnPickup::
;src/main.c:708: uint8_t spawn = ((uint8_t)rand()) % (uint8_t) 16;
	call	_rand
	ld	a, e
	and	a, #0x0f
	ret	NZ
;src/main.c:709: if (spawn == 0) {
;src/main.c:710: uint8_t type = ((uint8_t)rand()) % (uint8_t) 2;
	call	_rand
	ld	a, e
	rrca
	jr	C, 00102$
;src/main.c:712: if (type == 0 && gunLevel < MAXGUNLEVEL) {
	ld	hl, #_MAXGUNLEVEL
	ld	c, (hl)
	ld	a, (#_gunLevel)
	sub	a, c
	jr	NC, 00102$
;src/main.c:713: pickup = upgrade;
	ld	de, #0x0008
	push	de
	ld	de, #_upgrade
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
	jr	00103$
00102$:
;src/main.c:716: pickup = ammo;
	ld	de, #0x0008
	push	de
	ld	de, #_ammo
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
00103$:
;src/main.c:718: pickup.active = 1;
	ld	hl, #(_pickup + 4)
	ld	(hl), #0x01
;src/main.c:720: pickup.x = x;
	ld	de, #_pickup
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/main.c:721: pickup.y = y;
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_pickup + 2)
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:723: set_sprite_tile(3, pickup.tile); //0x7f
	ld	hl, #_pickup + 7
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;src/main.c:723: set_sprite_tile(3, pickup.tile); //0x7f
;src/main.c:729: }
	ret
;src/main.c:731: void checkCollision() {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-17
;src/main.c:738: struct Enemy *eptr = enemies + enemyCollisionCount;
	ld	bc, #_enemies+0
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
	add	hl, bc
	ld	c, l
	ld	a, h
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/main.c:739: uint8_t i = enemyCollisionCount;
	ld	a, (#_enemyCollisionCount)
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:741: if (eptr->visible && eptr->alive) {
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00127$
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00127$
;src/main.c:743: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	dec	a
	ld	a, #0x01
	jr	Z, 00283$
	xor	a, a
00283$:
	ldhl	sp,	#13
	ld	(hl), a
	ld	a, (#_playerDrawX)
	ldhl	sp,	#14
	ld	(hl), a
;src/main.c:744: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00285$
	xor	a, a
00285$:
	ldhl	sp,	#15
;src/main.c:743: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
;src/main.c:324: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00135$
;src/main.c:325: else return - value;
	xor	a, a
	ldhl	sp,	#16
	sub	a, (hl)
	ld	(hl), a
;src/main.c:743: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
00135$:
	ldhl	sp,	#16
	ld	e, (hl)
	ld	a,#0x08
	ld	d,a
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
	jr	NC, 00106$
00110$:
;src/main.c:744: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jp	Z, 00107$
	dec	hl
	pop	de
	push	de
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
;src/main.c:324: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00139$
;src/main.c:325: else return - value;
	xor	a, a
	ldhl	sp,	#16
	sub	a, (hl)
	ld	c, a
	ld	(hl), c
;src/main.c:744: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
00139$:
	ldhl	sp,	#16
	ld	e, (hl)
	ld	a,#0x10
	ld	d,a
	sub	a, (hl)
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
	jp	C, 00107$
00106$:
;src/main.c:745: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (#_playerDrawY)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	ld	a, (bc)
	ldhl	sp,	#16
	sub	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:324: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00143$
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:745: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
00143$:
	ld	e, l
	ld	a,#0x08
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
	jr	NC, 00101$
00105$:
;src/main.c:746: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
	inc	hl
	ld	a, (bc)
	sub	a, (hl)
	ld	c, a
;src/main.c:324: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00147$
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:746: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
00147$:
	ld	e, c
	ld	a,#0x10
	ld	d,a
	sub	a, c
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
	jr	C, 00107$
00101$:
;src/main.c:748: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, #0x0a
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
	ld	(hl), #0x7f
;src/main.c:749: set_sprite_tile(10+(i<<1)+1, 0x7f);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, #0x0b
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
	ld	(hl), #0x7f
;src/main.c:750: eptr->alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:751: eptr->visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:752: takeDamage(eptr->damage);
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_takeDamage
	pop	hl
;src/main.c:753: initEnemies(0);
	xor	a, a
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/main.c:754: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
00107$:
;src/main.c:760: struct Projectile *pptr = projectiles;
	ldhl	sp,	#14
	ld	a, #<(_projectiles)
	ld	(hl+), a
	ld	(hl), #>(_projectiles)
;src/main.c:762: while (j < PROJECTILECOUNT) {
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#16
	ld	(hl), #0x00
00123$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#16
	ld	a, (hl)
	sub	a, c
	jp	NC, 00127$
;src/main.c:763: if (pptr->active) {
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00122$
;src/main.c:767: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	dec	a
	ld	a, #0x01
	jr	Z, 00295$
	xor	a, a
00295$:
	ldhl	sp,	#11
	ld	(hl), a
;src/main.c:768: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00297$
	xor	a, a
00297$:
	ldhl	sp,	#12
;src/main.c:767: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00120$
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,#14
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
;src/main.c:324: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00153$
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:767: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
00153$:
	ld	e, c
	ld	a,#0x08
	ld	d,a
	sub	a, c
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
	jr	NC, 00116$
00120$:
;src/main.c:768: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jp	Z, 00122$
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,#14
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ld	(hl), a
;src/main.c:324: if (value >= 0) return value;
	bit	7, (hl)
	jr	NZ, 00155$
	ld	c, (hl)
	jr	00157$
00155$:
;src/main.c:325: else return - value;
	xor	a, a
	ldhl	sp,	#13
	sub	a, (hl)
	ld	c, a
;src/main.c:768: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
00157$:
	ld	e, c
	ld	a,#0x10
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00300$
	bit	7, d
	jr	NZ, 00301$
	cp	a, a
	jr	00301$
00300$:
	bit	7, d
	jr	Z, 00301$
	scf
00301$:
	jp	C, 00122$
00116$:
;src/main.c:769: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	ld	a, (bc)
	ld	e, a
	pop	af
	sub	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:324: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00161$
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:769: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
00161$:
	ld	e, l
	ld	a,#0x08
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00302$
	bit	7, d
	jr	NZ, 00303$
	cp	a, a
	jr	00303$
00302$:
	bit	7, d
	jr	Z, 00303$
	scf
00303$:
	jr	NC, 00111$
00115$:
;src/main.c:770: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jp	Z, 00122$
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	ld	a, (bc)
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
;src/main.c:324: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00165$
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:770: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
00165$:
	ld	e, c
	ld	a,#0x10
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00304$
	bit	7, d
	jr	NZ, 00305$
	cp	a, a
	jr	00305$
00304$:
	bit	7, d
	jr	Z, 00305$
	scf
00305$:
	jp	C, 00122$
00111$:
;src/main.c:773: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	ld	c, a
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
	ld	(hl), #0x7f
;src/main.c:774: set_sprite_tile(10+(i<<1)+1, 0x7f);
	ld	a, c
	add	a, #0x0b
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
;src/main.c:776: spawnPickup(eptr->x, eptr->y);
	ldhl	sp,#9
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
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	call	_spawnPickup
	add	sp, #4
;src/main.c:778: eptr->alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:779: eptr->visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:780: initEnemies(0);
	xor	a, a
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/main.c:781: set_sprite_tile(30+j, 0x7f);
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x1e
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
;src/main.c:782: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:783: pptr->active = 0;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:784: incrementScore();
	call	_incrementScore
;src/main.c:785: updateScore();
	call	_updateScore
00122$:
;src/main.c:792: j++;
	ldhl	sp,	#16
	inc	(hl)
;src/main.c:793: pptr++;
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
	jp	00123$
00127$:
;src/main.c:797: if (enemyCollisionCount == 0) {
	ld	a, (#_enemyCollisionCount)
	or	a, a
	jr	NZ, 00130$
;src/main.c:798: enemyCollisionCount = ENEMYCOUNT - 1;
	ld	a, (#_ENEMYCOUNT)
	dec	a
	ld	(#_enemyCollisionCount),a
	jr	00169$
00130$:
;src/main.c:801: enemyCollisionCount--;
	ld	hl, #_enemyCollisionCount
	dec	(hl)
00169$:
;src/main.c:806: }
	add	sp, #17
	ret
;src/main.c:809: void setGunIcon() {
;	---------------------------------
; Function setGunIcon
; ---------------------------------
_setGunIcon::
;src/main.c:811: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00102$
;src/main.c:812: set_win_tiles(15, 0,1,1,gunMap+gunLevel);
	ld	bc, #_gunMap+0
	ld	a, c
	ld	hl, #_gunLevel
	add	a, (hl)
	ld	c, a
	jr	NC, 00111$
	inc	b
00111$:
	push	bc
	ld	hl, #0x101
	push	hl
	ld	hl, #0x0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
	ret
00102$:
;src/main.c:815: set_win_tiles(15, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:817: }
	ret
;src/main.c:827: void fire() {
;	---------------------------------
; Function fire
; ---------------------------------
_fire::
	add	sp, #-5
;src/main.c:829: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	inc	(hl)
	ld	a, (hl)
;src/main.c:830: if (oldestProjectile >= PROJECTILECOUNT) {
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ld	hl, #_oldestProjectile
	ld	a, (hl)
	sub	a, c
	jr	C, 00102$
;src/main.c:831: oldestProjectile = 0;
	ld	(hl), #0x00
00102$:
;src/main.c:834: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00107$
;src/main.c:836: projectiles[oldestProjectile] = singleGun;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;src/main.c:835: if (gunLevel == 0) {
	ld	a, (#_gunLevel)
	or	a, a
	jr	NZ, 00104$
;src/main.c:836: projectiles[oldestProjectile] = singleGun;
	ld	de, #_singleGun+0
	ld	hl, #_projectiles
	add	hl, bc
	ld	bc, #0x000c
	push	bc
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
	jr	00107$
00104$:
;src/main.c:839: projectiles[oldestProjectile] = doubleGun;
	ld	de, #_doubleGun+0
	ld	hl, #_projectiles
	add	hl, bc
	ld	bc, #0x000c
	push	bc
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
00107$:
;src/main.c:842: if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00113$
;src/main.c:843: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00109$
;src/main.c:844: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:845: setGunIcon();
	call	_setGunIcon
;src/main.c:846: return;
	jp	00154$
00109$:
;src/main.c:849: projectiles[oldestProjectile] = missile;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	ld	de, #0x000c
	push	de
	ld	de, #_missile
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
;src/main.c:850: updateMissileCount(-1);
	ld	a, #0xff
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:852: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00113$
;src/main.c:853: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:854: setGunIcon();
	call	_setGunIcon
00113$:
;src/main.c:857: projectiles[oldestProjectile].x = playerDrawX;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	push	hl
	ld	a, (#_playerDrawX)
	pop	hl
	ld	c, #0x00
	ld	(hl+), a
	ld	(hl), c
;src/main.c:858: projectiles[oldestProjectile].y = playerDrawY;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
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
;src/main.c:859: projectiles[oldestProjectile].xSpeed = xDir * projectiles[oldestProjectile].speed;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0007
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
;src/main.c:860: projectiles[oldestProjectile].ySpeed = yDir * projectiles[oldestProjectile].speed;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0007
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
;src/main.c:829: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:836: projectiles[oldestProjectile] = singleGun;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
;src/main.c:865: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x1e
	ld	(hl), a
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:864: if (yDir != 0 && xDir == 0) {
	ld	a, (#_yDir)
	or	a, a
	jr	Z, 00140$
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00140$
;src/main.c:865: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	c, a
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
	ld	(hl), c
;src/main.c:829: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
;src/main.c:865: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	add	a, #0x1e
	ld	c, a
;src/main.c:866: if (yDir == 1) {
	ld	a, (#_yDir)
;src/main.c:867: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	dec	a
	jr	NZ, 00115$
	ld	h,a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x40
;src/main.c:868: projectiles[oldestProjectile].offset = 4;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x04
	jp	00141$
00115$:
;src/main.c:871: set_sprite_prop(30+oldestProjectile, 0); 
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x00
;src/main.c:872: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x0c
	jp	00141$
00140$:
;src/main.c:876: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
;src/main.c:875: else if (xDir != 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jp	Z, 00136$
	ld	a, (#_yDir)
	or	a, a
	jp	NZ, 00136$
;src/main.c:876: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
	ldhl	sp,	#4
	inc	(hl)
	inc	(hl)
	dec	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00260$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00260$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;src/main.c:829: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:865: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	a, (hl)
	add	a, #0x1e
	ld	(hl), a
;src/main.c:877: if (xDir == 1) {
	ld	a, (#_xDir)
	dec	a
	jr	NZ, 00118$
;src/main.c:878: set_sprite_prop(30+oldestProjectile, 0);
	ldhl	sp,	#4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00263$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00263$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:879: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_projectiles
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0c
	jp	00141$
00118$:
;src/main.c:882: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
	ldhl	sp,	#4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00264$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00264$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x20
;src/main.c:883: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_projectiles
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0c
	jp	00141$
00136$:
;src/main.c:887: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+4);
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, #0x04
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#3
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00265$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00265$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;src/main.c:888: if (xDir == 1 && yDir == -1) {
	ld	a, (#_xDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00267$
	xor	a, a
00267$:
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:829: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
;src/main.c:888: if (xDir == 1 && yDir == -1) {
	ld	a, (#_yDir)
	inc	a
	ld	a, #0x01
	jr	Z, 00269$
	xor	a, a
00269$:
	ldhl	sp,	#1
;src/main.c:865: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	(hl+), a
	ld	a, c
	add	a, #0x1e
;src/main.c:888: if (xDir == 1 && yDir == -1) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00132$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00132$
;src/main.c:889: set_sprite_prop(30+oldestProjectile, 0); //default is right & up
	inc	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00270$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00270$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:890: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_projectiles
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x0c
	jp	00141$
00132$:
;src/main.c:866: if (yDir == 1) {
	ld	a, (#_yDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00272$
	xor	a, a
00272$:
	ldhl	sp,	#3
;src/main.c:892: else if (xDir == 1 && yDir == 1) {
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00128$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00128$
;src/main.c:893: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
	dec	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00273$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00273$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x40
;src/main.c:894: projectiles[oldestProjectile].offset = 4;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_projectiles
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
	jp	00141$
00128$:
;src/main.c:896: else if (xDir == -1 && yDir == 1) {
	ld	a, (#_xDir)
	inc	a
	ld	a, #0x01
	jr	Z, 00275$
	xor	a, a
00275$:
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00124$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00124$
;src/main.c:897: set_sprite_prop(30+oldestProjectile, S_FLIPY | S_FLIPX);
	dec	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00276$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00276$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x60
;src/main.c:898: projectiles[oldestProjectile].offset = 4;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_projectiles
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
	jr	00141$
00124$:
;src/main.c:900: else if (xDir == -1 && yDir == -1) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00141$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00141$
;src/main.c:901: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
	inc	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00277$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00277$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x20
;src/main.c:902: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x0c
00141$:
;src/main.c:906: fireCooldown = projectiles[oldestProjectile].delay;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	ld	(#_fireCooldown),a
;src/main.c:908: playSound(projectiles[oldestProjectile].type);
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl)
	push	af
	inc	sp
	call	_playSound
	inc	sp
00154$:
;src/main.c:912: }
	add	sp, #5
	ret
;src/main.c:915: void moveProjectiles() {
;	---------------------------------
; Function moveProjectiles
; ---------------------------------
_moveProjectiles::
	add	sp, #-7
;src/main.c:916: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00112$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jp	NC, 00114$
;src/main.c:917: projectiles[i].x -= xOverflow;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
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
;src/main.c:918: projectiles[i].y -= yOverflow;
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
;src/main.c:920: if (projectiles[i].active) {
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00113$
;src/main.c:921: int16_t newY = projectiles[i].y + projectiles[i].ySpeed;
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
	ld	hl, #0x0006
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
;src/main.c:922: int16_t newX = projectiles[i].x + projectiles[i].xSpeed;
	pop	de
	push	de
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
;src/main.c:925: projectiles[i].y = newY;
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
;src/main.c:926: projectiles[i].x = newX;
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:930: move_sprite(30+i, newX +4 , newY + projectiles[i].offset);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	add	a, (hl)
	dec	hl
	ld	e, a
	ld	a, c
	add	a, #0x04
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	add	a, #0x1e
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
;src/main.c:934: if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
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
;src/main.c:918: projectiles[i].y -= yOverflow;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
;src/main.c:934: if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
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
;src/main.c:935: projectiles[i].active = 0;
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_projectiles
	add	hl, de
	ld	bc, #0x0009
	add	hl, bc
	ld	(hl), #0x00
;src/main.c:936: set_sprite_tile(30+i, 0x7f);
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
;src/main.c:936: set_sprite_tile(30+i, 0x7f);
00113$:
;src/main.c:916: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#6
	inc	(hl)
	jp	00112$
00114$:
;src/main.c:940: }
	add	sp, #7
	ret
;src/main.c:942: void tickPickups() {
;	---------------------------------
; Function tickPickups
; ---------------------------------
_tickPickups::
	dec	sp
;src/main.c:943: pickup.x -= xOverflow;
	ld	hl, #_pickup
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_xOverflow
	sub	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	sbc	a, (hl)
	ld	b, a
	ld	hl, #_pickup
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:944: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_yOverflow
	sub	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	sbc	a, (hl)
	ld	b, a
	ld	hl, #(_pickup + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:946: move_sprite(3, pickup.x + 4, pickup.y + 12);
	ld	a, c
	add	a, #0x0c
	ld	b, a
	ld	a, (#_pickup + 0)
	add	a, #0x04
	ld	c, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/main.c:947: if (pickup.active) {
	ld	a, (#(_pickup + 4) + 0)
	or	a, a
	jr	Z, 00123$
;src/main.c:948: if (abs(pickup.x - playerDrawX) < 10) {
	ld	a, (#_pickup + 0)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:324: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00117$
;src/main.c:325: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:948: if (abs(pickup.x - playerDrawX) < 10) {
00117$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00123$
;src/main.c:949: if (abs(pickup.y - playerDrawY) < 10) {
	ld	a, (#(_pickup + 2) + 0)
	ld	hl, #_playerDrawY
	ld	c, (hl)
	sub	a, c
	ldhl	sp,	#0
	ld	(hl), a
;src/main.c:324: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00121$
;src/main.c:325: else return - value;
	xor	a, a
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(hl), a
;src/main.c:949: if (abs(pickup.y - playerDrawY) < 10) {
00121$:
	ldhl	sp,	#0
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00123$
;src/main.c:950: if (pickup.type == 0) { //upgrade
	ld	bc, #_pickup + 5
	ld	a, (bc)
	or	a, a
	jr	NZ, 00104$
;src/main.c:951: if (gunLevel < 1) {
	ld	hl, #_gunLevel
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00104$
;src/main.c:952: gunLevel += 1;
	inc	(hl)
	ld	a, (hl)
;src/main.c:953: setGunIcon();
	push	bc
	call	_setGunIcon
	pop	bc
00104$:
;src/main.c:956: if (pickup.type == 1) { //missile ammo
	ld	a, (bc)
	dec	a
	jr	NZ, 00106$
;src/main.c:957: updateMissileCount(pickup.amount);
	ld	a, (#(_pickup + 6) + 0)
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
00106$:
;src/main.c:959: pickup.active = 0;
	ld	hl, #(_pickup + 4)
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:960: set_sprite_tile(3, 0x7f);
00123$:
;src/main.c:965: }
	inc	sp
	ret
;src/main.c:967: void initEnemyOptions() {
;	---------------------------------
; Function initEnemyOptions
; ---------------------------------
_initEnemyOptions::
;src/main.c:968: enemyOptions[0] = blob;
	ld	de, #0x0010
	push	de
	ld	de, #_blob
	push	de
	ld	de, #_enemyOptions
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:969: enemyOptions[1] = bomb;
	ld	de, #0x0010
	push	de
	ld	de, #_bomb
	push	de
	ld	de, #(_enemyOptions + 16)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:970: enemyOptions[2] = miniship;
	ld	de, #0x0010
	push	de
	ld	de, #_miniship
	push	de
	ld	de, #(_enemyOptions + 32)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:971: enemyOptions[3] = shieldship;
	ld	de, #0x0010
	push	de
	ld	de, #_shieldship
	push	de
	ld	de, #(_enemyOptions + 48)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:973: enemyOptions[4] = bigblob;
	ld	de, #0x0010
	push	de
	ld	de, #_bigblob
	push	de
	ld	de, #(_enemyOptions + 64)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:974: }
	ret
;src/main.c:977: void initProjectiles() {
;	---------------------------------
; Function initProjectiles
; ---------------------------------
_initProjectiles::
;src/main.c:978: set_sprite_data(0x20, 17, ProjectileTiles); 
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1120
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:980: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	xor	a, a
00103$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	cp	a, c
	ret	NC
	inc	a
;src/main.c:984: }
	jr	00103$
;src/main.c:986: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/main.c:989: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:990: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
;src/main.c:991: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
;src/main.c:992: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
;src/main.c:995: playerX = 80<<5;
	ld	hl, #_playerX
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;src/main.c:996: playerY = 80<<5;
	ld	hl, #_playerY
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;src/main.c:998: playerDrawX = 80;
	ld	hl, #_playerDrawX
	ld	(hl), #0x50
;src/main.c:999: playerDrawY = 80;
	ld	hl, #_playerDrawY
	ld	(hl), #0x50
;src/main.c:1002: bgX = 0;
	xor	a, a
	ld	hl, #_bgX
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1003: bgY = 0;
	xor	a, a
	ld	hl, #_bgY
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1005: hull = maxHull;
	ld	a, (#_maxHull)
	ld	(#_hull),a
;src/main.c:1006: shield = maxShield;
	ld	a, (#_maxShield)
	ld	(#_shield),a
;src/main.c:1008: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:1009: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/main.c:1010: set_sprite_data(0, 12, Player1);
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
;src/main.c:1016: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1020: font_init();
	call	_font_init
;src/main.c:1022: min_font = font_load(font_min); // 36 tiles of characters
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_min_font
	ld	a, e
	ld	(hl+), a
;src/main.c:1023: font_set(min_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;src/main.c:1024: set_win_tiles(1,0,4,1,hullabel);
	ld	de, #_hullabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1025: set_win_tiles(1,1,4,1,shieldlabel);
	ld	de, #_shieldlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1030: set_bkg_data(0x50,1,healthblock);
	ld	de, #_healthblock
	push	de
	ld	hl, #0x150
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1032: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1033: setHealthBar(1, shield);
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
;src/main.c:1040: set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1041: set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
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
;src/main.c:1047: set_bkg_data(0x51, 18, ProjectileTiles);
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1251
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1049: set_win_tiles(10, 0,4,1,weaponlabel);
	ld	de, #_weaponlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1050: set_win_tiles(10, 1,4,1,scorelabel);
	ld	de, #_scorelabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x10a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1052: setGunIcon();
	call	_setGunIcon
;src/main.c:1053: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:1054: SHOW_WIN;;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1056: SCORE = MAKE_BCD(00000);
	xor	a, a
	ld	hl, #_SCORE
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1057: updateScore();
	call	_updateScore
;src/main.c:1058: MISSILES = MAKE_BCD(1);
	ld	hl, #_MISSILES
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1059: updateMissileCount(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:1060: set_win_tiles(17, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1064: pickup = upgrade;//upgrade;
	ld	de, #0x0008
	push	de
	ld	de, #_upgrade
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1066: set_sprite_data(0x70, 4, Pickups);
	ld	de, #_Pickups
	push	de
	ld	hl, #0x470
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1070: move_sprite(3, pickup.x + 4, pickup.y + 12);
	ld	a, (#(_pickup + 2) + 0)
	add	a, #0x0c
	ld	b, a
	ld	a, (#_pickup + 0)
	add	a, #0x04
	ld	c, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/main.c:1070: move_sprite(3, pickup.x + 4, pickup.y + 12);
;src/main.c:1072: }
	ret
;src/main.c:1074: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:1077: initEnemyOptions();
	call	_initEnemyOptions
;src/main.c:1080: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG + 0), a
;src/main.c:1081: LYC_REG = 0x7e; //line 126
	ld	a, #0x7e
	ldh	(_LYC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1083: add_LCD(interruptLCD);
	ld	de, #_interruptLCD
	push	de
	call	_add_LCD
	inc	sp
	inc	sp
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;src/main.c:1085: set_interrupts(VBL_IFLAG | LCD_IFLAG);   
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;src/main.c:1089: NR52_REG = 0x80; // sound on 
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/main.c:1090: NR50_REG = 0x77; // volume
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/main.c:1091: NR51_REG = 0xFF; // all channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/main.c:1095: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1096: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;src/main.c:1097: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;src/main.c:1098: initrand(seed);
	push	bc
	call	_initrand
	pop	hl
;src/main.c:1103: initGame();
	call	_initGame
;src/main.c:1104: initEnemies(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/main.c:1105: initProjectiles();
	call	_initProjectiles
;src/main.c:1107: while(1) {
00117$:
;src/main.c:1108: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1110: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1112: updateDirection(); // set player direction
	call	_updateDirection
;src/main.c:1115: move(); 
	call	_move
;src/main.c:1117: updateEnemyPositions();
	call	_updateEnemyPositions
;src/main.c:1120: checkCollision(); 
	call	_checkCollision
;src/main.c:820: if (shield < maxShield) {
	ld	hl, #_maxShield
	ld	c, (hl)
	ld	e, c
	ld	hl, #_shield
	ld	d, (hl)
	ld	a, (hl)
	sub	a, c
	bit	7, e
	jr	Z, 00179$
	bit	7, d
	jr	NZ, 00180$
	cp	a, a
	jr	00180$
00179$:
	bit	7, d
	jr	Z, 00180$
	scf
00180$:
	jr	NC, 00125$
;src/main.c:821: shield += 1;
	ld	hl, #_shield
	inc	(hl)
00125$:
;src/main.c:823: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:824: setHealthBar(1, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1125: if (joydata & J_B && fireCooldown == 0) {
	ld	a, (#_joydata)
	bit	5, a
	jr	Z, 00102$
	ld	a, (#_fireCooldown)
	or	a, a
	jr	NZ, 00102$
;src/main.c:1126: fire();
	call	_fire
00102$:
;src/main.c:1128: if (fireCooldown > 0) {
	ld	hl, #_fireCooldown
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;src/main.c:1129: --fireCooldown;
	dec	(hl)
00105$:
;src/main.c:1132: if (joydata & J_SELECT && switchDelay == 0) {
	ld	a, (#_joydata)
	bit	6, a
	jr	Z, 00112$
	ld	a, (#_switchDelay)
	or	a, a
	jr	NZ, 00112$
;src/main.c:1133: if (currentGun == 0) {
	ld	hl, #_currentGun
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
;src/main.c:1134: currentGun = 1;
	ld	(hl), #0x01
	jr	00110$
00109$:
;src/main.c:1136: else if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00110$
;src/main.c:1137: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
00110$:
;src/main.c:1139: setGunIcon();
	call	_setGunIcon
;src/main.c:1140: switchDelay = 30;
	ld	hl, #_switchDelay
	ld	(hl), #0x1e
00112$:
;src/main.c:1142: if (switchDelay != 0) {
	ld	hl, #_switchDelay
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
;src/main.c:1143: switchDelay--;
	dec	(hl)
00115$:
;src/main.c:1145: moveProjectiles();
	call	_moveProjectiles
;src/main.c:1146: tickPickups();
	call	_tickPickups
;src/main.c:1151: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1152: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
;src/main.c:1157: }
	jp	00117$
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
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
__xinit__bomb:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x05	;  5
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
__xinit__miniship:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x05	;  5
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
__xinit__bigblob:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x50	; 80	'P'
	.db #0x52	; 82	'R'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
__xinit__shieldship:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x54	; 84	'T'
	.db #0x56	; 86	'V'
	.db #0x02	; 2
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
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x26	; 38
__xinit__missile:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x2c	; 44
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
__xinit__gunLevel:
	.db #0x00	; 0
__xinit__currentGun:
	.db #0x00	; 0
__xinit__missiles:
	.db #0x01	; 1
__xinit__MISSILES:
	.byte #0x01, #0x00, #0x00, #0x00	; 1
__xinit__switchDelay:
	.db #0x00	; 0
__xinit__gunMap:
	.db #0x53	; 83	'S'
	.db #0x5b	; 91
	.db #0x61	; 97	'a'
__xinit__score:
	.dw #0x0000
__xinit__SCORE:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__INCREMENT:
	.byte #0x01, #0x00, #0x00, #0x00	; 1
	.area _CABS (ABS)
