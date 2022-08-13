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
	.globl _tickEx
	.globl _tickPickups
	.globl _moveProjectiles
	.globl _fire
	.globl _setGunIcon
	.globl _checkCollision
	.globl _killEnemy
	.globl _spawnPickup
	.globl _takeDamage
	.globl _move
	.globl _updateEnemyPositions
	.globl _initEnemy
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
	.globl _auxTick
	.globl _exTiles
	.globl _oldestEx
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
	.globl _explosions
	.globl _pickup
	.globl _min_font
	.globl _shield
	.globl _hull
	.globl _joydata
	.globl _projectiles
	.globl _enemies
	.globl _enemyOptions
	.globl _AUXTICKFREQUENCY
	.globl _exTileCount
	.globl _EXPLFRAMETIME
	.globl _exCount
	.globl _SPLASHDROPOFF
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
	.globl _Ex3
	.globl _Ex2
	.globl _Ex1
	.globl _ex
	.globl _Player1
	.globl _Pickups
	.globl _health
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
	.ds 90
_enemies::
	.ds 90
_projectiles::
	.ds 65
_joydata::
	.ds 1
_hull::
	.ds 1
_shield::
	.ds 1
_min_font::
	.ds 2
_pickup::
	.ds 9
_explosions::
	.ds 18
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
	.ds 18
_bomb::
	.ds 18
_miniship::
	.ds 18
_bigblob::
	.ds 18
_shieldship::
	.ds 18
_singleGun::
	.ds 13
_doubleGun::
	.ds 13
_missile::
	.ds 13
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
_oldestEx::
	.ds 1
_exTiles::
	.ds 3
_auxTick::
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
;src/main.c:153: void interruptLCD()
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;src/main.c:155: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:156: }
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
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
_ammo:
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x72	; 114	'r'
_health:
	.db #0x01	; 1
	.dw #0x0000
	.dw #0x0000
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x32	; 50	'2'
	.db #0x74	; 116	't'
_Pickups:
	.db #0x7e	; 126
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
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
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
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x18	; 24
	.db #0x99	; 153
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x99	; 153
	.db #0x18	; 24
	.db #0x99	; 153
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
_ex:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Ex1:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x18	; 24
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_Ex2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
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
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xde	; 222
	.db #0xde	; 222
	.db #0x9e	; 158
	.db #0x9e	; 158
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
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
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
_Ex3:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x20	; 32
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x3e	; 62
	.db #0x3e	; 62
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
_SPLASHDROPOFF:
	.db #0x01	; 1
_exCount:
	.db #0x03	; 3
_EXPLFRAMETIME:
	.db #0x03	; 3
_exTileCount:
	.db #0x03	; 3
_AUXTICKFREQUENCY:
	.db #0x01	; 1
;src/main.c:159: void setHealthBar(uint8_t row, uint8_t hp) {
;	---------------------------------
; Function setHealthBar
; ---------------------------------
_setHealthBar::
	add	sp, #-5
;src/main.c:161: if (hp >= 80) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x50
	jr	C, 00102$
;src/main.c:162: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x50};
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
;src/main.c:163: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:164: return;
	jp	00109$
00102$:
;src/main.c:166: if (hp >= 60) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00104$
;src/main.c:167: unsigned char blockmap[] = {0x50,0x50,0x50,0x50,0x00};
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
;src/main.c:168: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:169: return;
	jp	00109$
00104$:
;src/main.c:171: if (hp >= 40) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00106$
;src/main.c:172: unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
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
;src/main.c:173: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:174: return;
	jr	00109$
00106$:
;src/main.c:176: if (hp >= 20) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x14
	jr	C, 00108$
;src/main.c:177: unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
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
;src/main.c:178: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:179: return;
	jr	00109$
00108$:
;src/main.c:181: unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
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
;src/main.c:182: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:183: return;
00109$:
;src/main.c:185: }
	add	sp, #5
	ret
;src/main.c:187: void updateScore() {
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
	add	sp, #-10
;src/main.c:191: len = bcd2text(&SCORE, 0x01, buf);
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
;src/main.c:192: set_win_tiles(15, 1, 5, 1, buf+3);
	inc	bc
	inc	bc
	inc	bc
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x10f
	push	hl
	call	_set_win_tiles
;src/main.c:193: }
	add	sp, #16
	ret
