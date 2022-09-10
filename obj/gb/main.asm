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
	.globl _showLevelSelection
	.globl _showMenu
	.globl _updateMenu
	.globl _loadWindowStars
	.globl _showStartScreen
	.globl _showControls
	.globl _showScoreScreen
	.globl _doPause
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
	.globl _clearScreen
	.globl _recoverHud
	.globl _clearWindow
	.globl _initFont
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
	.globl _waitpadup
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
	.globl _MISSILES
	.globl _missiles
	.globl _currentGun
	.globl _gunLevel
	.globl _enemyCollisionCount
	.globl _yOverflow
	.globl _xOverflow
	.globl _prevJoyData
	.globl _joydata
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
	.globl _difficulty
	.globl _ATTACKSCALESPEED
	.globl _HPSCALESPEED
	.globl _missile
	.globl _doubleGun
	.globl _singleGun
	.globl _doublefuse
	.globl _destroyer
	.globl _xwing
	.globl _calvine
	.globl _owl
	.globl _shieldship
	.globl _minifighter
	.globl _minidual
	.globl _minibubble
	.globl _miniufo
	.globl _miniship
	.globl _minibomb
	.globl _minispike
	.globl _collisionTiles
	.globl _explosions
	.globl _pickup
	.globl _min_font
	.globl _shield
	.globl _hull
	.globl _projectiles
	.globl _enemies
	.globl _enemyOptions
	.globl _AUXTICKFREQUENCY
	.globl _exTileCount
	.globl _EXPLFRAMETIME
	.globl _exCount
	.globl _MAXGUNLEVEL
	.globl _SPLASHDROPOFF
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
	.globl _MenuPicker
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
	.globl _ENEMYOPTIONCOUNT
	.globl _healthblock
	.globl _pauselabel
	.globl _startlabel
	.globl _fullweaponlabel
	.globl _selectlabel
	.globl _blabel
	.globl _alabel
	.globl _dpadlabel
	.globl _controlsLabel
	.globl _bonusLabel
	.globl _marshabLabel
	.globl _asteroids2Label
	.globl _asteroids1Label
	.globl _voidLabel
	.globl _selectLevelLabel
	.globl _playLabel
	.globl _pressStartLabel
	.globl _emptyRow
	.globl _toContinueLabel
	.globl _pressAnyKeyLabel
	.globl _endScoreLabel
	.globl _scorelabel
	.globl _weaponlabel
	.globl _shieldlabel
	.globl _hullabel
	.globl _underscore
	.globl _logo0_map
	.globl _logo0_data
	.globl _background4
	.globl _background3
	.globl _backgroundtiles2
	.globl _background2
	.globl _marsbackground
	.globl _marstiles
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
	.ds 198
_enemies::
	.ds 90
_projectiles::
	.ds 65
_hull::
	.ds 1
_shield::
	.ds 1
_min_font::
	.ds 2
_pickup::
	.ds 9
_explosions::
	.ds 24
_collisionTiles::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_minispike::
	.ds 18
_minibomb::
	.ds 18
_miniship::
	.ds 18
_miniufo::
	.ds 18
_minibubble::
	.ds 18
_minidual::
	.ds 18
_minifighter::
	.ds 18
_shieldship::
	.ds 18
_owl::
	.ds 18
_calvine::
	.ds 18
_xwing::
	.ds 18
_destroyer::
	.ds 18
_doublefuse::
	.ds 18
_singleGun::
	.ds 13
_doubleGun::
	.ds 13
_missile::
	.ds 13
_HPSCALESPEED::
	.ds 2
_ATTACKSCALESPEED::
	.ds 2
_difficulty::
	.ds 2
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
_joydata::
	.ds 1
_prevJoyData::
	.ds 1
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
;src/main.c:188: void interruptLCD()
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;src/main.c:190: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:191: }
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
_backgroundtiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x38	; 56	'8'
	.db #0x3e	; 62
	.db #0x40	; 64
	.db #0x7e	; 126
	.db #0x98	; 152
	.db #0x5f	; 95
	.db #0xe8	; 232
	.db #0x7a	; 122	'z'
	.db #0x87	; 135
	.db #0x76	; 118	'v'
	.db #0xb9	; 185
	.db #0x3c	; 60
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x3c	; 60
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
_marstiles:
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x00	; 0
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0x92	; 146
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0x3d	; 61
	.db #0x24	; 36
	.db #0xda	; 218
	.db #0x66	; 102	'f'
	.db #0x5b	; 91
	.db #0x66	; 102	'f'
	.db #0xda	; 218
	.db #0x66	; 102	'f'
	.db #0x5b	; 91
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0xda	; 218
	.db #0x66	; 102	'f'
	.db #0x3d	; 61
	.db #0x24	; 36
	.db #0x8e	; 142
	.db #0x10	; 16
	.db #0x1e	; 30
	.db #0x60	; 96
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0x81	; 129
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xe6	; 230
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x39	; 57	'9'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xa9	; 169
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x62	; 98	'b'
	.db #0x7c	; 124
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x80	; 128
	.db #0x0e	; 14
	.db #0x4d	; 77	'M'
	.db #0x12	; 18
	.db #0x2c	; 44
	.db #0x32	; 50	'2'
	.db #0x34	; 52	'4'
	.db #0x2a	; 42
	.db #0xe0	; 224
	.db #0x7c	; 124
	.db #0x71	; 113	'q'
	.db #0x7c	; 124
	.db #0x7a	; 122	'z'
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x61	; 97	'a'
	.db #0x41	; 65	'A'
	.db #0xc1	; 193
	.db #0x81	; 129
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0xa1	; 161
	.db #0xe1	; 225
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x81	; 129
	.db #0xfa	; 250
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xfd	; 253
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0xa1	; 161
	.db #0xe1	; 225
	.db #0xc1	; 193
	.db #0xc5	; 197
	.db #0x81	; 129
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0xa1	; 161
	.db #0xe9	; 233
	.db #0xc1	; 193
	.db #0xc5	; 197
	.db #0x81	; 129
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xfd	; 253
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xfd	; 253
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x89	; 137
	.db #0x81	; 129
	.db #0x91	; 145
	.db #0x81	; 129
	.db #0x89	; 137
	.db #0x81	; 129
	.db #0x91	; 145
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x87	; 135
	.db #0x06	; 6
	.db #0x2b	; 43
	.db #0x0c	; 12
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x25	; 37
	.db #0x38	; 56	'8'
	.db #0xcd	; 205
	.db #0x70	; 112	'p'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x4d	; 77	'M'
	.db #0x70	; 112	'p'
	.db #0xcd	; 205
	.db #0x70	; 112	'p'
	.db #0x47	; 71	'G'
	.db #0x78	; 120	'x'
	.db #0x27	; 39
	.db #0x38	; 56	'8'
	.db #0xa3	; 163
	.db #0x3c	; 60
	.db #0x51	; 81	'Q'
	.db #0x1e	; 30
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x90	; 144
	.db #0x80	; 128
	.db #0xe2	; 226
	.db #0x60	; 96
	.db #0xd5	; 213
	.db #0x30	; 48	'0'
	.db #0xc8	; 200
	.db #0x38	; 56	'8'
	.db #0xe4	; 228
	.db #0x1c	; 28
	.db #0xd2	; 210
	.db #0x0e	; 14
	.db #0xd3	; 211
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0xf3	; 243
	.db #0x0e	; 14
	.db #0xf2	; 242
	.db #0x0e	; 14
	.db #0x62	; 98	'b'
	.db #0x1e	; 30
	.db #0x64	; 100	'd'
	.db #0x1c	; 28
	.db #0xc5	; 197
	.db #0x3c	; 60
	.db #0x8a	; 138
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0xfe	; 254
_marsbackground:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x31	; 49	'1'
	.db #0x33	; 51	'3'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x32	; 50	'2'
	.db #0x34	; 52	'4'
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
_background2:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x2e	; 46
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x28	; 40
	.db #0x2e	; 46
	.db #0x2b	; 43
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x2d	; 45
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2c	; 44
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2d	; 45
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
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
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
_backgroundtiles2:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x47	; 71	'G'
	.db #0xb8	; 184
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x46	; 70	'F'
	.db #0xb9	; 185
	.db #0x17	; 23
	.db #0xe8	; 232
	.db #0x06	; 6
	.db #0xf9	; 249
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0x7b	; 123
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x00	; 0
_background3:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
_background4:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x25	; 37
	.db #0x25	; 37
_logo0_data:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
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
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
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
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
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
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
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
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
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
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
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
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
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
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
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
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf8	; 248
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
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
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
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_logo0_map:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_underscore:
	.db #0xff	; 255
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
_hullabel:
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x16	; 22
_shieldlabel:
	.db #0x1d	; 29
	.db #0x12	; 18
	.db #0x16	; 22
	.db #0x0e	; 14
_weaponlabel:
	.db #0x21	; 33
	.db #0x0f	; 15
	.db #0x1a	; 26
	.db #0x18	; 24
_scorelabel:
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x1c	; 28
	.db #0x0f	; 15
_endScoreLabel:
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x0f	; 15
_pressAnyKeyLabel:
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x18	; 24
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x0f	; 15
	.db #0x23	; 35
_toContinueLabel:
	.db #0x1e	; 30
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x0f	; 15
_emptyRow:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_pressStartLabel:
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x1e	; 30
_playLabel:
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x23	; 35
_selectLevelLabel:
	.db #0x1d	; 29
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x20	; 32
	.db #0x0f	; 15
	.db #0x16	; 22
_voidLabel:
	.db #0x20	; 32
	.db #0x19	; 25
	.db #0x13	; 19
	.db #0x0e	; 14
_asteroids1Label:
	.db #0x0b	; 11
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x19	; 25
	.db #0x13	; 19
	.db #0x0e	; 14
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x02	; 2
_asteroids2Label:
	.db #0x0b	; 11
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0f	; 15
	.db #0x1c	; 28
	.db #0x19	; 25
	.db #0x13	; 19
	.db #0x0e	; 14
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x03	; 3
_marshabLabel:
	.db #0x17	; 23
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x0b	; 11
	.db #0x0c	; 12
_bonusLabel:
	.db #0x0c	; 12
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x1d	; 29
_controlsLabel:
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x1d	; 29
_dpadlabel:
	.db #0x0e	; 14
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x18	; 24
_alabel:
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x12	; 18
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x1d	; 29
	.db #0x1e	; 30
_blabel:
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x13	; 19
	.db #0x1c	; 28
	.db #0x0f	; 15
_selectlabel:
	.db #0x1d	; 29
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x21	; 33
	.db #0x13	; 19
	.db #0x1e	; 30
	.db #0x0d	; 13
	.db #0x12	; 18
_fullweaponlabel:
	.db #0x21	; 33
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x1a	; 26
	.db #0x19	; 25
	.db #0x18	; 24
_startlabel:
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x1f	; 31
	.db #0x1d	; 29
	.db #0x0f	; 15
_pauselabel:
	.db #0x1a	; 26
	.db #0x0b	; 11
	.db #0x1f	; 31
	.db #0x1d	; 29
	.db #0x0f	; 15
	.db #0x0e	; 14
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
_ENEMYOPTIONCOUNT:
	.db #0x0b	; 11
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x42	; 66	'B'
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
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x0c	; 12
	.db #0x81	; 129
	.db #0x04	; 4
	.db #0x81	; 129
	.db #0x18	; 24
	.db #0x99	; 153
	.db #0x24	; 36
	.db #0xbd	; 189
	.db #0x18	; 24
	.db #0x5a	; 90	'Z'
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
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x34	; 52	'4'
	.db #0x2c	; 44
	.db #0x52	; 82	'R'
	.db #0x1e	; 30
	.db #0xb7	; 183
	.db #0x19	; 25
	.db #0x51	; 81	'Q'
	.db #0x1f	; 31
	.db #0xb2	; 178
	.db #0x1e	; 30
	.db #0x34	; 52	'4'
	.db #0x2c	; 44
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x58	; 88	'X'
	.db #0x78	; 120	'x'
	.db #0xbe	; 190
	.db #0x72	; 114	'r'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xa8	; 168
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x40	; 64
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
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x38	; 56	'8'
	.db #0x37	; 55	'7'
	.db #0x74	; 116	't'
	.db #0x4f	; 79	'O'
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x3d	; 61
	.db #0x25	; 37
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
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x1c	; 28
	.db #0xec	; 236
	.db #0x2e	; 46
	.db #0xf2	; 242
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x42	; 66	'B'
	.db #0xfe	; 254
	.db #0xbc	; 188
	.db #0xa4	; 164
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
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x0b	; 11
	.db #0x4b	; 75	'K'
	.db #0x09	; 9
	.db #0x89	; 137
	.db #0x04	; 4
	.db #0x84	; 132
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0x1c	; 28
	.db #0xd0	; 208
	.db #0xd2	; 210
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x20	; 32
	.db #0x20	; 32
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x0d	; 13
	.db #0x38	; 56	'8'
	.db #0x37	; 55	'7'
	.db #0x66	; 102	'f'
	.db #0x5f	; 95
	.db #0xc1	; 193
	.db #0xbf	; 191
	.db #0x64	; 100	'd'
	.db #0x5f	; 95
	.db #0x32	; 50	'2'
	.db #0x2f	; 47
	.db #0x18	; 24
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x0a	; 10
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
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0x1c	; 28
	.db #0xec	; 236
	.db #0x6e	; 110	'n'
	.db #0xf2	; 242
	.db #0x83	; 131
	.db #0xfd	; 253
	.db #0x26	; 38
	.db #0xfa	; 250
	.db #0x4c	; 76	'L'
	.db #0xf4	; 244
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0xac	; 172
	.db #0x3c	; 60
	.db #0x74	; 116	't'
	.db #0x3c	; 60
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0xbf	; 191
	.db #0x3e	; 62
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x74	; 116	't'
	.db #0x3c	; 60
	.db #0xac	; 172
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x10	; 16
	.db #0x18	; 24
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x2e	; 46
	.db #0x36	; 54	'6'
	.db #0x61	; 97	'a'
	.db #0x5f	; 95
	.db #0x59	; 89	'Y'
	.db #0x66	; 102	'f'
	.db #0x46	; 70	'F'
	.db #0x79	; 121	'y'
	.db #0x68	; 104	'h'
	.db #0x37	; 55	'7'
	.db #0xa1	; 161
	.db #0x3e	; 62
	.db #0x61	; 97	'a'
	.db #0x3e	; 62
	.db #0xa8	; 168
	.db #0x37	; 55	'7'
	.db #0x46	; 70	'F'
	.db #0x79	; 121	'y'
	.db #0x59	; 89	'Y'
	.db #0x66	; 102	'f'
	.db #0x61	; 97	'a'
	.db #0x5f	; 95
	.db #0x2e	; 46
	.db #0x36	; 54	'6'
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
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x46	; 70	'F'
	.db #0xbe	; 190
	.db #0x1d	; 29
	.db #0xe3	; 227
	.db #0x1d	; 29
	.db #0xe3	; 227
	.db #0x46	; 70	'F'
	.db #0xbe	; 190
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0x9e	; 158
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0x11	; 17
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x01	; 1
	.db #0x39	; 57	'9'
	.db #0x9e	; 158
	.db #0x0f	; 15
	.db #0x47	; 71	'G'
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0xf0	; 240
	.db #0x3e	; 62
	.db #0xfc	; 252
	.db #0xcf	; 207
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xcf	; 207
	.db #0xfe	; 254
	.db #0x3e	; 62
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
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
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x20	; 32
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
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x1c	; 28
	.db #0x12	; 18
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
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
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x2c	; 44
	.db #0x28	; 40
	.db #0x34	; 52	'4'
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x00	; 0
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
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x20	; 32
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
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
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
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x10	; 16
	.db #0x2c	; 44
	.db #0x10	; 16
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
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xcc	; 204
	.db #0x5e	; 94
	.db #0x1e	; 30
	.db #0x92	; 146
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x2c	; 44
	.db #0x34	; 52	'4'
	.db #0x2c	; 44
	.db #0x1c	; 28
	.db #0x24	; 36
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x06	; 6
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
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x10	; 16
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
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x00	; 0
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
	.db #0x10	; 16
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
	.db #0x01	; 1
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
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x00	; 0
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
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x00	; 0
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
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x3a	; 58
	.db #0x26	; 38
	.db #0x08	; 8
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
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x5c	; 92
	.db #0x64	; 100	'd'
	.db #0x18	; 24
	.db #0x14	; 20
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
	.db #0x20	; 32
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x28	; 40
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x60	; 96
	.db #0x00	; 0
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
	.db #0x00	; 0
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
_MenuPicker:
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x58	; 88	'X'
	.db #0x78	; 120	'x'
	.db #0xbe	; 190
	.db #0x72	; 114	'r'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xa8	; 168
	.db #0x78	; 120	'x'
	.db #0x40	; 64
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
_BLANKSIZE:
	.db #0x03	; 3