;src/main.c:195: void updateMissileCount(int8_t amount) {
;	---------------------------------
; Function updateMissileCount
; ---------------------------------
_updateMissileCount::
	add	sp, #-10
;src/main.c:196: if (amount == -1) {
	ldhl	sp,	#12
	ld	a, (hl)
	inc	a
	jr	NZ, 00112$
;src/main.c:197: missiles--;
	ld	hl, #_missiles
	dec	(hl)
;src/main.c:198: bcd_sub(&MISSILES, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_sub
	add	sp, #4
	jr	00104$
;src/main.c:201: for(int8_t i=0; i<amount;i++) {
00112$:
	ld	c, #0x00
00106$:
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
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
;src/main.c:202: ++missiles;
	ld	hl, #_missiles
	inc	(hl)
;src/main.c:203: bcd_add(&MISSILES, &INCREMENT);
	push	bc
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_add
	add	sp, #4
	pop	bc
;src/main.c:201: for(int8_t i=0; i<amount;i++) {
	inc	c
	jr	00106$
00104$:
;src/main.c:208: len = bcd2text(&MISSILES, 0x01, buf);
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
;src/main.c:209: set_win_tiles(18, 0, 2, 1, buf+6);
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x12
	push	hl
	call	_set_win_tiles
;src/main.c:211: }
	add	sp, #16
	ret
;src/main.c:213: void incrementScore() {
;	---------------------------------
; Function incrementScore
; ---------------------------------
_incrementScore::
;src/main.c:214: score += 1;
	ld	hl, #_score
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:215: bcd_add(&SCORE, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_SCORE
	push	de
	call	_bcd_add
	add	sp, #4
;src/main.c:216: }
	ret
;src/main.c:218: void updateDirection() {
;	---------------------------------
; Function updateDirection
; ---------------------------------
_updateDirection::
	add	sp, #-4
;src/main.c:222: if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:223: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:224: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00102$:
;src/main.c:226: if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:227: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:228: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00106$:
;src/main.c:230: if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:231: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:232: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00110$:
;src/main.c:234: if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:235: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:236: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00114$:
;src/main.c:240: if ((joydata & J_UP) && (joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;src/main.c:241: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:242: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00118$:
;src/main.c:244: if ((joydata & J_UP) && (joydata & J_LEFT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
	ld	a, d
	or	a, e
	jr	Z, 00121$
;src/main.c:245: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:246: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00121$:
;src/main.c:248: if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00124$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;src/main.c:249: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:250: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00124$:
;src/main.c:252: if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
	ld	a, b
	or	a, c
	jr	Z, 00127$
	ld	a, d
	or	a, e
	jr	Z, 00127$
;src/main.c:253: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:254: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00127$:
;src/main.c:259: if (xDir == 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00130$
	ld	a, (#_yDir)
	or	a, a
;src/main.c:260: return;
	jp	Z,00195$
00130$:
;src/main.c:292: if (xDir == 0 && yDir > 0) {
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
;src/main.c:296: set_sprite_prop(1, S_FLIPY); 
	jp	00195$
00160$:
;src/main.c:298: else if (xDir == 0 && yDir < 0) {
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
;src/main.c:302: set_sprite_prop(1, 0); 
	jp	00195$
00156$:
;src/main.c:304: else if (xDir > 0 && yDir == 0) {
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
;src/main.c:308: set_sprite_prop(1, 0); 
	jp	00195$
00152$:
;src/main.c:310: else if (xDir < 0 && yDir == 0) {
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
;src/main.c:314: set_sprite_prop(1, S_FLIPX); 
	jp	00195$
00148$:
;src/main.c:316: else if (xDir > 0 && yDir < 0) {
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
;src/main.c:320: set_sprite_prop(1, 0); 
	jr	00195$
00144$:
;src/main.c:322: else if (xDir > 0 && yDir > 0) {
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
;src/main.c:326: set_sprite_prop(1, S_FLIPY); 
	jr	00195$
00140$:
;src/main.c:328: else if (xDir < 0 && yDir > 0) {
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
;src/main.c:332: set_sprite_prop(1, S_FLIPY | S_FLIPX); 
	jr	00195$
00136$:
;src/main.c:334: else if (xDir < 0 && yDir < 0) {
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
;src/main.c:338: set_sprite_prop(1, S_FLIPX); 
00195$:
;src/main.c:340: }
	add	sp, #4
	ret
;src/main.c:374: void playSound(uint8_t type) {
;	---------------------------------
; Function playSound
; ---------------------------------
_playSound::
;src/main.c:375: if (type == 20) { //singlegun
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00102$
;src/main.c:376: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:377: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:378: NR12_REG = 0x43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;src/main.c:379: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/main.c:380: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/main.c:381: return;
	ret
00102$:
;src/main.c:383: if (type == 23) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x17
	jr	NZ, 00104$
;src/main.c:384: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:385: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:386: NR12_REG = 0x53;
	ld	a, #0x53
	ldh	(_NR12_REG + 0), a
;src/main.c:387: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/main.c:388: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00104$:
;src/main.c:390: if (type == 26) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x1a
	jr	NZ, 00106$
;src/main.c:391: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:392: NR11_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR11_REG + 0), a
;src/main.c:393: NR12_REG = 0x55;
	ld	a, #0x55
	ldh	(_NR12_REG + 0), a
;src/main.c:394: NR13_REG = 0x70;//0Xbe;//0x6D;
	ld	a, #0x70
	ldh	(_NR13_REG + 0), a
;src/main.c:395: NR14_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR14_REG + 0), a
00106$:
;src/main.c:397: if (type == 0) {  // explosion
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/main.c:398: NR41_REG = 0x20;  
	ld	a, #0x20
	ldh	(_NR41_REG + 0), a
;src/main.c:399: NR42_REG = 0xa2;//0xa3;  
	ld	a, #0xa2
	ldh	(_NR42_REG + 0), a
;src/main.c:400: NR43_REG = 0x57;  
	ld	a, #0x57
	ldh	(_NR43_REG + 0), a
;src/main.c:401: NR44_REG = 0x80;  
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;src/main.c:407: }
	ret
;src/main.c:409: void initEnemies(uint8_t loadSprites) {
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	add	sp, #-7
;src/main.c:411: if (loadSprites) {
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/main.c:413: set_sprite_data(0x40, 5, enemy1);
	ld	de, #_enemy1
	push	de
	ld	hl, #0x540
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:414: set_sprite_data(0x50, 8, largeenemies);
	ld	de, #_largeenemies
	push	de
	ld	hl, #0x850
	push	hl
	call	_set_sprite_data
	add	sp, #4
00102$:
;src/main.c:417: struct Enemy *eptr = enemies;
	ld	bc, #_enemies+0
;src/main.c:419: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00116$:
	ld	hl, #_ENEMYCOUNT
	ld	e, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, e
	jp	NC, 00118$
;src/main.c:420: if (eptr->alive == 0) {
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;src/main.c:422: uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) enemyOptionCount;
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	hl, #_enemyOptionCount
	ld	d, (hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	__moduchar
	pop	hl
	ld	a, e
	pop	bc
;src/main.c:424: (*eptr) = enemyOptions[enemyInd];
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_enemyOptions
	add	hl, de
	ld	e, c
	ld	d, b
	push	bc
	ld	bc, #0x12
	push	bc
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x07
	ldhl	sp,	#5
	ld	(hl), a
;src/main.c:427: eptr->x = xSpawnPositions[posIndex];
	ld	de, #_xSpawnPositions
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	l, c
	ld	h, b
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/main.c:428: eptr->y = ySpawnPositions[posIndex];
	ld	hl, #0x0002
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	de, #_ySpawnPositions
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
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
;src/main.c:430: if (eptr->spriteCount == 1) {
	ld	hl, #0x0008
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
;src/main.c:431: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (de)
	ld	e, a
	ld	a, l
	add	a, a
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl+)
	add	a, #0x0a
;src/main.c:430: if (eptr->spriteCount == 1) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	dec	a
	jr	NZ, 00104$
;src/main.c:431: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,	#3
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/main.c:432: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (bc)
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
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#5
	ld	a, (hl-)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:432: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	jr	00107$
00104$:
;src/main.c:435: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,	#3
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/main.c:436: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	a, (bc)
	ld	(hl-), a
	dec	hl
	ld	e, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:438: set_sprite_tile(10+ (i<<1) +1, eptr->sprite1);
	ld	hl, #0x0007
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x0b
	ldhl	sp,	#5
	ld	(hl), a
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/main.c:439: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (bc)
	ld	(hl+), a
	inc	hl
	ld	e, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:439: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
00107$:
;src/main.c:444: eptr++;
	ld	hl, #0x0012
	add	hl, bc
	ld	c, l
	ld	b, h
;src/main.c:419: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#6
	inc	(hl)
	jp	00116$
00118$:
;src/main.c:447: }
	add	sp, #7
	ret
;src/main.c:449: void initEnemy(uint8_t i) {
;	---------------------------------
; Function initEnemy
; ---------------------------------
_initEnemy::
	add	sp, #-6
;src/main.c:450: struct Enemy *eptr = enemies + i;
	ldhl	sp,	#8
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
	ld	c, l
	ld	b, h
;src/main.c:452: if (eptr->alive == 0) {
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	NZ, 00112$
;src/main.c:454: uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) enemyOptionCount;
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	hl, #_enemyOptionCount
	ld	d, (hl)
	push	bc
	push	de
	inc	sp
	push	af
	inc	sp
	call	__moduchar
	pop	hl
	pop	bc
	ldhl	sp,	#5
	ld	(hl), e
;src/main.c:456: (*eptr) = enemyOptions[enemyInd];
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_enemyOptions
	add	hl, de
	ld	e, c
	ld	d, b
	push	bc
	ld	bc, #0x12
	push	bc
	push	hl
	push	de
	call	___memcpy
	add	sp, #6
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x07
	ldhl	sp,	#5
	ld	(hl), a
;src/main.c:459: eptr->x = xSpawnPositions[posIndex];
	ld	de, #_xSpawnPositions+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	l, c
	ld	h, b
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/main.c:460: eptr->y = ySpawnPositions[posIndex];
	ld	hl, #0x0002
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	de, #_ySpawnPositions+0
	ldhl	sp,	#5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
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
;src/main.c:462: if (eptr->spriteCount == 1) {
	ld	hl, #0x0008
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
;src/main.c:463: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	ld	a, (de)
	ld	e, a
	pop	af
	add	a, a
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl+)
	add	a, #0x0a
;src/main.c:462: if (eptr->spriteCount == 1) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	dec	a
	jr	NZ, 00102$
;src/main.c:463: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,	#5
	ld	a, e
	ld	(hl-), a
	dec	hl
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
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;src/main.c:464: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	ld	a, (bc)
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
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;src/main.c:464: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	jr	00112$
00102$:
;src/main.c:467: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,	#3
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/main.c:468: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	a, (bc)
	ld	(hl-), a
	dec	hl
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
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:470: set_sprite_tile(10+ (i<<1) +1, eptr->sprite1);
	ld	hl, #0x0007
	add	hl, bc
	ld	e, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x0b
	ldhl	sp,	#5
	ld	(hl), a
	ld	d, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/main.c:471: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	a, (bc)
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
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;src/main.c:471: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
00112$:
;src/main.c:479: }
	add	sp, #6
	ret
;src/main.c:482: void updateEnemyPositions() {
;	---------------------------------
; Function updateEnemyPositions
; ---------------------------------
_updateEnemyPositions::
	add	sp, #-16
;src/main.c:485: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	ld	(hl), #0x00
00195$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jp	NC, 00143$
;src/main.c:486: if (!enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
;src/main.c:494: if (enemies[i].x < playerDrawX) {
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
;src/main.c:486: if (!enemies[i].alive) {
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00142$
;src/main.c:489: enemies[i].x -= xOverflow;
	pop	de
	push	de
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
	pop	de
	push	de
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:490: enemies[i].y -= yOverflow;
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
;src/main.c:493: if (abs(enemies[i].x - playerDrawX) > 8) {
	ldhl	sp,	#13
	ld	a, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:364: if (value >= 0) return value;
	bit	7, c
	jr	NZ, 00168$
	ld	b, c
	jr	00170$
00168$:
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, c
	ld	b, a
;src/main.c:493: if (abs(enemies[i].x - playerDrawX) > 8) {
00170$:
;src/main.c:508: enemies[i].ySpeed += enemies[i].accel;
	pop	de
	push	de
	ld	hl, #0x000d
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;src/main.c:495: enemies[i].xSpeed += enemies[i].accel;
	pop	de
	push	de
	ld	hl, #0x000e
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;src/main.c:502: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/main.c:493: if (abs(enemies[i].x - playerDrawX) > 8) {
	ld	e, b
	ld	a,#0x08
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00392$
	bit	7, d
	jr	NZ, 00393$
	cp	a, a
	jr	00393$
00392$:
	bit	7, d
	jr	Z, 00393$
	scf
00393$:
	jr	NC, 00111$
;src/main.c:494: if (enemies[i].x < playerDrawX) {
	pop	de
	push	de
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
;src/main.c:495: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;src/main.c:494: if (enemies[i].x < playerDrawX) {
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
	jr	Z, 00394$
	bit	7, d
	jr	NZ, 00395$
	cp	a, a
	jr	00395$
00394$:
	bit	7, d
	jr	Z, 00395$
	scf
00395$:
	jr	NC, 00104$
;src/main.c:495: enemies[i].xSpeed += enemies[i].accel;
	ld	a, c
	add	a, b
	ld	c, a
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00112$
00104$:
;src/main.c:498: enemies[i].xSpeed -= enemies[i].accel;
	ld	a, c
	sub	a, b
	ld	c, a
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00112$
00111$:
;src/main.c:502: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00396$
	bit	7, d
	jr	NZ, 00397$
	cp	a, a
	jr	00397$
00396$:
	bit	7, d
	jr	Z, 00397$
	scf
00397$:
	jr	NC, 00107$
	dec	c
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00107$:
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/main.c:503: if (enemies[i].xSpeed < 0) enemies[i].xSpeed++;
	bit	7, c
	jr	Z, 00112$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00112$:
;src/main.c:506: if (abs(enemies[i].y - playerDrawY) > 8) {
	ldhl	sp,#2
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
;src/main.c:364: if (value >= 0) return value;
	bit	7, l
	jr	NZ, 00172$
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	jr	00174$
00172$:
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, l
	ld	e, a
	ldhl	sp,	#14
	ld	(hl), e
;src/main.c:506: if (abs(enemies[i].y - playerDrawY) > 8) {
00174$:
;src/main.c:508: enemies[i].ySpeed += enemies[i].accel;
	pop	de
	push	de
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
;src/main.c:515: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/main.c:506: if (abs(enemies[i].y - playerDrawY) > 8) {
	ldhl	sp,	#14
	ld	e, (hl)
	ld	a,#0x08
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00398$
	bit	7, d
	jr	NZ, 00399$
	cp	a, a
	jr	00399$
00398$:
	bit	7, d
	jr	Z, 00399$
	scf
00399$:
	jr	NC, 00121$
;src/main.c:507: if (enemies[i].y < playerDrawY) {
	ld	a, (#_playerDrawY)
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:495: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
;src/main.c:507: if (enemies[i].y < playerDrawY) {
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
	jr	Z, 00400$
	bit	7, d
	jr	NZ, 00401$
	cp	a, a
	jr	00401$
00400$:
	bit	7, d
	jr	Z, 00401$
	scf
00401$:
	jr	NC, 00114$
;src/main.c:508: enemies[i].ySpeed += enemies[i].accel;
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
;src/main.c:511: enemies[i].ySpeed -= enemies[i].accel;
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
;src/main.c:515: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
	ldhl	sp,	#11
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00402$
	bit	7, d
	jr	NZ, 00403$
	cp	a, a
	jr	00403$
00402$:
	bit	7, d
	jr	Z, 00403$
	scf
00403$:
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
;src/main.c:516: if (enemies[i].ySpeed < 0) enemies[i].ySpeed++;
	bit	7, c
	jr	Z, 00122$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00122$:
;src/main.c:520: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	pop	de
	push	de
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
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
;src/main.c:345: return (value < min) ? min : (value > max) ? max : value;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00404$
	bit	7, d
	jr	NZ, 00405$
	cp	a, a
	jr	00405$
00404$:
	bit	7, d
	jr	Z, 00405$
	scf
00405$:
	jr	NC, 00198$
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	(hl), a
	jr	00199$
00198$:
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	bit	7, e
	jr	Z, 00406$
	bit	7, d
	jr	NZ, 00407$
	cp	a, a
	jr	00407$
00406$:
	bit	7, d
	jr	Z, 00407$
	scf
00407$:
	jr	NC, 00200$
	ldhl	sp,	#12
	ld	e, (hl)
	jr	00201$
00200$:
	ldhl	sp,	#14
	ld	e, (hl)
00201$:
	ldhl	sp,	#14
	ld	(hl), e
00199$:
	ldhl	sp,	#14
	ld	c, (hl)
;src/main.c:520: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:521: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
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
;src/main.c:345: return (value < min) ? min : (value > max) ? max : value;
	ld	e, b
	ld	a,l
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
	jr	NC, 00202$
	ld	c, b
	jr	00203$
00202$:
	ld	e, l
	ld	a,c
	ld	d,a
	sub	a, l
	bit	7, e
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
	jr	C, 00205$
	ld	c, l
00205$:
00203$:
;src/main.c:521: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:524: enemies[i].xReserve += enemies[i].xSpeed;
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
	ld	b, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, b
	ld	b, a
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;src/main.c:525: enemies[i].yReserve += enemies[i].ySpeed;
	pop	de
	push	de
	ld	hl, #0x0005
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
	add	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;src/main.c:529: if (enemies[i].xReserve >> 3 > 0) {
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
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
	jr	NC, 00126$
;src/main.c:530: int8_t xMovement = enemies[i].xReserve >> 3;
	ldhl	sp,	#14
	ld	a, (hl)
	sra	a
	sra	a
	sra	a
	ld	(hl), a
;src/main.c:531: enemies[i].x += xMovement;
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
;src/main.c:532: enemies[i].xReserve -=  xMovement << 3;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	push	af
	ld	a, (hl-)
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
	jr	00127$
00126$:
;src/main.c:535: else if ((-enemies[i].xReserve) >> 3 > 0){
	ldhl	sp,	#14
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
	jr	NC, 00127$
;src/main.c:536: int8_t xMovement = -((-enemies[i].xReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#14
	ld	(hl), c
;src/main.c:537: enemies[i].x += xMovement;
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
;src/main.c:538: enemies[i].xReserve +=  (-xMovement) << 3;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	xor	a, a
	sub	a, (hl)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00127$:
;src/main.c:525: enemies[i].yReserve += enemies[i].ySpeed;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
;src/main.c:541: if (enemies[i].yReserve >> 3 > 0) {
	ld	a, (hl+)
	sra	a
	sra	a
	sra	a
	ld	(hl), a
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
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
	jr	NC, 00131$
;src/main.c:542: int8_t yMovement = enemies[i].yReserve >> 3;
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;src/main.c:543: enemies[i].y += yMovement;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
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
;src/main.c:544: enemies[i].yReserve -=  yMovement << 3;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	push	af
	ld	a, (hl-)
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
	jp	00132$
00131$:
;src/main.c:546: else if ((-enemies[i].yReserve) >> 3 > 0){
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#10
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
	ldhl	sp,	#14
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
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
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
	jr	NC, 00132$
;src/main.c:547: int8_t yMovement = -((-enemies[i].yReserve) >> 3);
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	c, a
	xor	a, a
	sub	a, c
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;src/main.c:548: enemies[i].y += yMovement;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
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
;src/main.c:549: enemies[i].yReserve +=  (-yMovement) << 3;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	xor	a, a
	sub	a, (hl)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00132$:
;src/main.c:555: if (enemies[i].spriteCount == 1) {
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
;src/main.c:556: move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
	ldhl	sp,	#15
	ld	a, (hl-)
	add	a, a
	ld	c, a
	add	a, #0x0a
	ld	(hl), a
;src/main.c:555: if (enemies[i].spriteCount == 1) {
	dec	b
	jr	NZ, 00140$
;src/main.c:556: move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x0c
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x04
	ld	e, a
	ldhl	sp,	#14
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
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
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;src/main.c:557: if (enemies[i].xSpeed >= 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	bit	7,a
	jr	NZ, 00134$
;src/main.c:558: set_sprite_prop(10+(i<<1), 0);
	ldhl	sp,	#14
	ld	c, (hl)
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
;src/main.c:558: set_sprite_prop(10+(i<<1), 0);
	jp	00142$
00134$:
;src/main.c:561: set_sprite_prop(10+(i<<1), S_FLIPX);
	ldhl	sp,	#14
	ld	c, (hl)
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
	ld	(hl), #0x20
;src/main.c:561: set_sprite_prop(10+(i<<1), S_FLIPX);
	jp	00142$
00140$:
;src/main.c:566: if (enemies[i].xSpeed >= 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	bit	7,a
	jr	NZ, 00137$
;src/main.c:567: set_sprite_prop(10+(i<<1), 0);
	ldhl	sp,	#14
	ld	b, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
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
	inc	hl
	ld	(hl), #0x00
;src/main.c:568: set_sprite_prop(10+(i<<1)+1, 0);
	ld	a, c
	add	a, #0x0b
	ld	c, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, c
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
;src/main.c:569: move_sprite(10+ (i<<1), enemies[i].x , enemies[i].y + 8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#12
	ld	(hl+), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl+), a
	ld	b, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:570: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#14
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	e, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_shadow_OAM)
	ld	c, a
	ld	a, h
	adc	a, #>(_shadow_OAM)
	ld	b, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, e
	ld	(bc), a
;src/main.c:570: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
	jr	00142$
00137$:
;src/main.c:573: set_sprite_prop(10+(i<<1), S_FLIPX);
	ldhl	sp,	#14
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
	ld	(hl), #0x20
;src/main.c:574: set_sprite_prop(10+(i<<1)+1, S_FLIPX);
	ld	a, c
	add	a, #0x0b
	ldhl	sp,	#13
	ld	(hl), a
	ld	c, (hl)
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
	ld	(hl), #0x20
;src/main.c:575: move_sprite(10+ (i<<1), enemies[i].x +8, enemies[i].y + 8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ldhl	sp,	#14
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
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
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;src/main.c:576: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#14
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
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(bc), a
;src/main.c:576: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
00142$:
;src/main.c:485: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	inc	(hl)
	jp	00195$
00143$:
;src/main.c:584: uint8_t i = enemyCollisionCount;
	ld	a, (#_enemyCollisionCount)
	ldhl	sp,	#1
	ld	(hl), a
;src/main.c:586: if (enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
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
	ldhl	sp,	#15
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00196$
;src/main.c:587: if (enemies[i].visible == 1) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#6
	ld	(hl), a
;src/main.c:588: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
;src/main.c:590: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#1
	ld	e, (hl)
;src/main.c:588: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#12
;src/main.c:590: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl+), a
	ld	a, e
	add	a, a
;src/main.c:588: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	rlca
	and	a,#0x01
;src/main.c:590: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	add	a, #0x0a
	ld	(hl), a
;src/main.c:587: if (enemies[i].visible == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	NZ, 00163$
;src/main.c:588: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	NZ, 00144$
	ldhl	sp,	#11
	ld	a, #0xac
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
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
	jr	C, 00144$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	NZ, 00144$
	ld	e, h
	ld	d, #0x00
	ld	a, #0x98
	cp	a, l
	ld	a, #0x00
	sbc	a, h
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
	jp	NC, 00196$
00144$:
;src/main.c:589: enemies[i].visible = 0;
	xor	a, a
	ld	(bc), a
;src/main.c:590: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#15
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
	ld	(hl), #0x7f
;src/main.c:591: set_sprite_tile(10+(i<<1)+1, 0x7f);
	ldhl	sp,	#13
	ld	a, (hl)
	add	a, #0x0b
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
	ld	(hl), #0x7f
;src/main.c:591: set_sprite_tile(10+(i<<1)+1, 0x7f);
	jp	00196$
00163$:
;src/main.c:595: if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
	ldhl	sp,	#14
	bit	0, (hl)
	jp	NZ, 00157$
	ldhl	sp,	#11
	ld	a, (hl+)
	sub	a, #0xac
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
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
	jp	NC, 00157$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, h
	xor	a, a
	ld	d, a
	cp	a, l
	sbc	a, h
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
	jp	NC, 00157$
	ld	a, l
	sub	a, #0x98
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00157$
;src/main.c:596: enemies[i].visible = 1;
	ld	a, #0x01
	ld	(bc), a
;src/main.c:597: set_sprite_tile(10+(i<<1), enemies[i].sprite0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#14
	ld	(hl+), a
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#11
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00432$:
	ldhl	sp,	#11
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00432$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	ld	hl, #0x0002
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
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;src/main.c:598: if (enemies[i].spriteCount == 2) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x02
	jp	NZ,00196$
;src/main.c:599: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#15
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	add	a, #0x0b
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00435$:
	ldhl	sp,	#13
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00435$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	ld	hl, #0x0002
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;src/main.c:599: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
	jp	00196$
00157$:
;src/main.c:602: else if (enemies[i].x < -100 || enemies[i].x > 272 || enemies[i].y < -100 || enemies[i].y > 252) {
	ldhl	sp,	#7
	ld	a, (hl+)
	sub	a, #0x9c
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00436$
	bit	7, d
	jr	NZ, 00437$
	cp	a, a
	jr	00437$
00436$:
	bit	7, d
	jr	Z, 00437$
	scf
00437$:
	jr	C, 00151$
	ldhl	sp,	#11
	ld	a, #0x10
	sub	a, (hl)
	inc	hl
	ld	a, #0x01
	sbc	a, (hl)
	ld	a, #0x01
	ld	d, a
	bit	7, (hl)
	jr	Z, 00438$
	bit	7, d
	jr	NZ, 00439$
	cp	a, a
	jr	00439$
00438$:
	bit	7, d
	jr	Z, 00439$
	scf
00439$:
	jr	C, 00151$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, #0x9c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00151$
	ld	e, b
	ld	d, #0x00
	ld	a, #0xfc
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00440$
	bit	7, d
	jr	NZ, 00441$
	cp	a, a
	jr	00441$
00440$:
	bit	7, d
	jr	Z, 00441$
	scf
00441$:
	jp	NC, 00196$
00151$:
;src/main.c:603: enemies[i].alive = 0;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:604: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#15
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00442$:
	ldhl	sp,	#14
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00442$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x7f
;src/main.c:605: set_sprite_tile(10+(i<<1)+1, 0x7f);
	ldhl	sp,	#13
	ld	a, (hl+)
	inc	hl
	add	a, #0x0b
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00443$:
	ldhl	sp,	#14
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00443$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x7f
;src/main.c:606: initEnemy(i);
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00196$:
;src/main.c:612: }
	add	sp, #16
	ret
;src/main.c:617: void move() {
;	---------------------------------
; Function move
; ---------------------------------
_move::
	add	sp, #-8
;src/main.c:620: if (joydata & J_A) {
	ld	a, (#_joydata)
	bit	4, a
	jr	Z, 00102$
;src/main.c:621: xSpeed += xDir + xDir + xDir;
	ld	hl, #_xDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_xSpeed
	add	a, (hl)
	ld	(hl), a
;src/main.c:622: ySpeed += yDir + yDir + yDir;
	ld	hl, #_yDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_ySpeed
	add	a, (hl)
	ld	(hl), a
00102$:
;src/main.c:626: xSpeed = clamp(xSpeed, -100, 100);
	ld	hl, #_xSpeed
	ld	c, (hl)
;src/main.c:345: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:627: ySpeed = clamp(ySpeed, -100, 100);
	ld	hl, #_ySpeed
	ld	c, (hl)
;src/main.c:345: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:629: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:630: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:635: uint8_t xCollisionPoint = playerDrawX; 
	ld	hl, #_playerDrawX
	ld	c, (hl)
;src/main.c:638: xCollisionPoint = playerDrawX +8; //right edge
	ld	b, (hl)
;src/main.c:637: if (xSpeed > 0) {
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
;src/main.c:638: xCollisionPoint = playerDrawX +8; //right edge
	ld	a, b
	add	a, #0x08
	ld	c, a
00104$:
;src/main.c:640: if (xSpeed < 0) {
	ld	a, (#_xSpeed)
	bit	7, a
	jr	Z, 00106$
;src/main.c:641: xCollisionPoint = playerDrawX -8; //left edge
	ld	a, b
	add	a, #0xf8
	ld	c, a
00106$:
;src/main.c:645: int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;
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
;src/main.c:649: uint8_t bgindY = ((playerDrawY + bgY) >> 3)%32; 
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
;src/main.c:652: uint16_t ind = 32*bgindY + bgindX;
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
;src/main.c:653: uint8_t result = 1; // 0 incase of clear path, 1 for blocked
	ld	c, #0x01
;src/main.c:654: for (uint8_t i=0; i<BLANKSIZE; i++) {
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
;src/main.c:655: if (background1[ind] == BLANK[i] ) {
	ld	hl, #_BLANK
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
	ld	a, b
;src/main.c:656: result = 0;
	sub	a,d
	jr	NZ, 00159$
	ld	c,a
;src/main.c:657: break;
	jr	00109$
00159$:
;src/main.c:654: for (uint8_t i=0; i<BLANKSIZE; i++) {
	inc	e
	jr	00158$
00109$:
;src/main.c:661: if (result == 0) {
	ld	a, c
	or	a, a
	jp	NZ, 00114$
;src/main.c:662: playerX+=xSpeed;
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
;src/main.c:664: uint16_t limitedPlayerX = u16Clamp(playerX, 68<<5, 92<<5);//0->160, with 8 px margin for left edge & 50px for the edges
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
;src/main.c:666: xOverflow = (playerX - limitedPlayerX);
	ld	a, (#_playerX)
	sub	a, e
	ld	(#_xOverflow),a
	ld	a, (#_playerX + 1)
	sbc	a, d
	ld	hl, #_xOverflow + 1
;src/main.c:667: if (xOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_xOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00111$
;src/main.c:668: xOverflow = xOverflow >> 5;
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
;src/main.c:671: xOverflow = -((-xOverflow) >> 5);
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
;src/main.c:673: bgX += xOverflow;
	ld	a, (#_bgX)
	ld	hl, #_xOverflow
	add	a, (hl)
	ld	hl, #_bgX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_xOverflow + 1
	adc	a, (hl)
	ld	(#_bgX + 1),a
;src/main.c:674: playerX = limitedPlayerX;
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;src/main.c:675: playerDrawX=playerX >> 5;
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
;src/main.c:683: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
00115$:
;src/main.c:691: uint8_t yCollisionPoint = playerDrawY; 
	ld	a, (#_playerDrawY)
	ldhl	sp,	#7
	ld	(hl), a
;src/main.c:694: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	hl, #_playerDrawY
	ld	c, (hl)
;src/main.c:693: if (ySpeed > 0) {
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
;src/main.c:694: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#7
	ld	(hl), a
00117$:
;src/main.c:696: if (ySpeed < 0) {
	ld	a, (#_ySpeed)
	bit	7, a
	jr	Z, 00119$
;src/main.c:697: yCollisionPoint = playerDrawY -8; //top edge, 
	ld	a, c
	add	a, #0xf8
	ldhl	sp,	#7
	ld	(hl), a
00119$:
;src/main.c:701: bgindX = ((playerDrawX + bgX) >> 3)%32;
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
;src/main.c:704: bgindY = ((yCollisionPoint + bgY) >> 3)%32; 
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
;src/main.c:707: ind = 32*bgindY + bgindX;
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
;src/main.c:708: result = 1;
	ldhl	sp,	#3
	ld	(hl), #0x01
;src/main.c:709: for (uint8_t j=0; j<BLANKSIZE; j++) {
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
;src/main.c:710: if (background1[ind] == BLANK[j] ) {
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
;src/main.c:711: result = 0;
	ldhl	sp,	#3
	ld	(hl), #0x00
;src/main.c:712: break;
	jr	00122$
00162$:
;src/main.c:709: for (uint8_t j=0; j<BLANKSIZE; j++) {
	ldhl	sp,	#7
	inc	(hl)
	jr	00161$
00122$:
;src/main.c:716: if (result == 0) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jp	NZ, 00127$
;src/main.c:717: playerY += ySpeed;
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
;src/main.c:719: uint16_t limitedPlayerY = u16Clamp(playerY, 48<<5, 78<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
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
;src/main.c:721: yOverflow = (playerY - limitedPlayerY);
	ld	a, (#_playerY)
	sub	a, e
	ld	(#_yOverflow),a
	ld	a, (#_playerY + 1)
	sbc	a, d
	ld	hl, #_yOverflow + 1
;src/main.c:722: if (yOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_yOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00124$
;src/main.c:723: yOverflow = yOverflow >> 5;
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
;src/main.c:726: yOverflow = -((-yOverflow) >> 5);
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
;src/main.c:728: bgY += yOverflow;
	ld	a, (#_bgY)
	ld	hl, #_yOverflow
	add	a, (hl)
	ld	hl, #_bgY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_yOverflow + 1
	adc	a, (hl)
	ld	(#_bgY + 1),a
;src/main.c:729: playerY = limitedPlayerY;
	ld	hl, #_playerY
	ld	a, c
	ld	(hl+), a
;src/main.c:730: playerDrawY=playerY >> 5;
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
;src/main.c:735: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
00128$:
;src/main.c:635: uint8_t xCollisionPoint = playerDrawX; 
	ld	a, (#_playerDrawX)
	ldhl	sp,	#7
	ld	(hl), a
;src/main.c:694: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, (#_playerDrawY)
	add	a, #0x08
	ldhl	sp,	#6
	ld	(hl), a
;src/main.c:738: if (xDir >= 0) {
	ld	a, (#_xDir)
	bit	7, a
	jr	NZ, 00130$
;src/main.c:739: move_sprite(0, playerDrawX , playerDrawY + 8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	de, #_shadow_OAM
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 1)
	ld	a, (hl)
	ld	(de), a
;src/main.c:741: move_sprite(1, playerDrawX +8, playerDrawY +8);
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
;src/main.c:741: move_sprite(1, playerDrawX +8, playerDrawY +8);
	jr	00131$
00130$:
;src/main.c:744: move_sprite(1, playerDrawX , playerDrawY +8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 4)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/main.c:746: move_sprite(0, playerDrawX +8, playerDrawY +8);
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
;src/main.c:746: move_sprite(0, playerDrawX +8, playerDrawY +8);
00131$:
;src/main.c:751: if (bgX >= 256) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00133$
;src/main.c:752: bgX = bgX % 256;
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
;src/main.c:754: if (bgX < 0) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00135$
;src/main.c:755: bgX = 255 - (bgX % 256);
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
;src/main.c:757: if (bgY >= 256) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00137$
;src/main.c:758: bgY = bgY % 256;
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
;src/main.c:760: if (bgY < 0) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00139$
;src/main.c:761: bgY = 255 - (bgY % 256);
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
;src/main.c:764: move_bkg(bgX, bgY);
	ld	hl, #_bgY
	ld	c, (hl)
	ld	a, (#_bgX)
	ldh	(_SCX_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/main.c:767: if (ySpeed > 0) ySpeed--;
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
;src/main.c:768: if (ySpeed < 0) ySpeed++;
	ld	hl, #_ySpeed
	bit	7, (hl)
	jr	Z, 00143$
	inc	(hl)
00143$:
;src/main.c:769: if (xSpeed > 0) xSpeed--;
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
;src/main.c:770: if (xSpeed < 0) xSpeed++;
	ld	hl, #_xSpeed
	bit	7, (hl)
	jr	Z, 00163$
	inc	(hl)
00163$:
;src/main.c:774: }
	add	sp, #8
	ret
;src/main.c:776: void takeDamage(int16_t amount) {
;	---------------------------------
; Function takeDamage
; ---------------------------------
_takeDamage::
	dec	sp
;src/main.c:777: if (amount > shield) {
	ld	a, (#_shield)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
;src/main.c:779: hull -= (amount - shield);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/main.c:777: if (amount > shield) {
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
;src/main.c:778: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;src/main.c:779: hull -= (amount - shield);
	ld	a, (#_hull)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_hull),a
	jr	00104$
00102$:
;src/main.c:782: shield -= amount;
	ld	a, (#_shield)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_shield),a
00104$:
;src/main.c:784: }
	inc	sp
	ret
;src/main.c:786: void spawnPickup(int16_t x, int16_t y) {
;	---------------------------------
; Function spawnPickup
; ---------------------------------
_spawnPickup::
;src/main.c:787: uint8_t spawn = ((uint8_t)rand()) % (uint8_t) 16;
	call	_rand
	ld	a, e
	and	a, #0x0f
	ret	NZ
;src/main.c:788: if (spawn == 0) {
;src/main.c:789: uint8_t type = ((uint8_t)rand()) % (uint8_t) 4;
	call	_rand
	ld	a, e
	and	a, #0x03
;src/main.c:790: if (type == 0) {
	ld	e,a
	or	a, a
	jr	NZ, 00106$
;src/main.c:791: pickup = health;
	ld	de, #0x0009
	push	de
	ld	de, #_health
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
	jr	00107$
00106$:
;src/main.c:793: else if (type == 1 && gunLevel < MAXGUNLEVEL) {
	dec	e
	jr	NZ, 00102$
	ld	hl, #_MAXGUNLEVEL
	ld	c, (hl)
	ld	a, (#_gunLevel)
	sub	a, c
	jr	NC, 00102$
;src/main.c:794: pickup = upgrade;
	ld	de, #0x0009
	push	de
	ld	de, #_upgrade
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
	jr	00107$
00102$:
;src/main.c:797: pickup = ammo;
	ld	bc, #_ammo
	ld	de, #_pickup
	ld	hl, #0x0009
	push	hl
	push	bc
	push	de
	call	___memcpy
	add	sp, #6
00107$:
;src/main.c:799: pickup.active = 1;
	ld	hl, #(_pickup + 5)
	ld	(hl), #0x01
;src/main.c:801: pickup.x = x;
	ld	de, #(_pickup + 1)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/main.c:802: pickup.y = y;
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_pickup + 3)
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:804: set_sprite_tile(3, pickup.tile); //0x7f
	ld	hl, #(_pickup + 8)
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;src/main.c:804: set_sprite_tile(3, pickup.tile); //0x7f
;src/main.c:810: }
	ret
;src/main.c:812: void killEnemy(uint8_t i) {
;	---------------------------------
; Function killEnemy
; ---------------------------------
_killEnemy::
	add	sp, #-4
;src/main.c:813: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#6
	ld	a, (hl)
	add	a, a
	ld	c, a
	add	a, #0x0a
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
	ld	(hl), #0x7f
;src/main.c:814: set_sprite_tile(10+(i<<1)+1, 0x7f);
	ld	a, c
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
;src/main.c:816: spawnPickup(enemies[i].x, enemies[i].y);
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
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
;src/main.c:818: enemies[i].alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:819: enemies[i].visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:820: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:821: incrementScore();
	call	_incrementScore
;src/main.c:822: updateScore();
	call	_updateScore
;src/main.c:824: explosions[oldestEx].visible = 1;
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	ld	(hl), #0x01
;src/main.c:825: explosions[oldestEx].x = enemies[i].x;
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	inc	hl
	ld	c, l
	ld	b, h
	pop	de
	push	de
	ld	a, (de)
	ld	(bc), a
;src/main.c:826: explosions[oldestEx].y = enemies[i].y;
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(bc), a
;src/main.c:829: uint8_t tileNum = ((uint8_t)rand()) % exTileCount;
	call	_rand
	ld	a, e
	ld	hl, #_exTileCount
	ld	b, (hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	__moduchar
	pop	hl
	ldhl	sp,	#3
	ld	(hl), e
;src/main.c:831: explosions[oldestEx].tile = exTiles[tileNum];
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	de, #_exTiles+0
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(bc), a
;src/main.c:832: explosions[oldestEx].frame = 0;
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;src/main.c:833: explosions[oldestEx].frameCounter = 0;
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;src/main.c:835: set_sprite_tile(20 + 2*oldestEx, explosions[oldestEx].tile + (explosions[oldestEx].frame<<1));
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0005
	add	hl, de
	ld	c, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	add	a, a
	add	a, c
	ld	c, a
	ld	a, (#_oldestEx)
	add	a, a
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
;src/main.c:836: set_sprite_tile(21 + 2*oldestEx, explosions[oldestEx].tile+(explosions[oldestEx].frame<<1) +2);
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0005
	add	hl, de
	ld	c, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	add	a, a
	add	a, c
	add	a, #0x02
	ld	c, a
	ld	a, (#_oldestEx)
	add	a, a
	add	a, #0x15
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
;src/main.c:837: move_sprite(20 + 2*oldestEx, explosions[oldestEx].x, explosions[oldestEx].y+8);
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	ld	c, l
	ld	b, h
	inc	hl
	inc	bc
	inc	bc
	ld	a, (bc)
	add	a, #0x08
	ld	b, a
	ld	c, (hl)
	ld	a, (#_oldestEx)
	add	a, a
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
;src/main.c:838: move_sprite(21 + 2*oldestEx, explosions[oldestEx].x+8, explosions[oldestEx].y+8);
	ld	hl, #_oldestEx
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
	ld	c, l
	ld	b, h
	inc	hl
	inc	bc
	inc	bc
	ld	a, (bc)
	add	a, #0x08
	ld	b, a
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	ld	a, (#_oldestEx)
	add	a, a
	add	a, #0x15
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
;src/main.c:840: oldestEx++;
	ld	hl, #_oldestEx
	inc	(hl)
;src/main.c:841: if (oldestEx >= exCount) {
	ld	hl, #_exCount
	ld	c, (hl)
	ld	hl, #_oldestEx
	ld	a, (hl)
	sub	a, c
	jr	C, 00109$
;src/main.c:842: oldestEx = 0;
	ld	(hl), #0x00
00109$:
;src/main.c:846: }
	add	sp, #4
	ret
;src/main.c:848: void checkCollision() {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-23
;src/main.c:855: struct Enemy *eptr = enemies + enemyCollisionCount;
	ld	hl, #_enemyCollisionCount
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
	ld	c, l
	ld	a, h
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/main.c:856: uint8_t i = enemyCollisionCount;
	ld	a, (#_enemyCollisionCount)
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:858: if (eptr->visible && eptr->alive) {
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00139$
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00139$
;src/main.c:860: uint8_t alive = 1;
	ldhl	sp,	#18
	ld	(hl), #0x01
;src/main.c:863: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
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
	jr	Z, 00350$
	xor	a, a
00350$:
	ldhl	sp,	#19
	ld	(hl), a
	ld	a, (#_playerDrawX)
	ldhl	sp,	#20
	ld	(hl), a
;src/main.c:864: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00352$
	xor	a, a
00352$:
	ldhl	sp,	#21
;src/main.c:863: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#22
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
;src/main.c:364: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00147$
;src/main.c:365: else return - value;
	xor	a, a
	ldhl	sp,	#22
	sub	a, (hl)
	ld	c, a
	ld	(hl), c
;src/main.c:863: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
00147$:
	ldhl	sp,	#22
	ld	e, (hl)
	ld	a,#0x08
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00353$
	bit	7, d
	jr	NZ, 00354$
	cp	a, a
	jr	00354$
00353$:
	bit	7, d
	jr	Z, 00354$
	scf
00354$:
	jr	NC, 00106$
00110$:
;src/main.c:864: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	jp	Z, 00107$
	dec	hl
	pop	de
	push	de
	ld	a, (de)
	sub	a, (hl)
	ld	c, a
;src/main.c:364: if (value >= 0) return value;
	bit	7, c
	jr	NZ, 00149$
	ld	b, c
	jr	00151$
00149$:
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, c
	ld	b, a
;src/main.c:864: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
00151$:
	ld	e, b
	ld	a,#0x10
	ld	d,a
	sub	a, b
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
	jp	C, 00107$
00106$:
;src/main.c:865: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a, (#_playerDrawY)
	ldhl	sp,	#22
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	ld	a, (bc)
	ldhl	sp,	#22
	sub	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:364: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00155$
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:865: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
00155$:
	ld	e, l
	ld	a,#0x08
	ld	d,a
	sub	a, l
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
	jr	NC, 00101$
00105$:
;src/main.c:866: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	jp	Z, 00107$
	inc	hl
	ld	a, (bc)
	sub	a, (hl)
	ld	c, a
;src/main.c:364: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00159$
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:866: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
00159$:
	ld	e, c
	ld	a,#0x10
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00359$
	bit	7, d
	jr	NZ, 00360$
	cp	a, a
	jr	00360$
00359$:
	bit	7, d
	jr	Z, 00360$
	scf
00360$:
	jr	C, 00107$
00101$:
;src/main.c:868: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:869: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:870: eptr->alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:871: eptr->visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:872: takeDamage(eptr->damage);
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
;src/main.c:873: initEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
;src/main.c:874: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:876: alive = 0;
	ldhl	sp,	#18
	ld	(hl), #0x00
00107$:
;src/main.c:882: if (alive) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00139$
;src/main.c:883: struct Projectile *pptr = projectiles;
	inc	hl
	ld	a, #<(_projectiles)
	ld	(hl+), a
	ld	(hl), #>(_projectiles)
;src/main.c:885: while (j < PROJECTILECOUNT) {
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
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
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
	ldhl	sp,	#21
	ld	(hl), #0x00
00133$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, c
	jp	NC, 00139$
;src/main.c:886: if (pptr->active) {
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00132$
;src/main.c:888: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	dec	a
	ld	a, #0x01
	jr	Z, 00362$
	xor	a, a
00362$:
	ldhl	sp,	#17
	ld	(hl), a
;src/main.c:889: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00364$
	xor	a, a
00364$:
	ldhl	sp,	#18
;src/main.c:888: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00130$
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,#19
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
;src/main.c:364: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00165$
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:888: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
00165$:
	ld	e, c
	ld	a,#0x08
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00365$
	bit	7, d
	jr	NZ, 00366$
	cp	a, a
	jr	00366$
00365$:
	bit	7, d
	jr	Z, 00366$
	scf
00366$:
	jr	NC, 00126$
00130$:
;src/main.c:889: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00132$
	inc	hl
	pop	de
	push	de
	ld	a, (de)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ld	(hl), a
;src/main.c:364: if (value >= 0) return value;
	bit	7, (hl)
	jr	NZ, 00167$
	ld	c, (hl)
	jr	00169$
00167$:
;src/main.c:365: else return - value;
	xor	a, a
	ldhl	sp,	#22
	sub	a, (hl)
	ld	c, a
;src/main.c:889: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
00169$:
	ld	e, c
	ld	a,#0x10
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00367$
	bit	7, d
	jr	NZ, 00368$
	cp	a, a
	jr	00368$
00367$:
	bit	7, d
	jr	Z, 00368$
	scf
00368$:
	jp	C, 00132$
00126$:
;src/main.c:890: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#17
	ld	a, (hl)
	or	a, a
	jr	Z, 00125$
	ldhl	sp,#9
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
;src/main.c:364: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00173$
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:890: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
00173$:
	ld	e, l
	ld	a,#0x08
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00369$
	bit	7, d
	jr	NZ, 00370$
	cp	a, a
	jr	00370$
00369$:
	bit	7, d
	jr	Z, 00370$
	scf
00370$:
	jr	NC, 00121$
00125$:
;src/main.c:891: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00132$
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
;src/main.c:364: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00177$
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:891: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
00177$:
	ld	e, c
	ld	a,#0x10
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00371$
	bit	7, d
	jr	NZ, 00372$
	cp	a, a
	jr	00372$
00371$:
	bit	7, d
	jr	Z, 00372$
	scf
00372$:
	jp	C, 00132$
00121$:
;src/main.c:893: set_sprite_tile(30+j, 0x7f);
	ldhl	sp,	#21
	ld	a, (hl)
	add	a, #0x1e
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
;src/main.c:894: pptr->active = 0;
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:896: if (pptr->type == 0x2c) { //missile
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
;src/main.c:901: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
	push	de
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
;src/main.c:896: if (pptr->type == 0x2c) { //missile
	ld	a, e
	sub	a, #0x2c
	jp	NZ,00119$
;src/main.c:901: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
	ldhl	sp,	#11
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#22
	ld	(hl), #0x00
00188$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, c
	jp	NC, 00132$
;src/main.c:902: int16_t dmgDropOff = ((i16abs(eptr->x - enemies[k].x) + i16abs(eptr->y - enemies[k].y))<<SPLASHDROPOFF);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#22
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_enemies
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	c, e
	ld	b, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	NZ, 00180$
	ldhl	sp,	#15
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00182$
00180$:
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ldhl	sp,	#15
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00182$:
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00186$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00186$:
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_SPLASHDROPOFF
	ld	e, (hl)
	inc	e
	jr	00376$
00375$:
	sla	c
	rl	b
00376$:
	dec	e
	jr	NZ,00375$
;src/main.c:903: int16_t dmg = pptr->damage - dmgDropOff;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, c
	ld	e, a
	ld	a, h
	sbc	a, b
	ldhl	sp,	#13
	ld	(hl), e
	inc	hl
;src/main.c:904: if (dmg > 0) {
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00377$
	bit	7, d
	jr	NZ, 00378$
	cp	a, a
	jr	00378$
00377$:
	bit	7, d
	jr	Z, 00378$
	scf
00378$:
	jr	NC, 00189$
;src/main.c:905: enemies[k].hp -= dmg;
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#13
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
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:906: if (enemies[k].hp <= 0) {
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00379$
	bit	7, d
	jr	NZ, 00380$
	cp	a, a
	jr	00380$
00379$:
	bit	7, d
	jr	Z, 00380$
	scf
00380$:
	jr	C, 00189$
;src/main.c:907: killEnemy(k);
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	call	_killEnemy
	inc	sp
;src/main.c:908: initEnemy(k);
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00189$:
;src/main.c:901: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
	ldhl	sp,	#22
	inc	(hl)
	jp	00188$
00119$:
;src/main.c:916: eptr->hp -= pptr->damage;
	pop	de
	push	de
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	c, e
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:918: if (eptr->hp <= 0) {
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00381$
	bit	7, d
	jr	NZ, 00382$
	cp	a, a
	jr	00382$
00381$:
	bit	7, d
	jr	Z, 00382$
	scf
00382$:
	jr	C, 00132$
;src/main.c:920: killEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_killEnemy
	inc	sp
;src/main.c:921: initEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00132$:
;src/main.c:933: j++;
	ldhl	sp,	#21
	inc	(hl)
;src/main.c:934: pptr++;
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl), a
	jp	00133$
00139$:
;src/main.c:940: if (enemyCollisionCount == 0) {
	ld	a, (#_enemyCollisionCount)
	or	a, a
	jr	NZ, 00142$
;src/main.c:941: enemyCollisionCount = ENEMYCOUNT - 1;
	ld	a, (#_ENEMYCOUNT)
	dec	a
	ld	(#_enemyCollisionCount),a
	jr	00190$
00142$:
;src/main.c:944: enemyCollisionCount--;
	ld	hl, #_enemyCollisionCount
	dec	(hl)
00190$:
;src/main.c:949: }
	add	sp, #23
	ret
;src/main.c:952: void setGunIcon() {
;	---------------------------------
; Function setGunIcon
; ---------------------------------
_setGunIcon::
;src/main.c:954: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00102$
;src/main.c:955: set_win_tiles(15, 0,1,1,gunMap+gunLevel);
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
;src/main.c:958: set_win_tiles(15, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:960: }
	ret
;src/main.c:970: void fire() {
;	---------------------------------
; Function fire
; ---------------------------------
_fire::
	add	sp, #-5
;src/main.c:972: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	inc	(hl)
	ld	a, (hl)
;src/main.c:973: if (oldestProjectile >= PROJECTILECOUNT) {
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ld	hl, #_oldestProjectile
	ld	a, (hl)
	sub	a, c
	jr	C, 00102$
;src/main.c:974: oldestProjectile = 0;
	ld	(hl), #0x00
00102$:
;src/main.c:979: projectiles[oldestProjectile] = singleGun;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:977: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00113$
;src/main.c:978: if (gunLevel == 0) {
	ld	a, (#_gunLevel)
	or	a, a
	jr	NZ, 00104$
;src/main.c:979: projectiles[oldestProjectile] = singleGun;
	ld	de, #_singleGun+0
	ld	bc, #_projectiles+0
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x000d
	push	hl
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
	jr	00114$
00104$:
;src/main.c:982: projectiles[oldestProjectile] = doubleGun;
	ld	de, #_doubleGun+0
	ld	bc, #_projectiles+0
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x000d
	push	hl
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
	jr	00114$
00113$:
;src/main.c:985: else if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00114$
;src/main.c:986: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00107$
;src/main.c:987: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:988: setGunIcon();
	call	_setGunIcon
;src/main.c:989: return;
	jp	00155$
00107$:
;src/main.c:992: projectiles[oldestProjectile] = missile;
	ld	de, #_missile+0
	ld	bc, #_projectiles+0
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x000d
	push	hl
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
;src/main.c:993: updateMissileCount(-1);
	ld	a, #0xff
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:995: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00114$
;src/main.c:996: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:997: setGunIcon();
	call	_setGunIcon
00114$:
;src/main.c:1000: projectiles[oldestProjectile].x = playerDrawX;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
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
;src/main.c:1001: projectiles[oldestProjectile].y = playerDrawY;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
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
;src/main.c:1002: projectiles[oldestProjectile].xSpeed = xDir * projectiles[oldestProjectile].speed;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
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
;src/main.c:1003: projectiles[oldestProjectile].ySpeed = yDir * projectiles[oldestProjectile].speed;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
;src/main.c:972: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:979: projectiles[oldestProjectile] = singleGun;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
;src/main.c:1008: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl-)
	add	a, #0x1e
	ld	(hl), a
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1007: if (yDir != 0 && xDir == 0) {
	ld	a, (#_yDir)
	or	a, a
	jr	Z, 00141$
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00141$
;src/main.c:1008: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
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
;src/main.c:972: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
;src/main.c:1008: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	add	a, #0x1e
	ld	c, a
;src/main.c:1009: if (yDir == 1) {
	ld	a, (#_yDir)
;src/main.c:1010: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	dec	a
	jr	NZ, 00116$
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
;src/main.c:1011: projectiles[oldestProjectile].offset = 4;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x04
	jp	00142$
00116$:
;src/main.c:1014: set_sprite_prop(30+oldestProjectile, 0); 
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
;src/main.c:1015: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x0c
	jp	00142$
00141$:
;src/main.c:1019: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
;src/main.c:1018: else if (xDir != 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jp	Z, 00137$
	ld	a, (#_yDir)
	or	a, a
	jp	NZ, 00137$
;src/main.c:1019: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
	ldhl	sp,	#4
	inc	(hl)
	inc	(hl)
	dec	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00261$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00261$
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
;src/main.c:972: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1008: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	a, (hl)
	add	a, #0x1e
	ld	(hl), a
;src/main.c:1020: if (xDir == 1) {
	ld	a, (#_xDir)
	dec	a
	jr	NZ, 00119$
;src/main.c:1021: set_sprite_prop(30+oldestProjectile, 0);
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
	ld	(hl), #0x00
;src/main.c:1022: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
	jp	00142$
00119$:
;src/main.c:1025: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
	ldhl	sp,	#4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl-)
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
;src/main.c:1026: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
	jp	00142$
00137$:
;src/main.c:1030: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+4);
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
00266$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00266$
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
;src/main.c:1031: if (xDir == 1 && yDir == -1) {
	ld	a, (#_xDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00268$
	xor	a, a
00268$:
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:972: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
;src/main.c:1031: if (xDir == 1 && yDir == -1) {
	ld	a, (#_yDir)
	inc	a
	ld	a, #0x01
	jr	Z, 00270$
	xor	a, a
00270$:
	ldhl	sp,	#1
;src/main.c:1008: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	(hl+), a
	ld	a, c
	add	a, #0x1e
;src/main.c:1031: if (xDir == 1 && yDir == -1) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00133$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
;src/main.c:1032: set_sprite_prop(30+oldestProjectile, 0); //default is right & up
	inc	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00271$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00271$
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
;src/main.c:1033: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
	jp	00142$
00133$:
;src/main.c:1009: if (yDir == 1) {
	ld	a, (#_yDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00273$
	xor	a, a
00273$:
	ldhl	sp,	#3
;src/main.c:1035: else if (xDir == 1 && yDir == 1) {
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00129$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
;src/main.c:1036: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
	dec	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00274$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00274$
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
;src/main.c:1037: projectiles[oldestProjectile].offset = 4;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
	jp	00142$
00129$:
;src/main.c:1039: else if (xDir == -1 && yDir == 1) {
	ld	a, (#_xDir)
	inc	a
	ld	a, #0x01
	jr	Z, 00276$
	xor	a, a
00276$:
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00125$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00125$
;src/main.c:1040: set_sprite_prop(30+oldestProjectile, S_FLIPY | S_FLIPX);
	dec	hl
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
	ld	(hl), #0x60
;src/main.c:1041: projectiles[oldestProjectile].offset = 4;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
	jr	00142$
00125$:
;src/main.c:1043: else if (xDir == -1 && yDir == -1) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
;src/main.c:1044: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
	inc	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00278$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00278$
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
;src/main.c:1045: projectiles[oldestProjectile].offset = 12;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x0c
00142$:
;src/main.c:1049: fireCooldown = projectiles[oldestProjectile].delay;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
	ld	bc, #0x000b
	add	hl, bc
	ld	a, (hl)
	ld	(#_fireCooldown),a
00155$:
;src/main.c:1055: }
	add	sp, #5
	ret
;src/main.c:1058: void moveProjectiles() {
;	---------------------------------
; Function moveProjectiles
; ---------------------------------
_moveProjectiles::
	add	sp, #-10
;src/main.c:1059: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#9
	ld	(hl), #0x00
00112$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, c
	jp	NC, 00114$
;src/main.c:1060: if (projectiles[i].active) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_projectiles
	add	hl,bc
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
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00113$
;src/main.c:1061: projectiles[i].x -= xOverflow;
	dec	hl
	dec	hl
	dec	hl
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
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:1062: projectiles[i].y -= yOverflow;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
;src/main.c:1064: int16_t newY = projectiles[i].y + projectiles[i].ySpeed;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
;src/main.c:1065: int16_t newX = projectiles[i].x + projectiles[i].xSpeed;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	pop	de
	push	de
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), e
	inc	hl
	ld	(hl), a
;src/main.c:1068: projectiles[i].y = newY;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:1069: projectiles[i].x = newX;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/main.c:1073: move_sprite(30+i, newX +4 , newY + projectiles[i].offset);
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, c
	ld	c, a
	ldhl	sp,	#7
	ld	a, (hl+)
	inc	hl
	add	a, #0x04
	ld	e, a
	ld	a, (hl)
	add	a, #0x1e
	ldhl	sp,	#4
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
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
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;src/main.c:1077: if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	inc	hl
	bit	7, (hl)
	jr	NZ, 00101$
	ldhl	sp,	#5
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, #0xaa
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
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
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	bit	7, (hl)
	jr	NZ, 00101$
	dec	hl
	ld	a, #0x9a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
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
;src/main.c:1078: projectiles[i].active = 0;
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
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
	ld	hl, #_projectiles
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
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:1079: set_sprite_tile(30+i, 0x7f);
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00151$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00151$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
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
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x7f
;src/main.c:1079: set_sprite_tile(30+i, 0x7f);
00113$:
;src/main.c:1059: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#9
	inc	(hl)
	jp	00112$
00114$:
;src/main.c:1084: }
	add	sp, #10
	ret
;src/main.c:1086: void tickPickups() {
;	---------------------------------
; Function tickPickups
; ---------------------------------
_tickPickups::
	dec	sp
	dec	sp
;src/main.c:1088: if (pickup.active) {
	ld	a, (#(_pickup + 5) + 0)
	or	a, a
	jp	Z, 00144$
;src/main.c:1089: pickup.x -= xOverflow;
	ld	hl, #(_pickup + 1)
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
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
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	ld	de, #(_pickup + 1)
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:1090: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 3)
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
	ld	hl, #(_pickup + 3)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:1091: move_sprite(3, pickup.x + 4, pickup.y + 12);
	ld	a, c
	add	a, #0x0c
	ld	b, a
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x04
	ld	c, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/main.c:1092: if (pickup.visible && auxTick == 1) {
	ld	hl, #_pickup
	ld	c, (hl)
;src/main.c:1089: pickup.x -= xOverflow;
	ld	de, #(_pickup + 1)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/main.c:1092: if (pickup.visible && auxTick == 1) {
	ld	a, c
	or	a, a
	jp	Z, 00127$
	ld	a, (#_auxTick)
	dec	a
	jp	NZ,00127$
;src/main.c:1094: if (abs(pickup.x - playerDrawX) < 10) {
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:364: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00136$
;src/main.c:365: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:1094: if (abs(pickup.x - playerDrawX) < 10) {
00136$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8a
	jp	NC, 00115$
;src/main.c:1095: if (abs(pickup.y - playerDrawY) < 10) {
	ld	a, (#(_pickup + 3) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_playerDrawY
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/main.c:364: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00140$
;src/main.c:365: else return - value;
	xor	a, a
	ldhl	sp,	#1
	sub	a, (hl)
	ld	(hl), a
;src/main.c:1095: if (abs(pickup.y - playerDrawY) < 10) {
00140$:
	ldhl	sp,	#1
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00115$
;src/main.c:1096: if (pickup.type == 0) { //upgrade
	ld	a, (#(_pickup + 6) + 0)
	or	a, a
	jr	NZ, 00104$
;src/main.c:1097: if (gunLevel < 1) {
	ld	hl, #_gunLevel
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00104$
;src/main.c:1098: gunLevel += 1;
	inc	(hl)
	ld	a, (hl)
;src/main.c:1099: setGunIcon();
	call	_setGunIcon
00104$:
;src/main.c:1102: if (pickup.type == 1) { //missile ammo
	ld	hl, #(_pickup + 6)
	ld	l, (hl)
;	spillPairReg hl
;src/main.c:1103: updateMissileCount(pickup.amount);
	ld	bc, #_pickup + 7
;src/main.c:1102: if (pickup.type == 1) { //missile ammo
	dec	l
	jr	NZ, 00106$
;src/main.c:1103: updateMissileCount(pickup.amount);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
	pop	bc
00106$:
;src/main.c:1105: if (pickup.type == 2) {
	ld	a, (#(_pickup + 6) + 0)
	sub	a, #0x02
	jr	NZ, 00111$
;src/main.c:1106: if (hull + pickup.amount <= 100) {
	ld	hl, #_hull
	ld	e, (hl)
	ld	d, #0x00
	ld	a, (bc)
	ld	c, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	e, h
	ld	d, #0x00
	ld	a, #0x64
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00247$
	bit	7, d
	jr	NZ, 00248$
	cp	a, a
	jr	00248$
00247$:
	bit	7, d
	jr	Z, 00248$
	scf
00248$:
	jr	C, 00108$
;src/main.c:1107: hull += pickup.amount;
	ld	a, c
	ld	hl, #_hull
	add	a, (hl)
	ld	(hl), a
	jr	00111$
00108$:
;src/main.c:1110: hull = 100;
	ld	hl, #_hull
	ld	(hl), #0x64
00111$:
;src/main.c:1113: pickup.active = 0;
	ld	hl, #(_pickup + 5)
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1114: set_sprite_tile(3, 0x7f);
00115$:
;src/main.c:1089: pickup.x -= xOverflow;
	ld	hl, #(_pickup + 1)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1117: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
	ld	a, c
	sub	a, #0xf6
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00116$
	ld	e, b
	ld	d, #0x00
	ld	a, #0xaa
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00249$
	bit	7, d
	jr	NZ, 00250$
	cp	a, a
	jr	00250$
00249$:
	bit	7, d
	jr	Z, 00250$
	scf
00250$:
	jr	C, 00116$
;src/main.c:1090: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1117: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
	bit	7, b
	jr	NZ, 00116$
	ld	e, b
	ld	d, #0x00
	ld	a, #0x9b
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00251$
	bit	7, d
	jr	NZ, 00252$
	cp	a, a
	jr	00252$
00251$:
	bit	7, d
	jr	Z, 00252$
	scf
00252$:
	jr	NC, 00144$
00116$:
;src/main.c:1118: pickup.visible = 0;
	ld	hl, #_pickup
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1119: set_sprite_tile(3, 0x7f);
	jr	00144$
00127$:
;src/main.c:1123: if (pickup.x >= -10 && pickup.x <= 170 && pickup.y >= 0 && pickup.y <= 155) {
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, #0xf6
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00253$
	bit	7, d
	jr	NZ, 00254$
	cp	a, a
	jr	00254$
00253$:
	bit	7, d
	jr	Z, 00254$
	scf
00254$:
	jr	C, 00144$
	pop	bc
	push	bc
	ld	e, b
	ld	d, #0x00
	ld	a, #0xaa
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00255$
	bit	7, d
	jr	NZ, 00256$
	cp	a, a
	jr	00256$
00255$:
	bit	7, d
	jr	Z, 00256$
	scf
00256$:
	jr	C, 00144$
;src/main.c:1090: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1117: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
;src/main.c:1123: if (pickup.x >= -10 && pickup.x <= 170 && pickup.y >= 0 && pickup.y <= 155) {
	bit	7, b
	jr	NZ, 00144$
	ld	e, b
	ld	d, #0x00
	ld	a, #0x9b
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00257$
	bit	7, d
	jr	NZ, 00258$
	cp	a, a
	jr	00258$
00257$:
	bit	7, d
	jr	Z, 00258$
	scf
00258$:
	jr	C, 00144$
;src/main.c:1124: pickup.visible = 1;
	ld	hl, #_pickup
	ld	(hl), #0x01
;src/main.c:1125: set_sprite_tile(3, pickup.tile);
	ld	hl, #(_pickup + 8)
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;src/main.c:1125: set_sprite_tile(3, pickup.tile);
00144$:
;src/main.c:1130: }
	inc	sp
	inc	sp
	ret
;src/main.c:1132: void tickEx() {
;	---------------------------------
; Function tickEx
; ---------------------------------
_tickEx::
	add	sp, #-12
;src/main.c:1133: for (uint8_t i = 0; i < exCount; ++i) {
	ldhl	sp,	#11
	ld	(hl), #0x00
00118$:
	ld	hl, #_exCount
	ld	c, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jp	NC, 00120$
;src/main.c:1134: if (explosions[i].visible) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
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
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00119$
;src/main.c:1136: explosions[i].x -= xOverflow;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, (bc)
	ld	hl, #_xOverflow
	ld	e, (hl)
	sub	a, e
	ld	(bc), a
;src/main.c:1137: explosions[i].y -= yOverflow;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
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
	ld	a, (de)
	ld	hl, #_yOverflow
	ld	e, (hl)
	sub	a, e
	ldhl	sp,	#7
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;src/main.c:1138: move_sprite(20 + 2*i, explosions[i].x, explosions[i].y+8);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	add	a, a
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x14
	ldhl	sp,	#3
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
	ldhl	sp,	#9
;src/main.c:1139: move_sprite(21 + 2*i, explosions[i].x+8, explosions[i].y+8);
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	e, a
	ld	a, (bc)
	add	a, #0x08
	ld	c, a
	ld	a, (hl-)
	add	a, #0x15
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
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
	ld	(hl), c
;src/main.c:1141: explosions[i].frameCounter++;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src/main.c:1142: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jp	NZ, 00119$
;src/main.c:1143: if (explosions[i].frameCounter > EXPLFRAMETIME) {
	ld	a, (bc)
	ld	e, a
	ld	a, (#_EXPLFRAMETIME)
	sub	a, e
	jp	NC, 00119$
;src/main.c:1144: explosions[i].frameCounter = 0;
	xor	a, a
	ld	(bc), a
;src/main.c:1145: explosions[i].frame += 1; 
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
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
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;src/main.c:1146: if (explosions[i].frame > 3) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x03
	sub	a, c
	jr	NC, 00102$
;src/main.c:1147: explosions[i].visible = 0;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:1148: set_sprite_tile(20 + 2*i, 0x7f);
	ldhl	sp,	#3
	ld	c, (hl)
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
;src/main.c:1149: set_sprite_tile(21 + 2*i, 0x7f);
	ldhl	sp,	#9
	ld	c, (hl)
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
;src/main.c:1149: set_sprite_tile(21 + 2*i, 0x7f);
	jp	00119$
00102$:
;src/main.c:1152: set_sprite_tile(20 + 2*i, explosions[i].tile + (explosions[i].frame *4));
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
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
	ldhl	sp,	#10
	ld	(hl-), a
	dec	hl
	ld	(hl), c
	sla	(hl)
	sla	(hl)
	inc	hl
	inc	hl
	ld	a, (hl-)
	dec	hl
	add	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
	ldhl	sp,	#3
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00153$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00153$
	ld	de, #_shadow_OAM
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
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
	ld	d, (hl)
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(de), a
;src/main.c:1153: set_sprite_tile(21 + 2*i, explosions[i].tile+(explosions[i].frame *4) +2);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	sla	(hl)
	sla	(hl)
	inc	hl
	inc	hl
	ld	a, (hl-)
	dec	hl
	add	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
	inc	(hl)
	inc	(hl)
	dec	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00154$:
	ldhl	sp,	#8
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00154$
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
;src/main.c:1153: set_sprite_tile(21 + 2*i, explosions[i].tile+(explosions[i].frame *4) +2);
00119$:
;src/main.c:1133: for (uint8_t i = 0; i < exCount; ++i) {
	ldhl	sp,	#11
	inc	(hl)
	jp	00118$
00120$:
;src/main.c:1159: }
	add	sp, #12
	ret
;src/main.c:1161: void initEnemyOptions() {
;	---------------------------------
; Function initEnemyOptions
; ---------------------------------
_initEnemyOptions::
;src/main.c:1162: enemyOptions[0] = blob;
	ld	de, #0x0012
	push	de
	ld	de, #_blob
	push	de
	ld	de, #_enemyOptions
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1163: enemyOptions[1] = bomb;
	ld	de, #0x0012
	push	de
	ld	de, #_bomb
	push	de
	ld	de, #(_enemyOptions + 18)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1164: enemyOptions[2] = miniship;
	ld	de, #0x0012
	push	de
	ld	de, #_miniship
	push	de
	ld	de, #(_enemyOptions + 36)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1165: enemyOptions[3] = shieldship;
	ld	de, #0x0012
	push	de
	ld	de, #_shieldship
	push	de
	ld	de, #(_enemyOptions + 54)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1167: enemyOptions[4] = bigblob;
	ld	de, #0x0012
	push	de
	ld	de, #_bigblob
	push	de
	ld	de, #(_enemyOptions + 72)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1168: }
	ret
;src/main.c:1171: void initProjectiles() {
;	---------------------------------
; Function initProjectiles
; ---------------------------------
_initProjectiles::
;src/main.c:1172: set_sprite_data(0x20, 17, ProjectileTiles); 
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1120
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:1174: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	xor	a, a
00103$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	cp	a, c
	ret	NC
	inc	a
;src/main.c:1178: }
	jr	00103$
;src/main.c:1180: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/main.c:1183: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:1184: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
;src/main.c:1185: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
;src/main.c:1186: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
;src/main.c:1189: playerX = 80<<5;
	ld	hl, #_playerX
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;src/main.c:1190: playerY = 80<<5;
	ld	hl, #_playerY
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;src/main.c:1192: playerDrawX = 80;
	ld	hl, #_playerDrawX
	ld	(hl), #0x50
;src/main.c:1193: playerDrawY = 80;
	ld	hl, #_playerDrawY
	ld	(hl), #0x50
;src/main.c:1196: bgX = 0;
	xor	a, a
	ld	hl, #_bgX
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1197: bgY = 0;
	xor	a, a
	ld	hl, #_bgY
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1199: hull = maxHull;
	ld	a, (#_maxHull)
	ld	(#_hull),a
;src/main.c:1200: shield = maxShield;
	ld	a, (#_maxShield)
	ld	(#_shield),a
;src/main.c:1202: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:1203: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/main.c:1204: set_sprite_data(0, 12, Player1);
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
;src/main.c:1210: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1214: font_init();
	call	_font_init
;src/main.c:1216: min_font = font_load(font_min); // 36 tiles of characters
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_min_font
	ld	a, e
	ld	(hl+), a
;src/main.c:1217: font_set(min_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;src/main.c:1218: set_win_tiles(1,0,4,1,hullabel);
	ld	de, #_hullabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1219: set_win_tiles(1,1,4,1,shieldlabel);
	ld	de, #_shieldlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1224: set_bkg_data(0x50,1,healthblock);
	ld	de, #_healthblock
	push	de
	ld	hl, #0x150
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1226: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1227: setHealthBar(1, shield);
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
;src/main.c:1234: set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1235: set_bkg_tiles(0,0,background1Width, background1Height ,background1); //set tilemap to be a background
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
;src/main.c:1241: set_bkg_data(0x51, 18, ProjectileTiles);
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1251
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1243: set_win_tiles(10, 0,4,1,weaponlabel);
	ld	de, #_weaponlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1244: set_win_tiles(10, 1,4,1,scorelabel);
	ld	de, #_scorelabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x10a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1246: setGunIcon();
	call	_setGunIcon
;src/main.c:1247: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:1248: SHOW_WIN;;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1250: SCORE = MAKE_BCD(00000);
	xor	a, a
	ld	hl, #_SCORE
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1251: updateScore();
	call	_updateScore
;src/main.c:1252: missiles = 0;
	ld	hl, #_missiles
	ld	(hl), #0x00
;src/main.c:1253: MISSILES = MAKE_BCD(0);
	xor	a, a
	ld	hl, #_MISSILES
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1254: updateMissileCount(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:1255: set_win_tiles(17, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1259: pickup = upgrade;//upgrade;
	ld	de, #0x0009
	push	de
	ld	de, #_upgrade
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1261: set_sprite_data(0x70, 6, Pickups);
	ld	de, #_Pickups
	push	de
	ld	hl, #0x670
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1265: move_sprite(3, pickup.x + 4, pickup.y + 12);
	ld	a, (#(_pickup + 3) + 0)
	add	a, #0x0c
	ld	b, a
	ld	a, (#(_pickup + 1) + 0)
	add	a, #0x04
	ld	c, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;src/main.c:1267: for (uint8_t i = 0; i<exCount; ++i) {
	ld	c, #0x00
00109$:
	ld	hl, #_exCount
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00101$
;src/main.c:1268: explosions[i] = ex;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_explosions
	add	hl, de
	push	bc
	ld	de, #0x0006
	push	de
	ld	de, #_ex
	push	de
	push	hl
	call	___memcpy
	add	sp, #6
	pop	bc
;src/main.c:1267: for (uint8_t i = 0; i<exCount; ++i) {
	inc	c
	jr	00109$
00101$:
;src/main.c:1270: set_sprite_data(exTiles[0], 16, Ex1);
	ld	a, (#_exTiles + 0)
	ld	de, #_Ex1
	push	de
	ld	h, #0x10
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;src/main.c:1271: set_sprite_data(exTiles[1], 16, Ex2);
	ld	a, (#(_exTiles + 1) + 0)
	ld	de, #_Ex2
	push	de
	ld	h, #0x10
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;src/main.c:1272: set_sprite_data(exTiles[2], 16, Ex3);
	ld	a, (#(_exTiles + 2) + 0)
	ld	de, #_Ex3
	push	de
	ld	h, #0x10
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;src/main.c:1276: }
	ret
;src/main.c:1278: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:1281: initEnemyOptions();
	call	_initEnemyOptions
;src/main.c:1284: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG + 0), a
;src/main.c:1285: LYC_REG = 0x7e; //line 126
	ld	a, #0x7e
	ldh	(_LYC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1287: add_LCD(interruptLCD);
	ld	de, #_interruptLCD
	push	de
	call	_add_LCD
	inc	sp
	inc	sp
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;src/main.c:1289: set_interrupts(VBL_IFLAG | LCD_IFLAG);   
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;src/main.c:1293: NR52_REG = 0x80; // sound on 
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/main.c:1294: NR50_REG = 0x77; // volume
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/main.c:1295: NR51_REG = 0xFF; // all channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/main.c:1299: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1300: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;src/main.c:1301: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;src/main.c:1302: initrand(seed);
	push	bc
	call	_initrand
	pop	hl
;src/main.c:1307: initGame();
	call	_initGame
;src/main.c:1308: initEnemies(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/main.c:1309: initProjectiles();
	call	_initProjectiles
;src/main.c:1311: while(1) {
00122$:
;src/main.c:1312: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1314: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1316: updateDirection(); // set player direction
	call	_updateDirection
;src/main.c:1319: move(); 
	call	_move
;src/main.c:1321: updateEnemyPositions();
	call	_updateEnemyPositions
;src/main.c:1324: checkCollision(); 
	call	_checkCollision
;src/main.c:963: if (shield < maxShield) {
	ld	hl, #_maxShield
	ld	c, (hl)
	ld	e, c
	ld	hl, #_shield
	ld	d, (hl)
	ld	a, (hl)
	sub	a, c
	bit	7, e
	jr	Z, 00194$
	bit	7, d
	jr	NZ, 00195$
	cp	a, a
	jr	00195$
00194$:
	bit	7, d
	jr	Z, 00195$
	scf
00195$:
	jr	NC, 00130$
;src/main.c:964: shield += 1;
	ld	hl, #_shield
	inc	(hl)
00130$:
;src/main.c:966: setHealthBar(0, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:967: setHealthBar(1, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1329: if (joydata & J_B && fireCooldown == 0) {
	ld	a, (#_joydata)
	bit	5, a
	jr	Z, 00102$
	ld	a, (#_fireCooldown)
	or	a, a
	jr	NZ, 00102$
;src/main.c:1330: fire();
	call	_fire
00102$:
;src/main.c:1332: if (fireCooldown > 0) {
	ld	hl, #_fireCooldown
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;src/main.c:1333: --fireCooldown;
	dec	(hl)
00105$:
;src/main.c:1336: if (joydata & J_SELECT && switchDelay == 0) {
	ld	a, (#_joydata)
	bit	6, a
	jr	Z, 00112$
	ld	a, (#_switchDelay)
	or	a, a
	jr	NZ, 00112$
;src/main.c:1337: if (currentGun == 0) {
	ld	hl, #_currentGun
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
;src/main.c:1338: currentGun = 1;
	ld	(hl), #0x01
	jr	00110$
00109$:
;src/main.c:1340: else if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00110$
;src/main.c:1341: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
00110$:
;src/main.c:1343: setGunIcon();
	call	_setGunIcon
;src/main.c:1344: switchDelay = 30;
	ld	hl, #_switchDelay
	ld	(hl), #0x1e
00112$:
;src/main.c:1346: if (switchDelay != 0) {
	ld	hl, #_switchDelay
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
;src/main.c:1347: switchDelay--;
	dec	(hl)
00115$:
;src/main.c:1349: moveProjectiles();
	call	_moveProjectiles
;src/main.c:1350: tickPickups();
	call	_tickPickups
;src/main.c:1351: tickEx();
	call	_tickEx
;src/main.c:1353: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jr	NZ, 00117$
;src/main.c:1354: auxTick = AUXTICKFREQUENCY;
	ld	a, (#_AUXTICKFREQUENCY)
	ld	(#_auxTick),a
	jr	00118$
00117$:
;src/main.c:1357: auxTick--;
	ld	hl, #_auxTick
	dec	(hl)
00118$:
;src/main.c:1362: if (hull > 100) {
	ld	a, #0x64
	ld	hl, #_hull
	sub	a, (hl)
	jr	NC, 00120$
;src/main.c:1363: hull = 0;
	ld	(hl), #0x00
00120$:
;src/main.c:1366: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1367: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
;src/main.c:1372: }
	jp	00122$
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
	.dw #0x0032
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
	.dw #0x0032
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
	.dw #0x0032
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
	.dw #0x0064
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
	.dw #0x0046
__xinit__singleGun:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x02	; 2
	.dw #0x0032
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
	.dw #0x0046
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
	.dw #0x0064
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
	.db #0x00	; 0
__xinit__MISSILES:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
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
__xinit__oldestEx:
	.db #0x00	; 0
__xinit__exTiles:
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0xa0	; 160
__xinit__auxTick:
	.db #0x01	; 1
	.area _CABS (ABS)