_BLANK:
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
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
_SPLASHDROPOFF:
	.db #0x01	; 1
_MAXGUNLEVEL:
	.db #0x01	; 1
_exCount:
	.db #0x04	; 4
_EXPLFRAMETIME:
	.db #0x04	; 4
_exTileCount:
	.db #0x03	; 3
_AUXTICKFREQUENCY:
	.db #0x01	; 1
;src/main.c:196: void setHealthBar(uint8_t row, uint8_t hp) {
;	---------------------------------
; Function setHealthBar
; ---------------------------------
_setHealthBar::
	add	sp, #-5
;src/main.c:198: if (hp >= 80) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x50
	jr	C, 00102$
;src/main.c:199: unsigned char blockmap[] = {0x50,0x50,0x50, 0x50, 0x50};
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
;src/main.c:200: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:201: return;
	jp	00111$
00102$:
;src/main.c:203: if (hp >= 60) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00104$
;src/main.c:204: unsigned char blockmap[] = {0x50,0x50,0x50, 0x50, 0x00};
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
;src/main.c:205: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:206: return;
	jp	00111$
00104$:
;src/main.c:208: if (hp >= 40) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00106$
;src/main.c:209: unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
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
;src/main.c:210: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:211: return;
	jp	00111$
00106$:
;src/main.c:213: if (hp >= 20) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x14
	jr	C, 00108$
;src/main.c:214: unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
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
;src/main.c:215: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:216: return;
	jr	00111$
00108$:
;src/main.c:218: if (hp >= 1) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x01
	jr	C, 00110$
;src/main.c:219: unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
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
;src/main.c:220: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:221: return;
	jr	00111$
00110$:
;src/main.c:223: unsigned char blockmap[] = {0x00,0x00,0x00,0x00,0x00};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
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
;src/main.c:224: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:225: return;
00111$:
;src/main.c:227: }
	add	sp, #5
	ret
;src/main.c:230: void updateScore() {
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
	add	sp, #-10
;src/main.c:233: len = bcd2text(&SCORE, 0x01, buf);
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
;src/main.c:234: set_win_tiles(15, 1, 5, 1, buf+3);
	inc	bc
	inc	bc
	inc	bc
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x10f
	push	hl
	call	_set_win_tiles
;src/main.c:235: }
	add	sp, #16
	ret
;src/main.c:238: void updateMissileCount(int8_t amount) {
;	---------------------------------
; Function updateMissileCount
; ---------------------------------
_updateMissileCount::
	add	sp, #-10
;src/main.c:239: if (amount == -1) {
	ldhl	sp,	#12
	ld	a, (hl)
	inc	a
	jr	NZ, 00112$
;src/main.c:240: missiles--;
	ld	hl, #_missiles
	dec	(hl)
;src/main.c:241: bcd_sub(&MISSILES, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_sub
	add	sp, #4
	jr	00104$
;src/main.c:244: for(int8_t i=0; i<amount;i++) {
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
;src/main.c:245: ++missiles;
	ld	hl, #_missiles
	inc	(hl)
;src/main.c:246: bcd_add(&MISSILES, &INCREMENT);
	push	bc
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_add
	add	sp, #4
	pop	bc
;src/main.c:244: for(int8_t i=0; i<amount;i++) {
	inc	c
	jr	00106$
00104$:
;src/main.c:251: len = bcd2text(&MISSILES, 0x01, buf);
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
;src/main.c:252: set_win_tiles(18, 0, 2, 1, buf+6);
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x12
	push	hl
	call	_set_win_tiles
;src/main.c:254: }
	add	sp, #16
	ret
;src/main.c:257: void incrementScore() {
;	---------------------------------
; Function incrementScore
; ---------------------------------
_incrementScore::
;src/main.c:258: score += 1;
	ld	hl, #_score
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:259: bcd_add(&SCORE, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_SCORE
	push	de
	call	_bcd_add
	add	sp, #4
;src/main.c:260: }
	ret
;src/main.c:265: void updateDirection() {
;	---------------------------------
; Function updateDirection
; ---------------------------------
_updateDirection::
	add	sp, #-4
;src/main.c:268: if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:269: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:270: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00102$:
;src/main.c:272: if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:273: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:274: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00106$:
;src/main.c:276: if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:277: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:278: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00110$:
;src/main.c:280: if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:281: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:282: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00114$:
;src/main.c:286: if ((joydata & J_UP) && (joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;src/main.c:287: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:288: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00118$:
;src/main.c:290: if ((joydata & J_UP) && (joydata & J_LEFT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
	ld	a, d
	or	a, e
	jr	Z, 00121$
;src/main.c:291: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:292: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00121$:
;src/main.c:294: if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00124$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;src/main.c:295: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:296: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00124$:
;src/main.c:298: if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
	ld	a, b
	or	a, c
	jr	Z, 00127$
	ld	a, d
	or	a, e
	jr	Z, 00127$
;src/main.c:299: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:300: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00127$:
;src/main.c:305: if (xDir == 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00130$
	ld	a, (#_yDir)
	or	a, a
;src/main.c:306: return;
	jp	Z,00194$
00130$:
;src/main.c:313: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jp	NZ, 00194$
;src/main.c:314: if (xDir == 0 && yDir > 0) {
	ld	hl, #_yDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
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
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, (#_xDir)
	or	a,a
	jr	NZ, 00157$
	or	a,c
	jr	Z, 00157$
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
;src/main.c:318: set_sprite_prop(1, S_FLIPY); 
	jp	00194$
00157$:
;src/main.c:320: else if (xDir == 0 && yDir < 0) {
	ld	a, (#_yDir)
	rlca
	and	a,#0x01
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00153$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00153$
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
;src/main.c:324: set_sprite_prop(1, 0); 
	jp	00194$
00153$:
;src/main.c:326: else if (xDir > 0 && yDir == 0) {
	ld	hl, #_xDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00383$
	bit	7, d
	jr	NZ, 00384$
	cp	a, a
	jr	00384$
00383$:
	bit	7, d
	jr	Z, 00384$
	scf
00384$:
	ld	a, #0x00
	rla
	ld	b, a
	or	a, a
	jr	Z, 00149$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00149$
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
;src/main.c:330: set_sprite_prop(1, 0); 
	jp	00194$
00149$:
;src/main.c:332: else if (xDir < 0 && yDir == 0) {
	ld	a, (#_xDir)
	rlca
	and	a,#0x01
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
	ld	a, (#_yDir)
	or	a, a
	jr	NZ, 00145$
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
;src/main.c:336: set_sprite_prop(1, S_FLIPX); 
	jr	00194$
00145$:
;src/main.c:338: else if (xDir > 0 && yDir < 0) {
	ld	a, b
	or	a, a
	jr	Z, 00141$
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00141$
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
;src/main.c:342: set_sprite_prop(1, 0); 
	jr	00194$
00141$:
;src/main.c:344: else if (xDir > 0 && yDir > 0) {
	ld	a, b
	or	a, a
	jr	Z, 00137$
	ld	a, c
	or	a, a
	jr	Z, 00137$
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
;src/main.c:348: set_sprite_prop(1, S_FLIPY); 
	jr	00194$
00137$:
;src/main.c:350: else if (xDir < 0 && yDir > 0) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
	ld	a, c
	or	a, a
	jr	Z, 00133$
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
;src/main.c:354: set_sprite_prop(1, S_FLIPY | S_FLIPX); 
	jr	00194$
00133$:
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
;src/main.c:360: set_sprite_prop(1, S_FLIPX); 
00194$:
;src/main.c:365: }
	add	sp, #4
	ret
;src/main.c:394: void playSound(uint8_t type) {
;	---------------------------------
; Function playSound
; ---------------------------------
_playSound::
;src/main.c:395: if (type == 20) { //gun
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00102$
;src/main.c:396: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG + 0), a
;src/main.c:397: NR22_REG = 0x41;
	ld	a, #0x41
	ldh	(_NR22_REG + 0), a
;src/main.c:398: NR23_REG = 0x8b;
	ld	a, #0x8b
	ldh	(_NR23_REG + 0), a
;src/main.c:399: NR24_REG = 0x82;
	ld	a, #0x82
	ldh	(_NR24_REG + 0), a
00102$:
;src/main.c:401: if (type == 21) { //gun
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x15
	jr	NZ, 00104$
;src/main.c:402: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG + 0), a
;src/main.c:403: NR22_REG = 0x51;
	ld	a, #0x51
	ldh	(_NR22_REG + 0), a
;src/main.c:404: NR23_REG = 0x8b;
	ld	a, #0x8b
	ldh	(_NR23_REG + 0), a
;src/main.c:405: NR24_REG = 0x82;
	ld	a, #0x82
	ldh	(_NR24_REG + 0), a
00104$:
;src/main.c:407: if (type == 22) { //missile
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x16
	jr	NZ, 00106$
;src/main.c:408: NR21_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR21_REG + 0), a
;src/main.c:409: NR22_REG = 0x54;
	ld	a, #0x54
	ldh	(_NR22_REG + 0), a
;src/main.c:410: NR23_REG = 0x5a;
	ld	a, #0x5a
	ldh	(_NR23_REG + 0), a
;src/main.c:411: NR24_REG = 0x82;
	ld	a, #0x82
	ldh	(_NR24_REG + 0), a
00106$:
;src/main.c:414: if (type == 0) {  // explosion 1
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
;src/main.c:415: NR41_REG = 0x20;
	ld	a, #0x20
	ldh	(_NR41_REG + 0), a
;src/main.c:416: NR42_REG = 0x82; //0xa2  
	ld	a, #0x82
	ldh	(_NR42_REG + 0), a
;src/main.c:417: NR43_REG = 0x57;  
	ld	a, #0x57
	ldh	(_NR43_REG + 0), a
;src/main.c:418: NR44_REG = 0x80;  
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
00108$:
;src/main.c:420: if (type == 1) { //player explosion
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	NZ, 00110$
;src/main.c:421: NR41_REG = 0x3f;
	ld	a, #0x3f
	ldh	(_NR41_REG + 0), a
;src/main.c:422: NR42_REG = 0x66; //36 
	ld	a, #0x66
	ldh	(_NR42_REG + 0), a
;src/main.c:423: NR43_REG = 0x47;  
	ld	a, #0x47
	ldh	(_NR43_REG + 0), a
;src/main.c:424: NR44_REG = 0x80;  
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
00110$:
;src/main.c:426: if (type == 2) { //missile ex
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00112$
;src/main.c:427: NR41_REG = 0x3f;
	ld	a, #0x3f
	ldh	(_NR41_REG + 0), a
;src/main.c:428: NR42_REG = 0xa3; //f3 
	ld	a, #0xa3
	ldh	(_NR42_REG + 0), a
;src/main.c:429: NR43_REG = 0x7f;  
	ld	a, #0x7f
	ldh	(_NR43_REG + 0), a
;src/main.c:430: NR44_REG = 0x80;  
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
00112$:
;src/main.c:432: if (type == 10) { //pickup
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0a
	jr	NZ, 00114$
;src/main.c:433: NR10_REG = 0x74;
	ld	a, #0x74
	ldh	(_NR10_REG + 0), a
;src/main.c:434: NR11_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR11_REG + 0), a
;src/main.c:435: NR12_REG = 0x50;
	ld	a, #0x50
	ldh	(_NR12_REG + 0), a
;src/main.c:436: NR13_REG = 0x74;
	ld	a, #0x74
	ldh	(_NR13_REG + 0), a
;src/main.c:437: NR14_REG = 0xc5;
	ld	a, #0xc5
	ldh	(_NR14_REG + 0), a
00114$:
;src/main.c:439: if (type == 30) { //menu up/down
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x1e
	jr	NZ, 00116$
;src/main.c:440: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:441: NR11_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR11_REG + 0), a
;src/main.c:442: NR12_REG = 0x51;
	ld	a, #0x51
	ldh	(_NR12_REG + 0), a
;src/main.c:443: NR13_REG = 0x11;
	ld	a, #0x11
	ldh	(_NR13_REG + 0), a
;src/main.c:444: NR14_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR14_REG + 0), a
00116$:
;src/main.c:446: if (type == 31) { //menu back
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x1f
	jr	NZ, 00118$
;src/main.c:447: NR10_REG = 0x5c;
	ld	a, #0x5c
	ldh	(_NR10_REG + 0), a
;src/main.c:448: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:449: NR12_REG = 0x63;
	ld	a, #0x63
	ldh	(_NR12_REG + 0), a
;src/main.c:450: NR13_REG = 0xc9;
	ld	a, #0xc9
	ldh	(_NR13_REG + 0), a
;src/main.c:451: NR14_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR14_REG + 0), a
00118$:
;src/main.c:453: if (type == 32) { //menu confirm
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x20
	ret	NZ
;src/main.c:454: NR10_REG = 0x54;
	ld	a, #0x54
	ldh	(_NR10_REG + 0), a
;src/main.c:455: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:456: NR12_REG = 0x63;
	ld	a, #0x63
	ldh	(_NR12_REG + 0), a
;src/main.c:457: NR13_REG = 0xc9;
	ld	a, #0xc9
	ldh	(_NR13_REG + 0), a
;src/main.c:458: NR14_REG = 0x85;
	ld	a, #0x85
	ldh	(_NR14_REG + 0), a
;src/main.c:461: }
	ret
;src/main.c:464: void initFont() {
;	---------------------------------
; Function initFont
; ---------------------------------
_initFont::
;src/main.c:465: font_init();
	call	_font_init
;src/main.c:467: min_font = font_load(font_min); // 36 tiles of characters
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_min_font
	ld	a, e
	ld	(hl+), a
;src/main.c:468: font_set(min_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;src/main.c:469: }
	ret
;src/main.c:472: void clearWindow() {
;	---------------------------------
; Function clearWindow
; ---------------------------------
_clearWindow::
;src/main.c:473: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x08
	ldh	(_WX_REG + 0), a
	ld	a, #0x7e
	ldh	(_WY_REG + 0), a
;src/main.c:475: for (uint8_t i=0; i < 18; ++i) {
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x12
	jr	NC, 00101$
;src/main.c:476: set_win_tiles(1,i,20,1,emptyRow);
	ld	de, #_emptyRow
	push	de
	ld	hl, #0x114
	push	hl
	push	bc
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;src/main.c:475: for (uint8_t i=0; i < 18; ++i) {
	inc	b
	jr	00104$
00101$:
;src/main.c:478: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:479: }
	ret
;src/main.c:483: void recoverHud() {
;	---------------------------------
; Function recoverHud
; ---------------------------------
_recoverHud::
;src/main.c:484: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x7e
	ldh	(_WY_REG + 0), a
;src/main.c:486: set_win_tiles(1,0,4,1,shieldlabel);
	ld	de, #_shieldlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:487: set_win_tiles(1,1,4,1,hullabel);
	ld	de, #_hullabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:488: set_win_tiles(10, 0,4,1,weaponlabel);
	ld	de, #_weaponlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:489: set_win_tiles(10, 1,4,1,scorelabel);
	ld	de, #_scorelabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x10a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:490: setGunIcon();
	call	_setGunIcon
;src/main.c:491: updateScore();
	call	_updateScore
;src/main.c:492: updateMissileCount(missiles);
	ld	a, (#_missiles)
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:493: set_win_tiles(17, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:495: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:496: }
	ret
;src/main.c:499: void clearScreen() {
;	---------------------------------
; Function clearScreen
; ---------------------------------
_clearScreen::
;src/main.c:500: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:501: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;src/main.c:502: for (uint8_t i=0; i < 18; ++i) {
	ld	b, #0x00
00105$:
	ld	a, b
	sub	a, #0x12
	jr	NC, 00101$
;src/main.c:503: set_win_tiles(0,i,20,1,emptyRow);
	ld	de, #_emptyRow
	push	de
	ld	hl, #0x114
	push	hl
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;src/main.c:504: set_bkg_tiles(0,i,20,1,emptyRow);
	ld	de, #_emptyRow
	push	de
	ld	hl, #0x114
	push	hl
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:502: for (uint8_t i=0; i < 18; ++i) {
	inc	b
	jr	00105$
00101$:
;src/main.c:506: for (uint8_t j=0; j < 40; ++j) {
	ld	c, #0x00
00108$:
	ld	a, c
	sub	a, #0x28
	jr	NC, 00102$
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, c
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
;src/main.c:506: for (uint8_t j=0; j < 40; ++j) {
	inc	c
	jr	00108$
00102$:
;src/main.c:510: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:511: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:513: }
	ret
;src/main.c:516: void initEnemies(uint8_t loadSprites) {
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	add	sp, #-11
;src/main.c:518: if (loadSprites) {
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/main.c:520: set_sprite_data(0x40, 13, enemy1);
	ld	de, #_enemy1
	push	de
	ld	hl, #0xd40
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:521: set_sprite_data(0x50, 32, largeenemies);
	ld	de, #_largeenemies
	push	de
	ld	hl, #0x2050
	push	hl
	call	_set_sprite_data
	add	sp, #4
00102$:
;src/main.c:524: struct Enemy *eptr = enemies;
	ldhl	sp,	#8
	ld	a, #<(_enemies)
	ld	(hl+), a
;src/main.c:526: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ld	a, #>(_enemies)
	ld	(hl+), a
	ld	(hl), #0x00
00114$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, c
	jp	NC, 00116$
;src/main.c:528: uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) ENEMYOPTIONCOUNT;
	call	_rand
	ldhl	sp,	#7
	ld	(hl), e
	ld	a, (#_ENEMYOPTIONCOUNT)
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	call	__moduchar
	pop	hl
;src/main.c:530: (*eptr) = enemyOptions[enemyInd];
	ldhl	sp,#7
	ld	(hl), e
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	de, #_enemyOptions
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
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	de, #0x0012
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:532: uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
	call	_rand
	ld	a, e
	and	a, #0x07
	ldhl	sp,	#7
	ld	(hl), a
;src/main.c:533: eptr->x = xSpawnPositions[posIndex];
	ld	de, #_xSpawnPositions
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:534: eptr->y = ySpawnPositions[posIndex];
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	de, #_ySpawnPositions
	ldhl	sp,	#7
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
;src/main.c:536: if (eptr->spriteCount == 1) {
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
;src/main.c:537: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	b, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	a, b
	add	a, a
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x0a
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:536: if (eptr->spriteCount == 1) {
	dec	c
	jp	NZ,00104$
;src/main.c:537: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00141$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00141$
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
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
;src/main.c:538: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00142$:
	ldhl	sp,	#3
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00142$
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
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/main.c:538: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	jp	00105$
00104$:
;src/main.c:541: set_sprite_tile(10+ (i<<1), eptr->sprite0);
	ldhl	sp,	#6
	ld	c, (hl)
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
	ld	(hl), c
;src/main.c:542: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#2
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
	ld	e, l
	ld	d, h
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;src/main.c:544: set_sprite_tile(10+ (i<<1) +1, eptr->sprite1);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, #0x0b
	ldhl	sp,	#3
	ld	(hl), a
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00143$:
	ldhl	sp,	#6
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00143$
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
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;src/main.c:545: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#3
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00144$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00144$
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
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;src/main.c:545: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
00105$:
;src/main.c:549: eptr++;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
;src/main.c:526: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ld	(hl+), a
	inc	(hl)
	jp	00114$
00116$:
;src/main.c:552: }
	add	sp, #11
	ret
;src/main.c:555: void initEnemy(uint8_t i) {
;	---------------------------------
; Function initEnemy
; ---------------------------------
_initEnemy::
	add	sp, #-5
;src/main.c:558: if (enemies[i].alive == 0) {
	ldhl	sp,	#7
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
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	NZ, 00109$
;src/main.c:560: uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) ENEMYOPTIONCOUNT;
	call	_rand
	ld	a, e
	ld	hl, #_ENEMYOPTIONCOUNT
	ld	b, (hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	__moduchar
	pop	hl
;src/main.c:561: enemies[i] = enemyOptions[enemyInd];
	ldhl	sp,#4
	ld	(hl), e
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_enemyOptions
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0012
	push	hl
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
;src/main.c:563: uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
	call	_rand
	ldhl	sp,#4
	ld	(hl), e
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/main.c:564: enemies[i].x = xSpawnPositions[posIndex];
	ld	de, #_xSpawnPositions
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:565: enemies[i].y = ySpawnPositions[posIndex];
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	ld	de, #_ySpawnPositions+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;src/main.c:566: enemies[i].hp += difficulty % HPSCALESPEED;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
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
	push	bc
	ld	hl, #_HPSCALESPEED
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_difficulty
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__moduint
	add	sp, #4
;	spillPairReg hl
;	spillPairReg hl
	pop	hl
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
;src/main.c:567: enemies[i].damage += difficulty & ATTACKSCALESPEED;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	ld	a, (#_difficulty)
	ld	hl, #_ATTACKSCALESPEED
	ld	d, (hl)
	and	a, d
	add	a, e
	ld	(bc), a
;src/main.c:568: difficulty += 1;
	ld	hl, #_difficulty
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:570: if (enemies[i].spriteCount == 1) {
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
;src/main.c:571: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	c, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	sla	c
	ld	a, c
	add	a, #0x0a
	ld	e, a
;src/main.c:570: if (enemies[i].spriteCount == 1) {
	dec	b
	jr	NZ, 00102$
;src/main.c:571: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
	ld	c, l
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, e
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
;src/main.c:571: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
	jr	00109$
00102$:
;src/main.c:575: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
	ld	b, l
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, e
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
;src/main.c:578: set_sprite_tile(10+ (i<<1) +1, enemies[i].sprite1);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
	ld	a, c
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
	ld	(hl), b
;src/main.c:578: set_sprite_tile(10+ (i<<1) +1, enemies[i].sprite1);
00109$:
;src/main.c:583: }
	add	sp, #5
	ret
;src/main.c:588: void updateEnemyPositions() {
;	---------------------------------
; Function updateEnemyPositions
; ---------------------------------
_updateEnemyPositions::
	add	sp, #-16
;src/main.c:590: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	ld	(hl), #0x00
00197$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jp	NC, 00145$
;src/main.c:591: if (!enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
;src/main.c:599: if (enemies[i].x < playerDrawX) {
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
;src/main.c:591: if (!enemies[i].alive) {
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	Z, 00144$
;src/main.c:594: enemies[i].x -= xOverflow;
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
;src/main.c:595: enemies[i].y -= yOverflow;
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
;src/main.c:598: if (abs(enemies[i].x - playerDrawX) > 8) {
	ldhl	sp,	#13
	ld	a, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:385: if (value >= 0) return value;
	bit	7, c
	jr	NZ, 00170$
	ld	b, c
	jr	00172$
00170$:
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, c
	ld	b, a
;src/main.c:598: if (abs(enemies[i].x - playerDrawX) > 8) {
00172$:
;src/main.c:613: enemies[i].ySpeed += enemies[i].accel;
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
;src/main.c:600: enemies[i].xSpeed += enemies[i].accel;
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
;src/main.c:607: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/main.c:598: if (abs(enemies[i].x - playerDrawX) > 8) {
	ld	e, b
	ld	a,#0x08
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00399$
	bit	7, d
	jr	NZ, 00400$
	cp	a, a
	jr	00400$
00399$:
	bit	7, d
	jr	Z, 00400$
	scf
00400$:
	jr	NC, 00111$
;src/main.c:599: if (enemies[i].x < playerDrawX) {
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
;src/main.c:600: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;src/main.c:599: if (enemies[i].x < playerDrawX) {
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
	jr	Z, 00401$
	bit	7, d
	jr	NZ, 00402$
	cp	a, a
	jr	00402$
00401$:
	bit	7, d
	jr	Z, 00402$
	scf
00402$:
	jr	NC, 00104$
;src/main.c:600: enemies[i].xSpeed += enemies[i].accel;
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
;src/main.c:603: enemies[i].xSpeed -= enemies[i].accel;
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
;src/main.c:607: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00403$
	bit	7, d
	jr	NZ, 00404$
	cp	a, a
	jr	00404$
00403$:
	bit	7, d
	jr	Z, 00404$
	scf
00404$:
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
;src/main.c:608: if (enemies[i].xSpeed < 0) enemies[i].xSpeed++;
	bit	7, c
	jr	Z, 00112$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00112$:
;src/main.c:611: if (abs(enemies[i].y - playerDrawY) > 8) {
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, l
	jr	NZ, 00174$
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	jr	00176$
00174$:
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, l
	ld	e, a
	ldhl	sp,	#14
	ld	(hl), e
;src/main.c:611: if (abs(enemies[i].y - playerDrawY) > 8) {
00176$:
;src/main.c:613: enemies[i].ySpeed += enemies[i].accel;
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
;src/main.c:620: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/main.c:611: if (abs(enemies[i].y - playerDrawY) > 8) {
	ldhl	sp,	#14
	ld	e, (hl)
	ld	a,#0x08
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00405$
	bit	7, d
	jr	NZ, 00406$
	cp	a, a
	jr	00406$
00405$:
	bit	7, d
	jr	Z, 00406$
	scf
00406$:
	jr	NC, 00121$
;src/main.c:612: if (enemies[i].y < playerDrawY) {
	ld	a, (#_playerDrawY)
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:600: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
;src/main.c:612: if (enemies[i].y < playerDrawY) {
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
	jr	Z, 00407$
	bit	7, d
	jr	NZ, 00408$
	cp	a, a
	jr	00408$
00407$:
	bit	7, d
	jr	Z, 00408$
	scf
00408$:
	jr	NC, 00114$
;src/main.c:613: enemies[i].ySpeed += enemies[i].accel;
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
;src/main.c:616: enemies[i].ySpeed -= enemies[i].accel;
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
;src/main.c:620: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
	ldhl	sp,	#11
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00409$
	bit	7, d
	jr	NZ, 00410$
	cp	a, a
	jr	00410$
00409$:
	bit	7, d
	jr	Z, 00410$
	scf
00410$:
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
;src/main.c:621: if (enemies[i].ySpeed < 0) enemies[i].ySpeed++;
	bit	7, c
	jr	Z, 00122$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00122$:
;src/main.c:625: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
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
;src/main.c:370: return (value < min) ? min : (value > max) ? max : value;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00411$
	bit	7, d
	jr	NZ, 00412$
	cp	a, a
	jr	00412$
00411$:
	bit	7, d
	jr	Z, 00412$
	scf
00412$:
	jr	NC, 00200$
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	(hl), a
	jr	00201$
00200$:
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	bit	7, e
	jr	Z, 00413$
	bit	7, d
	jr	NZ, 00414$
	cp	a, a
	jr	00414$
00413$:
	bit	7, d
	jr	Z, 00414$
	scf
00414$:
	jr	NC, 00202$
	ldhl	sp,	#12
	ld	e, (hl)
	jr	00203$
00202$:
	ldhl	sp,	#14
	ld	e, (hl)
00203$:
	ldhl	sp,	#14
	ld	(hl), e
00201$:
	ldhl	sp,	#14
	ld	c, (hl)
;src/main.c:625: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:626: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
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
;src/main.c:370: return (value < min) ? min : (value > max) ? max : value;
	ld	e, b
	ld	a,l
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00415$
	bit	7, d
	jr	NZ, 00416$
	cp	a, a
	jr	00416$
00415$:
	bit	7, d
	jr	Z, 00416$
	scf
00416$:
	jr	NC, 00204$
	ld	c, b
	jr	00205$
00204$:
	ld	e, l
	ld	a,c
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00417$
	bit	7, d
	jr	NZ, 00418$
	cp	a, a
	jr	00418$
00417$:
	bit	7, d
	jr	Z, 00418$
	scf
00418$:
	jr	C, 00207$
	ld	c, l
00207$:
00205$:
;src/main.c:626: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:629: enemies[i].xReserve += enemies[i].xSpeed;
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
;src/main.c:630: enemies[i].yReserve += enemies[i].ySpeed;
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
;src/main.c:634: if (enemies[i].xReserve >> 3 > 0) {
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
	jr	Z, 00419$
	bit	7, d
	jr	NZ, 00420$
	cp	a, a
	jr	00420$
00419$:
	bit	7, d
	jr	Z, 00420$
	scf
00420$:
	jr	NC, 00126$
;src/main.c:635: int8_t xMovement = enemies[i].xReserve >> 3;
	ldhl	sp,	#14
	ld	a, (hl)
	sra	a
	sra	a
	sra	a
	ld	(hl), a
;src/main.c:636: enemies[i].x += xMovement;
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
;src/main.c:637: enemies[i].xReserve -=  xMovement << 3;
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
;src/main.c:640: else if ((-enemies[i].xReserve) >> 3 > 0){
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
	jr	Z, 00421$
	bit	7, d
	jr	NZ, 00422$
	cp	a, a
	jr	00422$
00421$:
	bit	7, d
	jr	Z, 00422$
	scf
00422$:
	jr	NC, 00127$
;src/main.c:641: int8_t xMovement = -((-enemies[i].xReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#14
	ld	(hl), c
;src/main.c:642: enemies[i].x += xMovement;
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
;src/main.c:643: enemies[i].xReserve +=  (-xMovement) << 3;
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
;src/main.c:630: enemies[i].yReserve += enemies[i].ySpeed;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
;src/main.c:646: if (enemies[i].yReserve >> 3 > 0) {
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
	jr	Z, 00423$
	bit	7, d
	jr	NZ, 00424$
	cp	a, a
	jr	00424$
00423$:
	bit	7, d
	jr	Z, 00424$
	scf
00424$:
	jr	NC, 00131$
;src/main.c:647: int8_t yMovement = enemies[i].yReserve >> 3;
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;src/main.c:648: enemies[i].y += yMovement;
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
;src/main.c:649: enemies[i].yReserve -=  yMovement << 3;
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
;src/main.c:651: else if ((-enemies[i].yReserve) >> 3 > 0){
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
	jr	Z, 00425$
	bit	7, d
	jr	NZ, 00426$
	cp	a, a
	jr	00426$
00425$:
	bit	7, d
	jr	Z, 00426$
	scf
00426$:
	jr	NC, 00132$
;src/main.c:652: int8_t yMovement = -((-enemies[i].yReserve) >> 3);
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	c, a
	xor	a, a
	sub	a, c
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;src/main.c:653: enemies[i].y += yMovement;
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
;src/main.c:654: enemies[i].yReserve +=  (-yMovement) << 3;
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
;src/main.c:659: if (auxTick == 1) {
	ld	a, (#_auxTick)
	dec	a
	jp	NZ,00144$
;src/main.c:661: if (enemies[i].spriteCount == 1) {
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
;src/main.c:662: move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
	ldhl	sp,	#15
	ld	a, (hl-)
	add	a, a
	ld	c, a
	add	a, #0x0a
	ld	(hl), a
;src/main.c:661: if (enemies[i].spriteCount == 1) {
	dec	b
	jr	NZ, 00140$
;src/main.c:662: move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
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
;src/main.c:663: if (enemies[i].xSpeed >= 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	bit	7,a
	jr	NZ, 00134$
;src/main.c:664: set_sprite_prop(10+(i<<1), 0);
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
;src/main.c:664: set_sprite_prop(10+(i<<1), 0);
	jp	00144$
00134$:
;src/main.c:667: set_sprite_prop(10+(i<<1), S_FLIPX);
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
;src/main.c:667: set_sprite_prop(10+(i<<1), S_FLIPX);
	jp	00144$
00140$:
;src/main.c:672: if (enemies[i].xSpeed >= 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	bit	7,a
	jr	NZ, 00137$
;src/main.c:673: set_sprite_prop(10+(i<<1), 0);
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
;src/main.c:674: set_sprite_prop(10+(i<<1)+1, 0);
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
;src/main.c:675: move_sprite(10+ (i<<1), enemies[i].x , enemies[i].y + 8);
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
;src/main.c:676: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
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
;src/main.c:676: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
	jr	00144$
00137$:
;src/main.c:679: set_sprite_prop(10+(i<<1), S_FLIPX);
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
;src/main.c:680: set_sprite_prop(10+(i<<1)+1, S_FLIPX);
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
;src/main.c:681: move_sprite(10+ (i<<1), enemies[i].x +8, enemies[i].y + 8);
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
;src/main.c:682: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
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
;src/main.c:682: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
00144$:
;src/main.c:590: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	inc	(hl)
	jp	00197$
00145$:
;src/main.c:692: uint8_t i = enemyCollisionCount;
	ld	a, (#_enemyCollisionCount)
	ldhl	sp,	#1
	ld	(hl), a
;src/main.c:694: if (enemies[i].alive) {
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
	jp	Z, 00198$
;src/main.c:695: if (enemies[i].visible == 1) {
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
;src/main.c:696: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
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
;src/main.c:698: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#1
	ld	e, (hl)
;src/main.c:696: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#12
;src/main.c:698: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl+), a
	ld	a, e
	add	a, a
;src/main.c:696: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	rlca
	and	a,#0x01
;src/main.c:698: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	add	a, #0x0a
	ld	(hl), a
;src/main.c:695: if (enemies[i].visible == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	NZ, 00165$
;src/main.c:696: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jr	NZ, 00146$
	ldhl	sp,	#11
	ld	a, #0xac
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00433$
	bit	7, d
	jr	NZ, 00434$
	cp	a, a
	jr	00434$
00433$:
	bit	7, d
	jr	Z, 00434$
	scf
00434$:
	jr	C, 00146$
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
	jr	NZ, 00146$
	ld	e, h
	ld	d, #0x00
	ld	a, #0x98
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00435$
	bit	7, d
	jr	NZ, 00436$
	cp	a, a
	jr	00436$
00435$:
	bit	7, d
	jr	Z, 00436$
	scf
00436$:
	jp	NC, 00198$
00146$:
;src/main.c:697: enemies[i].visible = 0;
	xor	a, a
	ld	(bc), a
;src/main.c:698: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:699: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:699: set_sprite_tile(10+(i<<1)+1, 0x7f);
	jp	00198$
00165$:
;src/main.c:703: if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
	ldhl	sp,	#14
	bit	0, (hl)
	jp	NZ, 00159$
	ldhl	sp,	#11
	ld	a, (hl+)
	sub	a, #0xac
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00437$
	bit	7, d
	jr	NZ, 00438$
	cp	a, a
	jr	00438$
00437$:
	bit	7, d
	jr	Z, 00438$
	scf
00438$:
	jp	NC, 00159$
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
	jp	NC, 00159$
	ld	a, l
	sub	a, #0x98
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00159$
;src/main.c:704: enemies[i].visible = 1;
	ld	a, #0x01
	ld	(bc), a
;src/main.c:705: set_sprite_tile(10+(i<<1), enemies[i].sprite0);
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
00441$:
	ldhl	sp,	#11
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00441$
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
;src/main.c:706: if (enemies[i].spriteCount == 2) {
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
	jp	NZ,00198$
;src/main.c:707: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
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
00444$:
	ldhl	sp,	#13
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00444$
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
;src/main.c:707: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
	jp	00198$
00159$:
;src/main.c:710: else if (enemies[i].x < -100 || enemies[i].x > 272 || enemies[i].y < -100 || enemies[i].y > 252) {
	ldhl	sp,	#7
	ld	a, (hl+)
	sub	a, #0x9c
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
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
	jr	C, 00153$
	ldhl	sp,	#11
	ld	a, #0x10
	sub	a, (hl)
	inc	hl
	ld	a, #0x01
	sbc	a, (hl)
	ld	a, #0x01
	ld	d, a
	bit	7, (hl)
	jr	Z, 00447$
	bit	7, d
	jr	NZ, 00448$
	cp	a, a
	jr	00448$
00447$:
	bit	7, d
	jr	Z, 00448$
	scf
00448$:
	jr	C, 00153$
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
	jr	C, 00153$
	ld	e, b
	ld	d, #0x00
	ld	a, #0xfc
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
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
	jp	NC, 00198$
00153$:
;src/main.c:711: enemies[i].alive = 0;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:712: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#15
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00451$:
	ldhl	sp,	#14
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00451$
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
;src/main.c:713: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
00452$:
	ldhl	sp,	#14
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00452$
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
;src/main.c:714: initEnemy(i);
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00198$:
;src/main.c:720: }
	add	sp, #16
	ret
;src/main.c:723: void move() {
;	---------------------------------
; Function move
; ---------------------------------
_move::
	add	sp, #-4
;src/main.c:726: if (joydata & J_A) {
	ld	a, (#_joydata)
	bit	4, a
	jr	Z, 00102$
;src/main.c:727: xSpeed += xDir + xDir + xDir;
	ld	hl, #_xDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_xSpeed
	add	a, (hl)
	ld	(hl), a
;src/main.c:728: ySpeed += yDir + yDir + yDir;
	ld	hl, #_yDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_ySpeed
	add	a, (hl)
	ld	(hl), a
00102$:
;src/main.c:732: xSpeed = clamp(xSpeed, -100, 100);
	ld	hl, #_xSpeed
	ld	c, (hl)
;src/main.c:370: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:733: ySpeed = clamp(ySpeed, -100, 100);
	ld	hl, #_ySpeed
	ld	c, (hl)
;src/main.c:370: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:735: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:736: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:741: uint8_t xCollisionPoint = playerDrawX; 
	ld	hl, #_playerDrawX
	ld	c, (hl)
;src/main.c:744: xCollisionPoint = playerDrawX +8; //right edge
	ld	b, (hl)
;src/main.c:743: if (xSpeed > 0) {
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
;src/main.c:744: xCollisionPoint = playerDrawX +8; //right edge
	ld	a, b
	add	a, #0x08
	ld	c, a
00104$:
;src/main.c:746: if (xSpeed < 0) {
	ld	a, (#_xSpeed)
	bit	7, a
	jr	Z, 00106$
;src/main.c:747: xCollisionPoint = playerDrawX -8; //left edge
	ld	a, b
	add	a, #0xf8
	ld	c, a
00106$:
;src/main.c:751: int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;
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
;src/main.c:755: uint8_t bgindY = ((playerDrawY + bgY) >> 3)%32; 
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
;src/main.c:758: uint16_t ind = 32*bgindY + bgindX;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, l
	ld	b, h
;src/main.c:759: uint8_t result = 1; // 0 incase of clear path, 1 for blocked
	ldhl	sp,	#0
	ld	(hl), #0x01
;src/main.c:760: for (uint8_t i=0; i<BLANKSIZE; i++) {
	ldhl	sp,	#3
	ld	(hl), #0x00
00158$:
	ld	a, (#_BLANKSIZE)
	ldhl	sp,	#1
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	jr	NC, 00109$
;src/main.c:761: if ((*(collisionTiles+ind)) == BLANK[i] ) {
	ld	a, c
	ld	hl, #_collisionTiles
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, b
	adc	a, (hl)
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	de, #_BLANK
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00159$
;src/main.c:762: result = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;src/main.c:763: break;
	jr	00109$
00159$:
;src/main.c:760: for (uint8_t i=0; i<BLANKSIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00158$
00109$:
;src/main.c:767: if (result == 0) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	NZ, 00114$
;src/main.c:768: playerX+=xSpeed;
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
;src/main.c:770: uint16_t limitedPlayerX = u16Clamp(playerX, 68<<5, 92<<5);//0->160, with 8 px margin for left edge & 50px for the edges
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
;src/main.c:772: xOverflow = (playerX - limitedPlayerX);
	ld	a, (#_playerX)
	sub	a, e
	ld	(#_xOverflow),a
	ld	a, (#_playerX + 1)
	sbc	a, d
	ld	hl, #_xOverflow + 1
;src/main.c:773: if (xOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_xOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00111$
;src/main.c:774: xOverflow = xOverflow >> 5;
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
;src/main.c:777: xOverflow = -((-xOverflow) >> 5);
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
;src/main.c:779: bgX += xOverflow;
	ld	a, (#_bgX)
	ld	hl, #_xOverflow
	add	a, (hl)
	ld	hl, #_bgX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_xOverflow + 1
	adc	a, (hl)
	ld	(#_bgX + 1),a
;src/main.c:780: playerX = limitedPlayerX;
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;src/main.c:781: playerDrawX=playerX >> 5;
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
;src/main.c:789: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
00115$:
;src/main.c:797: uint8_t yCollisionPoint = playerDrawY; 
	ld	hl, #_playerDrawY
	ld	c, (hl)
;src/main.c:800: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	b, (hl)
;src/main.c:799: if (ySpeed > 0) {
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
;src/main.c:800: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, b
	add	a, #0x08
	ld	c, a
00117$:
;src/main.c:802: if (ySpeed < 0) {
	ld	a, (#_ySpeed)
	bit	7, a
	jr	Z, 00119$
;src/main.c:803: yCollisionPoint = playerDrawY -8; //top edge, 
	ld	a, b
	add	a, #0xf8
	ld	c, a
00119$:
;src/main.c:807: bgindX = ((playerDrawX + bgX) >> 3)%32;
	ld	hl, #_playerDrawX
	ld	e, (hl)
	ld	d, #0x00
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
;src/main.c:810: bgindY = ((yCollisionPoint + bgY) >> 3)%32; 
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
;src/main.c:813: ind = 32*bgindY + bgindX;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/main.c:814: result = 1;
;src/main.c:815: for (uint8_t j=0; j<BLANKSIZE; j++) {
	ld	de, #0x1
00161$:
	ld	a, d
	ldhl	sp,	#1
	sub	a, (hl)
	jr	NC, 00122$
;src/main.c:816: if ((*(collisionTiles+ind)) == BLANK[j] ) {
	push	de
	ld	hl, #_collisionTiles
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	a, #<(_BLANK)
	add	a, d
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_BLANK)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	b, (hl)
	ld	a, c
;src/main.c:817: result = 0;
	sub	a,b
	jr	NZ, 00162$
	ld	e,a
;src/main.c:818: break;
	jr	00122$
00162$:
;src/main.c:815: for (uint8_t j=0; j<BLANKSIZE; j++) {
	inc	d
	jr	00161$
00122$:
;src/main.c:822: if (result == 0) {
	ld	a, e
	or	a, a
	jp	NZ, 00127$
;src/main.c:823: playerY += ySpeed;
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
;src/main.c:825: uint16_t limitedPlayerY = u16Clamp(playerY, 48<<5, 78<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
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
;src/main.c:827: yOverflow = (playerY - limitedPlayerY);
	ld	a, (#_playerY)
	sub	a, e
	ld	(#_yOverflow),a
	ld	a, (#_playerY + 1)
	sbc	a, d
	ld	hl, #_yOverflow + 1
;src/main.c:828: if (yOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_yOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00124$
;src/main.c:829: yOverflow = yOverflow >> 5;
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
;src/main.c:832: yOverflow = -((-yOverflow) >> 5);
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
;src/main.c:834: bgY += yOverflow;
	ld	a, (#_bgY)
	ld	hl, #_yOverflow
	add	a, (hl)
	ld	hl, #_bgY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_yOverflow + 1
	adc	a, (hl)
	ld	(#_bgY + 1),a
;src/main.c:835: playerY = limitedPlayerY;
	ld	hl, #_playerY
	ld	a, c
	ld	(hl+), a
;src/main.c:836: playerDrawY=playerY >> 5;
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
;src/main.c:841: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
00128$:
;src/main.c:741: uint8_t xCollisionPoint = playerDrawX; 
	ld	a, (#_playerDrawX)
	ldhl	sp,	#3
	ld	(hl), a
;src/main.c:800: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, (#_playerDrawY)
	add	a, #0x08
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:844: if (xDir >= 0) {
	ld	a, (#_xDir)
	bit	7, a
	jr	NZ, 00130$
;src/main.c:845: move_sprite(0, playerDrawX , playerDrawY + 8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	de, #_shadow_OAM
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 1)
	ld	a, (hl)
	ld	(de), a
;src/main.c:847: move_sprite(1, playerDrawX +8, playerDrawY +8);
	ld	a, (#_playerDrawY)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0x08
	ld	(hl), a
	ld	a, (#_playerDrawX)
	add	a, #0x08
	ldhl	sp,	#3
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #(_shadow_OAM + 4)
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 5)
	ld	a, (hl)
	ld	(de), a
;src/main.c:847: move_sprite(1, playerDrawX +8, playerDrawY +8);
	jr	00131$
00130$:
;src/main.c:850: move_sprite(1, playerDrawX , playerDrawY +8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 4)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/main.c:852: move_sprite(0, playerDrawX +8, playerDrawY +8);
	ld	a, (#_playerDrawY)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0x08
	ld	(hl), a
	ld	a, (#_playerDrawX)
	ldhl	sp,	#3
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
;src/main.c:852: move_sprite(0, playerDrawX +8, playerDrawY +8);
00131$:
;src/main.c:857: if (bgX >= 256) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00133$
;src/main.c:858: bgX = bgX % 256;
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
;src/main.c:860: if (bgX < 0) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00135$
;src/main.c:861: bgX = 255 - (bgX % 256);
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
;src/main.c:863: if (bgY >= 256) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00137$
;src/main.c:864: bgY = bgY % 256;
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
;src/main.c:866: if (bgY < 0) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00139$
;src/main.c:867: bgY = 255 - (bgY % 256);
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
;src/main.c:870: move_bkg(bgX, bgY);
	ld	hl, #_bgY
	ld	c, (hl)
	ld	a, (#_bgX)
	ldh	(_SCX_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/main.c:873: if (ySpeed > 0) ySpeed--;
	ld	hl, #_ySpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00354$
	bit	7, d
	jr	NZ, 00355$
	cp	a, a
	jr	00355$
00354$:
	bit	7, d
	jr	Z, 00355$
	scf
00355$:
	jr	NC, 00141$
	ld	hl, #_ySpeed
	dec	(hl)
00141$:
;src/main.c:874: if (ySpeed < 0) ySpeed++;
	ld	hl, #_ySpeed
	bit	7, (hl)
	jr	Z, 00143$
	inc	(hl)
00143$:
;src/main.c:875: if (xSpeed > 0) xSpeed--;
	ld	hl, #_xSpeed
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00356$
	bit	7, d
	jr	NZ, 00357$
	cp	a, a
	jr	00357$
00356$:
	bit	7, d
	jr	Z, 00357$
	scf
00357$:
	jr	NC, 00145$
	ld	hl, #_xSpeed
	dec	(hl)
00145$:
;src/main.c:876: if (xSpeed < 0) xSpeed++;
	ld	hl, #_xSpeed
	bit	7, (hl)
	jr	Z, 00163$
	inc	(hl)
00163$:
;src/main.c:880: }
	add	sp, #4
	ret
;src/main.c:883: void takeDamage(int16_t amount) {
;	---------------------------------
; Function takeDamage
; ---------------------------------
_takeDamage::
	dec	sp
;src/main.c:884: if (amount > shield) {
	ld	a, (#_shield)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
;src/main.c:886: hull -= (amount - shield);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/main.c:884: if (amount > shield) {
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
;src/main.c:885: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;src/main.c:886: hull -= (amount - shield);
	ld	a, (#_hull)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_hull),a
	jr	00104$
00102$:
;src/main.c:889: shield -= amount;
	ld	a, (#_shield)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_shield),a
00104$:
;src/main.c:891: }
	inc	sp
	ret
;src/main.c:894: void spawnPickup(int16_t x, int16_t y) {
;	---------------------------------
; Function spawnPickup
; ---------------------------------
_spawnPickup::
;src/main.c:895: uint8_t spawn = ((uint8_t)rand()) % (uint8_t) 8;
	call	_rand
	ld	a, e
	and	a, #0x07
	ret	NZ
;src/main.c:896: if (spawn == 0) {
;src/main.c:897: uint8_t type = ((uint8_t)rand()) % (uint8_t) 3;
	call	_rand
	ld	a, e
	ld	h, #0x03
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	__moduchar
	pop	hl
;src/main.c:898: if (type == 0) {
	ld	a,e
	ld	c,a
	or	a, a
	jr	NZ, 00106$
;src/main.c:899: pickup = health;
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
;src/main.c:901: else if (type == 1 && gunLevel < MAXGUNLEVEL) {
	dec	c
	jr	NZ, 00102$
	ld	hl, #_MAXGUNLEVEL
	ld	c, (hl)
	ld	a, (#_gunLevel)
	sub	a, c
	jr	NC, 00102$
;src/main.c:902: pickup = upgrade;
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
;src/main.c:905: pickup = ammo;
	ld	bc, #_pickup
	ld	de, #0x0009
	push	de
	ld	de, #_ammo
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
00107$:
;src/main.c:907: pickup.active = 1;
	ld	hl, #(_pickup + 5)
	ld	(hl), #0x01
;src/main.c:909: pickup.x = x;
	ld	de, #(_pickup + 1)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/main.c:910: pickup.y = y;
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_pickup + 3)
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:912: set_sprite_tile(3, pickup.tile); //0x7f
	ld	hl, #(_pickup + 8)
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;src/main.c:912: set_sprite_tile(3, pickup.tile); //0x7f
;src/main.c:915: }
	ret
;src/main.c:918: void killEnemy(uint8_t i) {
;	---------------------------------
; Function killEnemy
; ---------------------------------
_killEnemy::
	add	sp, #-4
;src/main.c:919: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:920: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:922: spawnPickup(enemies[i].x, enemies[i].y);
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
;src/main.c:924: enemies[i].alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:925: enemies[i].visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:927: incrementScore();
	call	_incrementScore
;src/main.c:928: updateScore();
	call	_updateScore
;src/main.c:930: explosions[oldestEx].visible = 1;
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
;src/main.c:931: explosions[oldestEx].x = enemies[i].x;
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
;src/main.c:932: explosions[oldestEx].y = enemies[i].y;
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
;src/main.c:935: uint8_t tileNum = ((uint8_t)rand()) % exTileCount;
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
;src/main.c:937: explosions[oldestEx].tile = exTiles[tileNum];
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
;src/main.c:938: explosions[oldestEx].frame = 0;
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
;src/main.c:939: explosions[oldestEx].frameCounter = 0;
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
;src/main.c:941: set_sprite_tile(20 + oldestEx+oldestEx, explosions[oldestEx].tile + (explosions[oldestEx].frame<<1));
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
	ld	hl, #_oldestEx
	ld	b, (hl)
	ld	a, b
	add	a, #0x14
	add	a, b
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
;src/main.c:942: set_sprite_tile(21 + oldestEx+oldestEx, explosions[oldestEx].tile+(explosions[oldestEx].frame<<1) +2);
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
	ld	hl, #_oldestEx
	ld	b, (hl)
	ld	a, b
	add	a, #0x15
	add	a, b
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
;src/main.c:947: oldestEx++;
	ld	hl, #_oldestEx
	inc	(hl)
;src/main.c:948: if (oldestEx >= exCount) {
	ld	hl, #_exCount
	ld	c, (hl)
	ld	hl, #_oldestEx
	ld	a, (hl)
	sub	a, c
	jr	C, 00107$
;src/main.c:949: oldestEx = 0;
	ld	(hl), #0x00
00107$:
;src/main.c:952: }
	add	sp, #4
	ret
;src/main.c:956: void checkCollision() {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-23
;src/main.c:963: struct Enemy *eptr = enemies + enemyCollisionCount;
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
;src/main.c:964: uint8_t i = enemyCollisionCount;
	ld	a, (#_enemyCollisionCount)
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:966: if (eptr->visible && eptr->alive) {
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
;src/main.c:968: uint8_t alive = 1;
	ldhl	sp,	#18
	ld	(hl), #0x01
;src/main.c:971: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
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
;src/main.c:972: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00352$
	xor	a, a
00352$:
	ldhl	sp,	#21
;src/main.c:971: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00147$
;src/main.c:386: else return - value;
	xor	a, a
	ldhl	sp,	#22
	sub	a, (hl)
	ld	c, a
	ld	(hl), c
;src/main.c:971: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
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
;src/main.c:972: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, c
	jr	NZ, 00149$
	ld	b, c
	jr	00151$
00149$:
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, c
	ld	b, a
;src/main.c:972: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
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
;src/main.c:973: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00155$
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:973: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
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
;src/main.c:974: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	jp	Z, 00107$
	inc	hl
	ld	a, (bc)
	sub	a, (hl)
	ld	c, a
;src/main.c:385: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00159$
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:974: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
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
;src/main.c:976: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:977: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:978: eptr->alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:979: eptr->visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:980: takeDamage(eptr->damage);
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
;src/main.c:981: initEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
;src/main.c:982: playSound(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:984: alive = 0;
	ldhl	sp,	#18
	ld	(hl), #0x00
00107$:
;src/main.c:990: if (alive) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00139$
;src/main.c:991: struct Projectile *pptr = projectiles;
	inc	hl
	ld	a, #<(_projectiles)
	ld	(hl+), a
	ld	(hl), #>(_projectiles)
;src/main.c:993: while (j < PROJECTILECOUNT) {
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
;src/main.c:994: if (pptr->active) {
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
;src/main.c:996: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
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
;src/main.c:997: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00364$
	xor	a, a
00364$:
	ldhl	sp,	#18
;src/main.c:996: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00165$
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:996: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
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
;src/main.c:997: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, (hl)
	jr	NZ, 00167$
	ld	c, (hl)
	jr	00169$
00167$:
;src/main.c:386: else return - value;
	xor	a, a
	ldhl	sp,	#22
	sub	a, (hl)
	ld	c, a
;src/main.c:997: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
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
;src/main.c:998: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00173$
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:998: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
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
;src/main.c:999: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
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
;src/main.c:385: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00177$
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:999: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
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
;src/main.c:1001: set_sprite_tile(30+j, 0x7f);
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
;src/main.c:1002: pptr->active = 0;
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
;src/main.c:1004: if (pptr->type == 0x2c) { //missile
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
;src/main.c:1009: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
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
;src/main.c:1004: if (pptr->type == 0x2c) { //missile
	ld	a, e
	sub	a, #0x2c
	jp	NZ,00119$
;src/main.c:1005: playSound(2);
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
;src/main.c:1009: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
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
;src/main.c:1010: int16_t dmgDropOff = ((i16abs(eptr->x - enemies[k].x) + i16abs(eptr->y - enemies[k].y))<<SPLASHDROPOFF);
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
;src/main.c:1011: int16_t dmg = pptr->damage - dmgDropOff;
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
;src/main.c:1012: if (dmg > 0) {
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
;src/main.c:1013: enemies[k].hp -= dmg;
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
;src/main.c:1014: if (enemies[k].hp <= 0) {
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
;src/main.c:1015: killEnemy(k);
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	call	_killEnemy
	inc	sp
;src/main.c:1016: initEnemy(k);
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00189$:
;src/main.c:1009: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
	ldhl	sp,	#22
	inc	(hl)
	jp	00188$
00119$:
;src/main.c:1024: eptr->hp -= pptr->damage;
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
;src/main.c:1026: if (eptr->hp <= 0) {
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
;src/main.c:1027: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1028: killEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_killEnemy
	inc	sp
;src/main.c:1029: initEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00132$:
;src/main.c:1041: j++;
	ldhl	sp,	#21
	inc	(hl)
;src/main.c:1042: pptr++;
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
;src/main.c:1048: if (enemyCollisionCount == 0) {
	ld	a, (#_enemyCollisionCount)
	or	a, a
	jr	NZ, 00142$
;src/main.c:1049: enemyCollisionCount = ENEMYCOUNT - 1;
	ld	a, (#_ENEMYCOUNT)
	dec	a
	ld	(#_enemyCollisionCount),a
	jr	00190$
00142$:
;src/main.c:1052: enemyCollisionCount--;
	ld	hl, #_enemyCollisionCount
	dec	(hl)
00190$:
;src/main.c:1057: }
	add	sp, #23
	ret
;src/main.c:1060: void setGunIcon() {
;	---------------------------------
; Function setGunIcon
; ---------------------------------
_setGunIcon::
;src/main.c:1062: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00102$
;src/main.c:1063: set_win_tiles(15, 0,1,1,gunMap+gunLevel);
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
;src/main.c:1066: set_win_tiles(15, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1068: }
	ret
;src/main.c:1080: void fire() {
;	---------------------------------
; Function fire
; ---------------------------------
_fire::
	add	sp, #-5
;src/main.c:1082: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	inc	(hl)
	ld	a, (hl)
;src/main.c:1083: if (oldestProjectile >= PROJECTILECOUNT) {
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ld	hl, #_oldestProjectile
	ld	a, (hl)
	sub	a, c
	jr	C, 00102$
;src/main.c:1084: oldestProjectile = 0;
	ld	(hl), #0x00
00102$:
;src/main.c:1089: projectiles[oldestProjectile] = singleGun;
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
;src/main.c:1087: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00113$
;src/main.c:1088: if (gunLevel == 0) {
	ld	a, (#_gunLevel)
	or	a, a
	jr	NZ, 00104$
;src/main.c:1089: projectiles[oldestProjectile] = singleGun;
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
;src/main.c:1090: playSound(20);
	ld	a, #0x14
	push	af
	inc	sp
	call	_playSound
	inc	sp
	jr	00114$
00104$:
;src/main.c:1093: projectiles[oldestProjectile] = doubleGun;
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
;src/main.c:1094: playSound(21);
	ld	a, #0x15
	push	af
	inc	sp
	call	_playSound
	inc	sp
	jr	00114$
00113$:
;src/main.c:1097: else if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00114$
;src/main.c:1098: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00107$
;src/main.c:1099: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:1100: setGunIcon();
	call	_setGunIcon
;src/main.c:1101: return;
	jp	00155$
00107$:
;src/main.c:1104: projectiles[oldestProjectile] = missile;
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
;src/main.c:1105: updateMissileCount(-1);
	ld	a, #0xff
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:1106: playSound(22);
	ld	a, #0x16
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1108: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00114$
;src/main.c:1109: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:1110: setGunIcon();
	call	_setGunIcon
00114$:
;src/main.c:1113: projectiles[oldestProjectile].x = playerDrawX;
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
;src/main.c:1114: projectiles[oldestProjectile].y = playerDrawY;
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
;src/main.c:1115: projectiles[oldestProjectile].xSpeed = xDir * projectiles[oldestProjectile].speed;
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
;src/main.c:1116: projectiles[oldestProjectile].ySpeed = yDir * projectiles[oldestProjectile].speed;
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
;src/main.c:1082: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1089: projectiles[oldestProjectile] = singleGun;
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
;src/main.c:1121: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
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
;src/main.c:1120: if (yDir != 0 && xDir == 0) {
	ld	a, (#_yDir)
	or	a, a
	jr	Z, 00141$
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00141$
;src/main.c:1121: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
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
;src/main.c:1082: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
;src/main.c:1121: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	add	a, #0x1e
	ld	c, a
;src/main.c:1122: if (yDir == 1) {
	ld	a, (#_yDir)
;src/main.c:1123: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
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
;src/main.c:1124: projectiles[oldestProjectile].offset = 4;
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
;src/main.c:1127: set_sprite_prop(30+oldestProjectile, 0); 
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
;src/main.c:1128: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1132: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
;src/main.c:1131: else if (xDir != 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jp	Z, 00137$
	ld	a, (#_yDir)
	or	a, a
	jp	NZ, 00137$
;src/main.c:1132: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
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
;src/main.c:1082: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1121: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	a, (hl)
	add	a, #0x1e
	ld	(hl), a
;src/main.c:1133: if (xDir == 1) {
	ld	a, (#_xDir)
	dec	a
	jr	NZ, 00119$
;src/main.c:1134: set_sprite_prop(30+oldestProjectile, 0);
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
;src/main.c:1135: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1138: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
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
;src/main.c:1139: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1143: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+4);
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
;src/main.c:1144: if (xDir == 1 && yDir == -1) {
	ld	a, (#_xDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00268$
	xor	a, a
00268$:
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1082: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
;src/main.c:1144: if (xDir == 1 && yDir == -1) {
	ld	a, (#_yDir)
	inc	a
	ld	a, #0x01
	jr	Z, 00270$
	xor	a, a
00270$:
	ldhl	sp,	#1
;src/main.c:1121: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	(hl+), a
	ld	a, c
	add	a, #0x1e
;src/main.c:1144: if (xDir == 1 && yDir == -1) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00133$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
;src/main.c:1145: set_sprite_prop(30+oldestProjectile, 0); //default is right & up
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
;src/main.c:1146: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1122: if (yDir == 1) {
	ld	a, (#_yDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00273$
	xor	a, a
00273$:
	ldhl	sp,	#3
;src/main.c:1148: else if (xDir == 1 && yDir == 1) {
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00129$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
;src/main.c:1149: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
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
;src/main.c:1150: projectiles[oldestProjectile].offset = 4;
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
;src/main.c:1152: else if (xDir == -1 && yDir == 1) {
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
;src/main.c:1153: set_sprite_prop(30+oldestProjectile, S_FLIPY | S_FLIPX);
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
;src/main.c:1154: projectiles[oldestProjectile].offset = 4;
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
;src/main.c:1156: else if (xDir == -1 && yDir == -1) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
;src/main.c:1157: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
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
;src/main.c:1158: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1162: fireCooldown = projectiles[oldestProjectile].delay;
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
;src/main.c:1168: }
	add	sp, #5
	ret
;src/main.c:1171: void moveProjectiles() {
;	---------------------------------
; Function moveProjectiles
; ---------------------------------
_moveProjectiles::
	add	sp, #-10
;src/main.c:1172: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#9
	ld	(hl), #0x00
00112$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, c
	jp	NC, 00114$
;src/main.c:1173: if (projectiles[i].active) {
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
;src/main.c:1174: projectiles[i].x -= xOverflow;
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
;src/main.c:1175: projectiles[i].y -= yOverflow;
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
;src/main.c:1177: int16_t newY = projectiles[i].y + projectiles[i].ySpeed;
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
;src/main.c:1178: int16_t newX = projectiles[i].x + projectiles[i].xSpeed;
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
;src/main.c:1181: projectiles[i].y = newY;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:1182: projectiles[i].x = newX;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/main.c:1186: move_sprite(30+i, newX +4 , newY + projectiles[i].offset);
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
;src/main.c:1190: if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
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
;src/main.c:1191: projectiles[i].active = 0;
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
;src/main.c:1192: set_sprite_tile(30+i, 0x7f);
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
;src/main.c:1192: set_sprite_tile(30+i, 0x7f);
00113$:
;src/main.c:1172: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#9
	inc	(hl)
	jp	00112$
00114$:
;src/main.c:1197: }
	add	sp, #10
	ret
;src/main.c:1200: void tickPickups() {
;	---------------------------------
; Function tickPickups
; ---------------------------------
_tickPickups::
	dec	sp
	dec	sp
;src/main.c:1202: if (pickup.active) {
	ld	a, (#(_pickup + 5) + 0)
	or	a, a
	jp	Z, 00144$
;src/main.c:1203: pickup.x -= xOverflow;
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
;src/main.c:1204: pickup.y -= yOverflow;
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
;src/main.c:1205: move_sprite(3, pickup.x + 4, pickup.y + 12);
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
;src/main.c:1206: if (pickup.visible && auxTick == 1) {
	ld	hl, #_pickup
	ld	c, (hl)
;src/main.c:1203: pickup.x -= xOverflow;
	ld	de, #(_pickup + 1)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/main.c:1206: if (pickup.visible && auxTick == 1) {
	ld	a, c
	or	a, a
	jp	Z, 00127$
	ld	a, (#_auxTick)
	dec	a
	jp	NZ,00127$
;src/main.c:1208: if (abs(pickup.x - playerDrawX) < 10) {
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:385: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00136$
;src/main.c:386: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:1208: if (abs(pickup.x - playerDrawX) < 10) {
00136$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8a
	jp	NC, 00115$
;src/main.c:1209: if (abs(pickup.y - playerDrawY) < 10) {
	ld	a, (#(_pickup + 3) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_playerDrawY
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/main.c:385: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00140$
;src/main.c:386: else return - value;
	xor	a, a
	ldhl	sp,	#1
	sub	a, (hl)
	ld	(hl), a
;src/main.c:1209: if (abs(pickup.y - playerDrawY) < 10) {
00140$:
	ldhl	sp,	#1
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00115$
;src/main.c:1210: playSound(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1211: if (pickup.type == 0) { //upgrade
	ld	a, (#(_pickup + 6) + 0)
	or	a, a
	jr	NZ, 00104$
;src/main.c:1212: if (gunLevel < 1) {
	ld	hl, #_gunLevel
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00104$
;src/main.c:1213: gunLevel += 1;
	inc	(hl)
	ld	a, (hl)
;src/main.c:1214: setGunIcon();
	call	_setGunIcon
00104$:
;src/main.c:1217: if (pickup.type == 1) { //missile ammo
	ld	hl, #(_pickup + 6)
	ld	l, (hl)
;	spillPairReg hl
;src/main.c:1218: updateMissileCount(pickup.amount);
	ld	bc, #_pickup + 7
;src/main.c:1217: if (pickup.type == 1) { //missile ammo
	dec	l
	jr	NZ, 00106$
;src/main.c:1218: updateMissileCount(pickup.amount);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
	pop	bc
00106$:
;src/main.c:1220: if (pickup.type == 2) {
	ld	a, (#(_pickup + 6) + 0)
	sub	a, #0x02
	jr	NZ, 00111$
;src/main.c:1221: if (hull + pickup.amount <= 100) {
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
;src/main.c:1222: hull += pickup.amount;
	ld	a, c
	ld	hl, #_hull
	add	a, (hl)
	ld	(hl), a
	jr	00111$
00108$:
;src/main.c:1225: hull = 100;
	ld	hl, #_hull
	ld	(hl), #0x64
00111$:
;src/main.c:1228: pickup.active = 0;
	ld	hl, #(_pickup + 5)
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1229: set_sprite_tile(3, 0x7f);
00115$:
;src/main.c:1203: pickup.x -= xOverflow;
	ld	hl, #(_pickup + 1)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1232: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
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
;src/main.c:1204: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1232: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
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
;src/main.c:1233: pickup.visible = 0;
	ld	hl, #_pickup
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1234: set_sprite_tile(3, 0x7f);
	jr	00144$
00127$:
;src/main.c:1238: if (pickup.x >= -10 && pickup.x <= 170 && pickup.y >= 0 && pickup.y <= 155) {
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
;src/main.c:1204: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1232: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
;src/main.c:1238: if (pickup.x >= -10 && pickup.x <= 170 && pickup.y >= 0 && pickup.y <= 155) {
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
;src/main.c:1239: pickup.visible = 1;
	ld	hl, #_pickup
	ld	(hl), #0x01
;src/main.c:1240: set_sprite_tile(3, pickup.tile);
	ld	hl, #(_pickup + 8)
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;src/main.c:1240: set_sprite_tile(3, pickup.tile);
00144$:
;src/main.c:1245: }
	inc	sp
	inc	sp
	ret
;src/main.c:1248: void tickEx() {
;	---------------------------------
; Function tickEx
; ---------------------------------
_tickEx::
	add	sp, #-12
;src/main.c:1249: for (uint8_t i = 0; i < exCount; ++i) {
	ldhl	sp,	#11
	ld	(hl), #0x00
00118$:
	ld	hl, #_exCount
	ld	c, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jp	NC, 00120$
;src/main.c:1250: if (explosions[i].visible) {
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
;src/main.c:1252: explosions[i].x -= xOverflow;
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
;src/main.c:1253: explosions[i].y -= yOverflow;
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
;src/main.c:1254: move_sprite(20 +i+i, explosions[i].x, explosions[i].y+8);
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
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x14
	add	a, (hl)
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
;src/main.c:1255: move_sprite(21 +i+i, explosions[i].x+8, explosions[i].y+8);
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
	ld	a, (hl)
	add	a, #0x15
	add	a, (hl)
	dec	hl
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
;src/main.c:1257: explosions[i].frameCounter++;
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
;src/main.c:1258: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jp	NZ, 00119$
;src/main.c:1259: if (explosions[i].frameCounter > EXPLFRAMETIME) {
	ld	a, (bc)
	ld	e, a
	ld	a, (#_EXPLFRAMETIME)
	sub	a, e
	jp	NC, 00119$
;src/main.c:1260: explosions[i].frameCounter = 0;
	xor	a, a
	ld	(bc), a
;src/main.c:1261: explosions[i].frame += 1; 
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
;src/main.c:1262: if (explosions[i].frame > 3) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x03
	sub	a, c
	jr	NC, 00102$
;src/main.c:1263: explosions[i].visible = 0;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:1264: set_sprite_tile(20 + i+i, 0x7f);
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
;src/main.c:1265: set_sprite_tile(21 + i+i, 0x7f);
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
;src/main.c:1265: set_sprite_tile(21 + i+i, 0x7f);
	jp	00119$
00102$:
;src/main.c:1268: set_sprite_tile(20 + i+i, explosions[i].tile + (explosions[i].frame *4));
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
;src/main.c:1269: set_sprite_tile(21 + i+i, explosions[i].tile+(explosions[i].frame *4) +2);
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
;src/main.c:1269: set_sprite_tile(21 + i+i, explosions[i].tile+(explosions[i].frame *4) +2);
00119$:
;src/main.c:1249: for (uint8_t i = 0; i < exCount; ++i) {
	ldhl	sp,	#11
	inc	(hl)
	jp	00118$
00120$:
;src/main.c:1275: }
	add	sp, #12
	ret
;src/main.c:1278: void initEnemyOptions() {
;	---------------------------------
; Function initEnemyOptions
; ---------------------------------
_initEnemyOptions::
;src/main.c:1279: enemyOptions[0] = minispike;
	ld	de, #0x0012
	push	de
	ld	de, #_minispike
	push	de
	ld	de, #_enemyOptions
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1280: enemyOptions[1] = minibomb;
	ld	de, #0x0012
	push	de
	ld	de, #_minibomb
	push	de
	ld	de, #(_enemyOptions + 18)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1281: enemyOptions[2] = miniship;
	ld	de, #0x0012
	push	de
	ld	de, #_miniship
	push	de
	ld	de, #(_enemyOptions + 36)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1282: enemyOptions[3] = minibubble;
	ld	de, #0x0012
	push	de
	ld	de, #_minibubble
	push	de
	ld	de, #(_enemyOptions + 54)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1284: enemyOptions[4] = minifighter;
	ld	de, #0x0012
	push	de
	ld	de, #_minifighter
	push	de
	ld	de, #(_enemyOptions + 72)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1285: enemyOptions[5] = shieldship;
	ld	de, #0x0012
	push	de
	ld	de, #_shieldship
	push	de
	ld	de, #(_enemyOptions + 90)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1286: enemyOptions[6] = owl;
	ld	de, #0x0012
	push	de
	ld	de, #_owl
	push	de
	ld	de, #(_enemyOptions + 108)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1287: enemyOptions[7] = calvine;
	ld	de, #0x0012
	push	de
	ld	de, #_calvine
	push	de
	ld	de, #(_enemyOptions + 126)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1288: enemyOptions[8] = xwing;
	ld	de, #0x0012
	push	de
	ld	de, #_xwing
	push	de
	ld	de, #(_enemyOptions + 144)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1289: enemyOptions[9] = destroyer;
	ld	de, #0x0012
	push	de
	ld	de, #_destroyer
	push	de
	ld	de, #(_enemyOptions + 162)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1290: enemyOptions[10] = doublefuse;
	ld	de, #0x0012
	push	de
	ld	de, #_doublefuse
	push	de
	ld	de, #(_enemyOptions + 180)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1292: }
	ret
;src/main.c:1295: void initProjectiles() {
;	---------------------------------
; Function initProjectiles
; ---------------------------------
_initProjectiles::
;src/main.c:1296: set_sprite_data(0x20, 17, ProjectileTiles); 
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1120
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:1298: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	xor	a, a
00103$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	cp	a, c
	ret	NC
	inc	a
;src/main.c:1302: }
	jr	00103$
;src/main.c:1305: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
	add	sp, #-9
;src/main.c:1306: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:1307: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1308: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;src/main.c:1311: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG + 0), a
;src/main.c:1312: LYC_REG = 0x7e; //line 126
	ld	a, #0x7e
	ldh	(_LYC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1314: add_LCD(interruptLCD);
	ld	de, #_interruptLCD
	push	de
	call	_add_LCD
	inc	sp
	inc	sp
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;src/main.c:1316: set_interrupts(VBL_IFLAG | LCD_IFLAG);   
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;src/main.c:1318: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:1319: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
;src/main.c:1320: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
;src/main.c:1321: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
;src/main.c:1325: playerX = 80<<5;
	ld	hl, #_playerX
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;src/main.c:1326: playerY = 70<<5;
	ld	hl, #_playerY
	ld	a, #0xc0
	ld	(hl+), a
	ld	(hl), #0x08
;src/main.c:1328: playerDrawX = 80;
	ld	hl, #_playerDrawX
	ld	(hl), #0x50
;src/main.c:1329: playerDrawY = 70;
	ld	hl, #_playerDrawY
	ld	(hl), #0x46
;src/main.c:1333: bgX = 0;
	xor	a, a
	ld	hl, #_bgX
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1334: bgY = 0;
	xor	a, a
	ld	hl, #_bgY
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1337: for (uint8_t i = 0; i < 10; ++i) {
	ldhl	sp,	#7
	ld	(hl), #0x00
00127$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x0a
	jp	NC, 00106$
;src/main.c:1338: int16_t backgroundXCandidate = (i16abs((int16_t)rand())) % 32;
	call	_rand
	ldhl	sp,#8
	ld	(hl), e
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	bit	7, (hl)
	jr	NZ, 00111$
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	jr	00113$
00111$:
	ld	de, #0x0000
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
00113$:
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0020
	push	de
	push	bc
	call	__modsint
	add	sp, #6
	push	de
;src/main.c:1339: int16_t backgroundYCandidate = (i16abs((int16_t)rand())) % 32;
	call	_rand
	ldhl	sp,#8
	ld	(hl), e
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	bit	7, (hl)
	jr	NZ, 00115$
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	jr	00117$
00115$:
	ld	de, #0x0000
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
00117$:
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x0020
	push	de
	push	bc
	call	__modsint
	add	sp, #4
;src/main.c:1341: backgroundXCandidate *= 8;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	c, (hl)
	ld	l, a
	ld	h, c
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;src/main.c:1342: backgroundYCandidate *= 8;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	ld	e, h
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), e
;src/main.c:1346: int16_t bgindX = ((playerDrawX + backgroundXCandidate) >> 3)%32;
	ld	hl, #_playerDrawX
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	push	bc
	ld	de, #0x0020
	push	de
	push	hl
	call	__modsint
	add	sp, #4
	pop	bc
	ldhl	sp,	#5
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/main.c:1347: uint8_t bgindY = ((playerDrawY + backgroundYCandidate) >> 3)%32; 
	ld	hl, #_playerDrawY
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
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
;src/main.c:1350: uint16_t ind = 32*bgindY + bgindX;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
;src/main.c:1351: uint8_t result = 1; // 0 incase of clear tile, 1 for blocked
	ld	(hl+), a
	ld	(hl), #0x01
;src/main.c:1352: for (uint8_t i=0; i<BLANKSIZE; i++) {
	ldhl	sp,	#8
	ld	(hl), #0x00
00124$:
	ld	hl, #_BLANKSIZE
	ld	e, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, e
	jr	NC, 00103$
;src/main.c:1353: if ((*(collisionTiles+ind)) == BLANK[i] ) {
	ld	hl, #_collisionTiles
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	hl
	ld	de, #_BLANK
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00125$
;src/main.c:1354: result = 0;
	ldhl	sp,	#5
	ld	(hl), #0x00
;src/main.c:1355: break;
	jr	00103$
00125$:
;src/main.c:1352: for (uint8_t i=0; i<BLANKSIZE; i++) {
	ldhl	sp,	#8
	inc	(hl)
	jr	00124$
00103$:
;src/main.c:1358: if (!result) { //tile is clear so player can spawn there
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	NZ, 00128$
;src/main.c:1359: bgX = backgroundXCandidate;
	ld	hl, #_bgX
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:1360: bgY = backgroundYCandidate;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_bgY),a
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_bgY + 1),a
;src/main.c:1361: break;
	jr	00106$
00128$:
;src/main.c:1337: for (uint8_t i = 0; i < 10; ++i) {
	ldhl	sp,	#7
	inc	(hl)
	jp	00127$
00106$:
;src/main.c:1368: hull = maxHull;
	ld	a, (#_maxHull)
	ld	(#_hull),a
;src/main.c:1369: shield = maxShield;
	ld	a, (#_maxShield)
	ld	(#_shield),a
;src/main.c:1371: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:1372: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/main.c:1373: set_sprite_data(0, 12, Player1);
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
;src/main.c:1379: set_bkg_data(0x50,1,healthblock);
	ld	de, #_healthblock
	push	de
	ld	hl, #0x150
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1383: setHealthBar(1, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1384: setHealthBar(0, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/main.c:1390: set_bkg_data(0x51, 18, ProjectileTiles);
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1251
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1397: SCORE = MAKE_BCD(00000);
	xor	a, a
	ld	hl, #_SCORE
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1402: missiles = 3;
	ld	hl, #_missiles
	ld	(hl), #0x03
;src/main.c:1403: MISSILES = MAKE_BCD(3);
	ld	hl, #_MISSILES
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1406: recoverHud();
	call	_recoverHud
;src/main.c:1410: pickup = upgrade;//upgrade;
	ld	de, #0x0009
	push	de
	ld	de, #_upgrade
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1412: set_sprite_data(0x70, 6, Pickups);
	ld	de, #_Pickups
	push	de
	ld	hl, #0x670
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1414: move_sprite(3, pickup.x + 4, pickup.y + 12);
	ld	a, (#(_pickup + 3) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_pickup + 1) + 0)
	add	a, #0x04
	ld	b, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 12)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:1416: for (uint8_t i = 0; i<exCount; ++i) {
	ldhl	sp,	#8
	ld	(hl), #0x00
00130$:
	ld	hl, #_exCount
	ld	c, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	NC, 00107$
;src/main.c:1417: explosions[i] = ex;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	de, #_explosions
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #0x0006
	push	de
	ld	de, #_ex
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
;src/main.c:1416: for (uint8_t i = 0; i<exCount; ++i) {
	ldhl	sp,	#8
	inc	(hl)
	jr	00130$
00107$:
;src/main.c:1419: set_sprite_data(exTiles[0], 16, Ex1);
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
;src/main.c:1420: set_sprite_data(exTiles[1], 16, Ex2);
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
;src/main.c:1421: set_sprite_data(exTiles[2], 16, Ex3);
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
;src/main.c:1424: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1425: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1426: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:1428: }
	add	sp, #9
	ret
;src/main.c:1431: void doPause() {
;	---------------------------------
; Function doPause
; ---------------------------------
_doPause::
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1433: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1434: clearWindow();
	call	_clearWindow
;src/main.c:1436: set_win_tiles(7, 0, 6, 1, pauselabel);
	ld	de, #_pauselabel
	push	de
	ld	hl, #0x106
	push	hl
	ld	hl, #0x07
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1438: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1439: waitpadup();
	call	_waitpadup
;src/main.c:1440: recoverHud();
	call	_recoverHud
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;src/main.c:1441: enable_interrupts();
;src/main.c:1442: }
	ret
;src/main.c:1448: void showScoreScreen() {
;	---------------------------------
; Function showScoreScreen
; ---------------------------------
_showScoreScreen::
	add	sp, #-10
;src/main.c:1449: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1450: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x08
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1454: clearScreen();
	call	_clearScreen
;src/main.c:1455: initFont();
	call	_initFont
;src/main.c:1457: set_bkg_data(0x63, 3, backgroundtiles); //0x25
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x363
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1458: loadWindowStars();
	call	_loadWindowStars
;src/main.c:1462: set_win_tiles(7, 5, 5, 1, endScoreLabel);
	ld	de, #_endScoreLabel
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x507
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1467: bcd2text(&SCORE, 0x01, buf);
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
;src/main.c:1468: set_win_tiles(6, 8, 7, 1, buf+1);
	inc	bc
	push	bc
	ld	hl, #0x107
	push	hl
	ld	hl, #0x806
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1472: set_win_tiles(3, 11, 13, 1, pressAnyKeyLabel);
	ld	de, #_pressAnyKeyLabel
	push	de
	ld	hl, #0x10d
	push	hl
	ld	hl, #0xb03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1474: set_win_tiles(4, 12, 11, 1, toContinueLabel);
	ld	de, #_toContinueLabel
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0xc04
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1478: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1480: }
	add	sp, #10
	ret
;src/main.c:1483: void showControls() {
;	---------------------------------
; Function showControls
; ---------------------------------
_showControls::
	add	sp, #-8
;src/main.c:1484: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1485: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x0c
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1489: clearScreen();
	call	_clearScreen
;src/main.c:1490: initFont();
	call	_initFont
;src/main.c:1492: set_bkg_data(0x63, 3, backgroundtiles); //0x25
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x363
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1493: loadWindowStars();
	call	_loadWindowStars
;src/main.c:1496: set_bkg_data(0x70, 1, underscore); 
	ld	de, #_underscore
	push	de
	ld	hl, #0x170
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1497: unsigned char underscoreTiles[] = {0x70, 0x70, 0x70, 0x70, 0x70, 0x70,0x70, 0x70};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x70
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x70
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x70
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x70
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x70
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x70
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x70
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x70
;src/main.c:1498: set_win_tiles(5, 3, 8, 1, underscoreTiles);
	push	bc
	ld	hl, #0x108
	push	hl
	ld	hl, #0x305
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1500: set_win_tiles(5, 2, 8, 1, controlsLabel);
	ld	de, #_controlsLabel
	push	de
	ld	hl, #0x108
	push	hl
	ld	hl, #0x205
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1501: set_win_tiles(3, 5, 11, 1, dpadlabel);
	ld	de, #_dpadlabel
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x503
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1502: set_win_tiles(3, 7, 13, 1, alabel);
	ld	de, #_alabel
	push	de
	ld	hl, #0x10d
	push	hl
	ld	hl, #0x703
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1503: set_win_tiles(3, 9, 11, 1, blabel);
	ld	de, #_blabel
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x903
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1504: set_win_tiles(3, 11, 12, 1, startlabel);
	ld	de, #_startlabel
	push	de
	ld	hl, #0x10c
	push	hl
	ld	hl, #0xb03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1506: set_win_tiles(3, 13, 13, 1, selectlabel);
	ld	de, #_selectlabel
	push	de
	ld	hl, #0x10d
	push	hl
	ld	hl, #0xd03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1507: set_win_tiles(10, 14, 6, 1, fullweaponlabel);
	ld	de, #_fullweaponlabel
	push	de
	ld	hl, #0x106
	push	hl
	ld	hl, #0xe0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1509: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1511: }
	add	sp, #8
	ret
;src/main.c:1514: void showStartScreen() {
;	---------------------------------
; Function showStartScreen
; ---------------------------------
_showStartScreen::
;src/main.c:1515: initFont();
	call	_initFont
;src/main.c:1517: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x0c
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1522: set_win_tiles(4, 8, 11, 1, pressStartLabel);
	ld	de, #_pressStartLabel
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x804
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1524: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1525: }
	ret
;src/main.c:1527: void loadWindowStars() {
;	---------------------------------
; Function loadWindowStars
; ---------------------------------
_loadWindowStars::
	add	sp, #-3
;src/main.c:1528: unsigned char tiles[] = {0x64, 0x65};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x64
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x65
;src/main.c:1529: for (uint8_t i = 0; i < 10; ++i) {
	ldhl	sp,	#2
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00105$
;src/main.c:1530: uint8_t x = ((uint8_t)rand()) % 18; 
	push	bc
	call	_rand
	pop	bc
	ld	d, #0x00
	push	bc
	ld	hl, #0x0012
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	bc
	and	a, #0x0f
	ld	d, a
;src/main.c:1532: uint8_t type = ((uint8_t)rand()) % 2;
	push	bc
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	bc
	and	a, #0x01
;src/main.c:1533: set_win_tiles(x, y, 1, 1, tiles + type);
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	push	hl
	ld	hl, #0x101
	push	hl
	push	de
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1529: for (uint8_t i = 0; i < 10; ++i) {
	ldhl	sp,	#2
	inc	(hl)
	jr	00103$
00105$:
;src/main.c:1535: }
	add	sp, #3
	ret
;src/main.c:1538: void updateMenu(int8_t menuitem) {
;	---------------------------------
; Function updateMenu
; ---------------------------------
_updateMenu::
;src/main.c:1539: move_sprite(0, 48, 95+ (menuitem<<3));
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x5f
	ld	c, a
	ld	b, c
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), #0x30
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), c
	inc	hl
	ld	(hl), #0x7a
;src/main.c:1540: move_sprite(1, 122, 95+ (menuitem<<3));
;src/main.c:1542: }
	ret
;src/main.c:1546: uint8_t showMenu() {
;	---------------------------------
; Function showMenu
; ---------------------------------
_showMenu::
	add	sp, #-128
	dec	sp
	dec	sp
;src/main.c:1547: initFont();
	call	_initFont
;src/main.c:1549: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1550: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:1552: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x10
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1558: set_bkg_data(0x63, 3, backgroundtiles); //0x25
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x363
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1559: loadWindowStars();
	call	_loadWindowStars
;src/main.c:1563: set_win_tiles(7, 10, 4, 1, playLabel);
	ld	de, #_playLabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0xa07
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1564: set_win_tiles(5, 11, 8, 1, controlsLabel);
	ld	de, #_controlsLabel
	push	de
	ld	hl, #0x108
	push	hl
	ld	hl, #0xb05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1569: for (uint8_t i = 0; i < 128; ++i) {
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ld	hl, #128
	add	hl, sp
	ld	(hl+), a
	ld	(hl), d
	ld	e, #0x00
00123$:
	ld	a, e
	sub	a, #0x80
	jr	NC, 00101$
;src/main.c:1570: logo0_offsetMap[i] = logo0_map[i] + 0x25;
	push	de
	ld	d, #0x00
	ld	hl, #130
	add	hl, sp
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	hl, #_logo0_map
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	add	a, #0x25
	ld	(bc), a
;src/main.c:1569: for (uint8_t i = 0; i < 128; ++i) {
	inc	e
	jr	00123$
00101$:
;src/main.c:1573: set_bkg_data(0x25, 62, logo0_data); //0x25
	ld	de, #_logo0_data
	push	de
	ld	hl, #0x3e25
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1574: set_win_tiles(1,1, 16, 8, logo0_offsetMap);
	ld	hl, #128
	add	hl, sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x810
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1579: set_sprite_data(0, 1, MenuPicker);
	ld	de, #_MenuPicker
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 3)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x20
;src/main.c:1584: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1585: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1588: int8_t menuitem = 0;
	ld	c, #0x00
;src/main.c:1590: while (1) {
00114$:
;src/main.c:1591: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1593: if (joydata & J_DOWN) {
	ld	a, (hl)
	bit	3, a
	jr	Z, 00105$
;src/main.c:1594: playSound(30);
	push	bc
	ld	a, #0x1e
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
;src/main.c:1595: menuitem++;
	inc	c
;src/main.c:1596: waitpadup();
	call	_waitpadup
	jr	00106$
00105$:
;src/main.c:1598: else if (joydata & J_UP) {
	bit	2, a
	jr	Z, 00106$
;src/main.c:1599: playSound(30);
	push	bc
	ld	a, #0x1e
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
;src/main.c:1600: menuitem--;
	dec	c
;src/main.c:1601: waitpadup();
	call	_waitpadup
00106$:
;src/main.c:370: return (value < min) ? min : (value > max) ? max : value;
	bit	7, c
	jr	Z, 00127$
	ld	c, #0x00
	jr	00128$
00127$:
	ld	e, c
	ld	a,#0x01
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00184$
	bit	7, d
	jr	NZ, 00185$
	cp	a, a
	jr	00185$
00184$:
	bit	7, d
	jr	Z, 00185$
	scf
00185$:
	jr	NC, 00129$
	ld	c, #0x01
00129$:
00128$:
;src/main.c:1604: menuitem = clamp(menuitem, 0, 1);
	ld	b,c
;src/main.c:1605: updateMenu(menuitem);
	push	bc
	push	bc
	inc	sp
	call	_updateMenu
	inc	sp
	pop	bc
;src/main.c:1593: if (joydata & J_DOWN) {
	ld	a, (#_joydata)
;src/main.c:1607: if ((joydata & J_A) && menuitem == 0) {
	and	a, #0x10
	ld	e, a
	ld	d, #0x00
	ld	a, d
	or	a, e
	jr	Z, 00110$
	ld	a, b
	or	a, a
	jr	NZ, 00110$
;src/main.c:1608: waitpadup();
	call	_waitpadup
;src/main.c:1609: playSound(32);
	ld	a, #0x20
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1610: return 0;
	ld	e, #0x00
	jr	00125$
00110$:
;src/main.c:1612: else if (joydata & J_A) {
	ld	a, d
	or	a, e
	jr	Z, 00111$
;src/main.c:1613: waitpadup();
	call	_waitpadup
;src/main.c:1614: playSound(32);
	ld	a, #0x20
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1615: return 1;
	ld	e, #0x01
	jr	00125$
00111$:
;src/main.c:1618: wait_vbl_done();
	call	_wait_vbl_done
	jp	00114$
00125$:
;src/main.c:1621: }
	add	sp, #127
	add	sp, #3
	ret
;src/main.c:1626: uint8_t showLevelSelection() {
;	---------------------------------
; Function showLevelSelection
; ---------------------------------
_showLevelSelection::
	add	sp, #-13
;src/main.c:1627: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1628: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:1629: clearScreen();
	call	_clearScreen
;src/main.c:1630: initFont();
	call	_initFont
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x08
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1633: set_bkg_data(0x63, 3, backgroundtiles); //0x25
	ld	bc, #_backgroundtiles+0
	push	bc
	ld	hl, #0x363
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1634: loadWindowStars();
	push	bc
	call	_loadWindowStars
	pop	bc
;src/main.c:1637: set_bkg_data(0x70, 1, underscore); 
	ld	de, #_underscore
	push	de
	ld	hl, #0x170
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1638: unsigned char underscoreTiles[] = {0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70};
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ld	(hl), #0x70
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x70
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x70
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x70
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x70
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x70
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x70
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x70
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x70
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x70
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0x70
	ld	hl, #0x000b
	add	hl, de
	ld	(hl), #0x70
;src/main.c:1639: set_win_tiles(3, 4, 12, 1, underscoreTiles);
	push	de
	ld	hl, #0x10c
	push	hl
	ld	hl, #0x403
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1643: set_win_tiles(3,3, 12, 1, selectLevelLabel);
	ld	de, #_selectLevelLabel
	push	de
	ld	hl, #0x10c
	push	hl
	ld	hl, #0x303
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1645: set_win_tiles(3,6, 4, 1, voidLabel);
	ld	de, #_voidLabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x603
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1646: set_win_tiles(3,7, 11, 1, asteroids1Label);
	ld	de, #_asteroids1Label
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x703
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1647: set_win_tiles(3,8, 11, 1, asteroids2Label);
	ld	de, #_asteroids2Label
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x803
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1648: set_win_tiles(3,9, 8, 1, marshabLabel);
	ld	de, #_marshabLabel
	push	de
	ld	hl, #0x108
	push	hl
	ld	hl, #0x903
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1649: set_win_tiles(3,10, 5, 1, bonusLabel);
	ld	de, #_bonusLabel
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0xa03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1651: set_sprite_data(0, 1, MenuPicker);
	ld	de, #_MenuPicker
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;src/main.c:1654: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1655: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1658: int8_t menuitem = 0;
	ldhl	sp,	#12
	ld	(hl), #0x00
;src/main.c:1659: while(1) {
00121$:
;src/main.c:1660: prevJoyData = joydata;
	ld	a, (#_joydata)
	ld	(#_prevJoyData),a
;src/main.c:1661: joydata = joypad();
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1660: prevJoyData = joydata;
	ld	d, (hl)
;src/main.c:1663: if (joydata & J_A) {
	bit	4, d
	jp	Z,00111$
;src/main.c:1664: playSound(32);
	push	bc
	ld	a, #0x20
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
;src/main.c:1665: waitpadup();
	call	_waitpadup
;src/main.c:1667: if (menuitem == 0) {
	ldhl	sp,	#12
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;src/main.c:1668: set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	push	bc
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1669: set_bkg_tiles(0,0,background3Width, background3Height ,background3); //set tilemap to be a background
	ld	de, #_background3
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:1670: collisionTiles = background3; // set background to be the collision map
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background3)
	inc	hl
	ld	(hl), #>(_background3)
;src/main.c:1671: difficulty = 0;
	xor	a, a
	ld	hl, #_difficulty
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1672: return 1;
	ld	e, #0x01
	jp	00127$
00102$:
;src/main.c:1674: if (menuitem == 1) {
	ldhl	sp,	#12
	ld	a, (hl)
	dec	a
	jr	NZ, 00104$
;src/main.c:1675: set_bkg_data(0x25, 16, backgroundtiles);		
	push	bc
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1676: set_bkg_tiles(0,0,background1Width, background1Height ,background1); 
	ld	de, #_background1
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:1677: collisionTiles = background1;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background1)
	inc	hl
	ld	(hl), #>(_background1)
;src/main.c:1678: difficulty = 100;
	ld	hl, #_difficulty
	ld	a, #0x64
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:1679: return 1;
	ld	e, #0x01
	jp	00127$
00104$:
;src/main.c:1681: if (menuitem == 2) {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00106$
;src/main.c:1682: set_bkg_data(0x25, 16, backgroundtiles);		
	push	bc
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1683: set_bkg_tiles(0,0,background4Width, background4Height ,background4); 
	ld	de, #_background4
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:1684: collisionTiles = background4;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background4)
	inc	hl
	ld	(hl), #>(_background4)
;src/main.c:1685: difficulty = 200;
	ld	hl, #_difficulty
	ld	a, #0xc8
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:1686: return 1;
	ld	e, #0x01
	jp	00127$
00106$:
;src/main.c:1688: if (menuitem == 3) {
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00108$
;src/main.c:1689: set_bkg_data(0x25, 16, marstiles);		
	ld	de, #_marstiles
	push	de
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1690: set_bkg_tiles(0,0,marsbackgroundWidth, marsbackgroundHeight ,marsbackground); 
	ld	de, #_marsbackground
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:1691: collisionTiles = marsbackground;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_marsbackground)
	inc	hl
	ld	(hl), #>(_marsbackground)
;src/main.c:1692: difficulty = 300;
	ld	hl, #_difficulty
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x01
;src/main.c:1693: return 1;
	ld	e, #0x01
	jp	00127$
00108$:
;src/main.c:1696: set_bkg_data(0x25, 16, backgroundtiles2);	
	ld	de, #_backgroundtiles2
	push	de
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1697: set_bkg_tiles(0,0,background2Width, background2Height ,background2); 
	ld	de, #_background2
	push	de
	ld	hl, #0x2020
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:1698: collisionTiles = background2;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background2)
	inc	hl
	ld	(hl), #>(_background2)
;src/main.c:1699: difficulty = 400;
	ld	hl, #_difficulty
	ld	a, #0x90
	ld	(hl+), a
	ld	(hl), #0x01
;src/main.c:1700: return 1;
	ld	e, #0x01
	jp	00127$
00111$:
;src/main.c:1704: if (joydata & J_B) {
	bit	5, d
	jr	Z, 00113$
;src/main.c:1705: waitpadup();
	call	_waitpadup
;src/main.c:1706: playSound(31);
	ld	a, #0x1f
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1707: return 0;
	ld	e, #0x00
	jr	00127$
00113$:
;src/main.c:1710: if (!(prevJoyData & J_DOWN) && (joydata & J_DOWN)) {
	ld	a, (#_prevJoyData)
	bit	3, a
	jr	NZ, 00115$
	bit	3, d
	jr	Z, 00115$
;src/main.c:1711: ++menuitem;
	ldhl	sp,	#12
	inc	(hl)
;src/main.c:1712: playSound(30);
	push	bc
	ld	a, #0x1e
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
;src/main.c:1713: waitpadup();
	call	_waitpadup
00115$:
;src/main.c:1715: if (!(prevJoyData & J_UP) && (joydata & J_UP)) {
	ld	a, (#_prevJoyData)
	bit	2, a
	jr	NZ, 00118$
	ld	a, (#_joydata)
	bit	2, a
	jr	Z, 00118$
;src/main.c:1716: --menuitem;
	ldhl	sp,	#12
	dec	(hl)
;src/main.c:1717: playSound(30);
	push	bc
	ld	a, #0x1e
	push	af
	inc	sp
	call	_playSound
	inc	sp
	pop	bc
;src/main.c:1718: waitpadup();
	call	_waitpadup
00118$:
;src/main.c:370: return (value < min) ? min : (value > max) ? max : value;
	ldhl	sp,	#12
	bit	7, (hl)
	jr	Z, 00129$
	xor	a, a
	jr	00130$
00129$:
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a,#0x04
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00212$
	bit	7, d
	jr	NZ, 00213$
	cp	a, a
	jr	00213$
00212$:
	bit	7, d
	jr	Z, 00213$
	scf
00213$:
	jr	NC, 00131$
	ld	a, #0x04
	jr	00132$
00131$:
	ldhl	sp,	#12
	ld	a, (hl)
00132$:
00130$:
;src/main.c:1720: menuitem = clamp(menuitem, 0, 4);
	ldhl	sp,	#12
	ld	(hl), a
;src/main.c:1721: move_sprite(0, 24, 63 + (menuitem<<3));
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x3f
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	hl, #_shadow_OAM
	ld	(hl+), a
	ld	(hl), #0x18
;src/main.c:1723: wait_vbl_done();
	call	_wait_vbl_done
	jp	00121$
00127$:
;src/main.c:1726: }
	add	sp, #13
	ret
;src/main.c:1730: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1740: NR52_REG = 0x80; // sound on 
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/main.c:1741: NR50_REG = 0x77; // volume
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/main.c:1742: NR51_REG = 0xFF; // all channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/main.c:1746: showStartScreen();
	call	_showStartScreen
;src/main.c:1747: waitpad(J_START | J_A);
	ld	a, #0x90
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1748: waitpadup();
	call	_waitpadup
;src/main.c:1749: playSound(32);
	ld	a, #0x20
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1752: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;src/main.c:1753: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;src/main.c:1754: initrand(seed);
	push	bc
	call	_initrand
	inc	sp
	inc	sp
;src/main.c:1759: while(1) {
00147$:
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1764: set_interrupts(1);   
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;src/main.c:1766: clearScreen();
	call	_clearScreen
;src/main.c:1768: uint8_t result = showMenu();
	call	_showMenu
	ld	a, e
	ld	b, a
;src/main.c:1771: if (result == 0) {
	or	a, a
	jp	NZ, 00144$
;src/main.c:1773: uint8_t map = showLevelSelection();
	call	_showLevelSelection
	ld	a, e
;src/main.c:1774: if (map == 0) {
	or	a, a
	jr	Z, 00147$
;src/main.c:1779: initEnemyOptions();
	call	_initEnemyOptions
;src/main.c:1780: initGame();
	call	_initGame
;src/main.c:1781: initEnemies(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/main.c:1782: initProjectiles();
	call	_initProjectiles
;src/main.c:1785: while(hull > 0) {
00122$:
	ld	a, (#_hull)
	or	a, a
	jp	Z, 00188$
;src/main.c:1786: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1788: prevJoyData = joydata;
	ld	a, (#_joydata)
	ld	(#_prevJoyData),a
;src/main.c:1789: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1791: updateDirection(); // set player direction
	call	_updateDirection
;src/main.c:1794: move(); 
	call	_move
;src/main.c:1796: moveProjectiles();
	call	_moveProjectiles
;src/main.c:1797: tickPickups();
	call	_tickPickups
;src/main.c:1798: tickEx();
	call	_tickEx
;src/main.c:1802: updateEnemyPositions();
	call	_updateEnemyPositions
;src/main.c:1803: checkCollision(); 
	call	_checkCollision
;src/main.c:1072: if (shield < maxShield) {
	ld	hl, #_maxShield
	ld	c, (hl)
	ld	e, c
	ld	hl, #_shield
	ld	d, (hl)
	ld	a, (hl)
	sub	a, c
	bit	7, e
	jr	Z, 00348$
	bit	7, d
	jr	NZ, 00349$
	cp	a, a
	jr	00349$
00348$:
	bit	7, d
	jr	Z, 00349$
	scf
00349$:
	jr	NC, 00152$
;src/main.c:1073: shield += 1;
	ld	hl, #_shield
	inc	(hl)
00152$:
;src/main.c:1075: setHealthBar(1, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1076: setHealthBar(0, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1808: if (joydata & J_B && fireCooldown == 0) {
	ld	a, (#_joydata)
	bit	5, a
	jr	Z, 00102$
	ld	a, (#_fireCooldown)
	or	a, a
	jr	NZ, 00102$
;src/main.c:1809: fire();
	call	_fire
00102$:
;src/main.c:1811: if (fireCooldown > 0) {
	ld	hl, #_fireCooldown
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;src/main.c:1812: --fireCooldown;
	dec	(hl)
00105$:
;src/main.c:1815: if ((joydata & J_SELECT) && !(prevJoyData & J_SELECT)) {
	ld	a, (#_joydata)
	bit	6, a
	jr	Z, 00112$
	ld	a, (#_prevJoyData)
	bit	6, a
	jr	NZ, 00112$
;src/main.c:1816: if (currentGun == 0) {
	ld	hl, #_currentGun
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
;src/main.c:1817: currentGun = 1;
	ld	(hl), #0x01
	jr	00110$
00109$:
;src/main.c:1819: else if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00110$
;src/main.c:1820: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
00110$:
;src/main.c:1822: setGunIcon();
	call	_setGunIcon
00112$:
;src/main.c:1825: if (!(joydata & J_START) && (prevJoyData & J_START)) {
	ld	a, (#_joydata)
	rlca
	jr	C, 00115$
	ld	a, (#_prevJoyData)
	rlca
	jr	NC, 00115$
;src/main.c:1826: doPause();
	call	_doPause
00115$:
;src/main.c:1829: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jr	NZ, 00118$
;src/main.c:1830: auxTick = AUXTICKFREQUENCY;
	ld	a, (#_AUXTICKFREQUENCY)
	ld	(#_auxTick),a
	jr	00119$
00118$:
;src/main.c:1833: auxTick--;
	ld	hl, #_auxTick
	dec	(hl)
00119$:
;src/main.c:1836: if (hull > 100) {
	ld	a, #0x64
	ld	hl, #_hull
	sub	a, (hl)
	jr	NC, 00121$
;src/main.c:1837: hull = 0;
	ld	(hl), #0x00
;src/main.c:1838: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;src/main.c:1839: setHealthBar(1, hull);
	ld	hl, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1840: setHealthBar(0, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
00121$:
;src/main.c:1842: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1844: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1845: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
	jp	00122$
;src/main.c:1850: for (uint8_t i=0; i<exCount; ++i) {
00188$:
	ldhl	sp,	#3
	ld	(hl), #0x00
00160$:
	ld	hl, #_exCount
	ld	c, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NC, 00125$
;src/main.c:1851: explosions[i].x = 200;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_explosions
	add	hl,bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0xc8
;src/main.c:1852: explosions[i].y = 200;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0xc8
;src/main.c:1854: explosions[i].tile = exTiles[0];
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (#_exTiles + 0)
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;src/main.c:1855: explosions[i].frameCounter = 0;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;src/main.c:1856: explosions[i].frame = 2-i;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#3
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	sub	a, l
	ld	(de), a
;src/main.c:1857: explosions[i].visible = 1;
	ld	a, #0x01
	ld	(bc), a
;src/main.c:1850: for (uint8_t i=0; i<exCount; ++i) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00160$
00125$:
;src/main.c:1859: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1860: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1862: while(endExCount < 12) {
	ldhl	sp,	#3
	ld	(hl), #0x00
00133$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0c
	jp	NC, 00135$
;src/main.c:1864: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1865: tickEx();
	call	_tickEx
;src/main.c:1866: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jr	NZ, 00127$
;src/main.c:1867: auxTick = AUXTICKFREQUENCY;
	ld	a, (#_AUXTICKFREQUENCY)
	ld	(#_auxTick),a
	jr	00128$
00127$:
;src/main.c:1870: auxTick--;
	ld	hl, #_auxTick
	dec	(hl)
00128$:
;src/main.c:1872: if (!explosions[oldestEx].visible) {
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
	or	a, a
	jp	NZ, 00132$
;src/main.c:1873: explosions[oldestEx].visible = 1;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x01
;src/main.c:1876: uint8_t tileNum = ((uint8_t)rand()) % exTileCount;
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
	ldhl	sp,	#0
	ld	(hl), e
;src/main.c:1877: uint8_t xOff = ((uint8_t)rand()) % 32;
	call	_rand
	ld	a, e
	and	a, #0x1f
	ldhl	sp,	#1
	ld	(hl), a
;src/main.c:1878: uint8_t yOff = ((uint8_t)rand()) % 32;
	call	_rand
	ld	a, e
	and	a, #0x1f
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:1880: explosions[oldestEx].x = playerDrawX -16 + xOff;
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
	ld	a, (#_playerDrawX)
	add	a, #0xf0
	ldhl	sp,	#1
	ld	e, (hl)
	add	a, e
	ld	(bc), a
;src/main.c:1881: explosions[oldestEx].y = playerDrawY -16 + yOff;
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
	ld	a, (#_playerDrawY)
	add	a, #0xf0
	ldhl	sp,	#2
	ld	e, (hl)
	add	a, e
	ld	(bc), a
;src/main.c:1882: explosions[oldestEx].tile = exTiles[tileNum];
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
	ld	de, #_exTiles
	ldhl	sp,	#0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(bc), a
;src/main.c:1883: explosions[oldestEx].frame = 0;
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
;src/main.c:1884: explosions[oldestEx].frameCounter = 0;
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
;src/main.c:1886: set_sprite_tile(20 + oldestEx+oldestEx, explosions[oldestEx].tile + (explosions[oldestEx].frame<<1));
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
	ld	hl, #_oldestEx
	ld	b, (hl)
	ld	a, b
	add	a, #0x14
	add	a, b
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
;src/main.c:1887: set_sprite_tile(21 + oldestEx+oldestEx, explosions[oldestEx].tile+(explosions[oldestEx].frame<<1) +2);
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
	ld	hl, #_oldestEx
	ld	b, (hl)
	ld	a, b
	add	a, #0x15
	add	a, b
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
;src/main.c:1889: oldestEx++;
	ld	hl, #_oldestEx
	inc	(hl)
;src/main.c:1890: if (oldestEx >= exCount) {
	ld	hl, #_exCount
	ld	c, (hl)
	ld	hl, #_oldestEx
	ld	a, (hl)
	sub	a, c
	jr	C, 00130$
;src/main.c:1891: oldestEx = 0;
	ld	(hl), #0x00
00130$:
;src/main.c:1893: endExCount++;
	ldhl	sp,	#3
	inc	(hl)
;src/main.c:1894: playSound(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_playSound
	inc	sp
00132$:
;src/main.c:1896: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1898: wait_vbl_done();
	call	_wait_vbl_done
	jp	00133$
00135$:
;src/main.c:1901: for (uint8_t j=0; j<exCount; ++j) {
	ld	c, #0x00
00163$:
	ld	hl, #_exCount
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00136$
;src/main.c:1903: move_sprite(20 +j+j, 200, 200);
	ld	b, c
	ld	a, b
	add	a, #0x14
	add	a, b
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
	ld	a, #0xc8
	ld	(hl+), a
	ld	(hl), #0xc8
;src/main.c:1904: move_sprite(21 +j+j, 200, 200);
	ld	a, b
	add	a, #0x15
	add	a, b
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, #0xc8
	ld	(hl+), a
	ld	(hl), #0xc8
;src/main.c:1901: for (uint8_t j=0; j<exCount; ++j) {
	inc	c
	jr	00163$
00136$:
;src/main.c:1906: for (uint16_t k=0; k<120; ++k) {
	ld	bc, #0x0000
00166$:
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0x78
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00137$
;src/main.c:1907: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1908: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1909: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:1906: for (uint16_t k=0; k<120; ++k) {
	inc	bc
	jr	00166$
00137$:
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1913: showScoreScreen();
	call	_showScoreScreen
;src/main.c:1914: waitpad(J_A | J_B | J_DOWN | J_LEFT | J_RIGHT | J_UP | J_SELECT | J_START);
	ld	a, #0xff
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1915: waitpadup();
	call	_waitpadup
	jp	00147$
00144$:
;src/main.c:1920: else if (result == 1) {
	dec	b
	jp	NZ,00147$
;src/main.c:1921: showControls();
	call	_showControls
;src/main.c:1922: waitpad(J_B);
	ld	a, #0x20
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1923: waitpadup();
	call	_waitpadup
;src/main.c:1924: playSound(31);
	ld	a, #0x1f
	push	af
	inc	sp
	call	_playSound
	inc	sp
	jp	00147$
;src/main.c:1929: }
	add	sp, #4
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__minispike:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0032
__xinit__minibomb:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x19	; 25
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
	.db #0x19	; 25
	.db #0x05	;  5
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0032
__xinit__miniufo:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x05	;  5
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0032
__xinit__minibubble:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x05	;  5
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0032
__xinit__minidual:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x05	;  5
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0032
__xinit__minifighter:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x19	; 25
	.db #0x05	;  5
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0032
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
__xinit__owl:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x5c	; 92
	.db #0x5f	; 95
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0064
__xinit__calvine:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x60	; 96
	.db #0x62	; 98	'b'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0064
__xinit__xwing:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x64	; 100	'd'
	.db #0x66	; 102	'f'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0064
__xinit__destroyer:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x68	; 104	'h'
	.db #0x6a	; 106	'j'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0064
__xinit__doublefuse:
	.dw #0x0000
	.dw #0x0000
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x6c	; 108	'l'
	.db #0x6e	; 110	'n'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0x03	;  3
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.dw #0x0064
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
__xinit__HPSCALESPEED:
	.dw #0x000a
__xinit__ATTACKSCALESPEED:
	.dw #0x0014
__xinit__difficulty:
	.dw #0x0000
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
__xinit__joydata:
	.db #0x00	; 0
__xinit__prevJoyData:
	.db #0x00	; 0
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
