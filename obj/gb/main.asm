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
	.globl _showStartScreen
	.globl _showControls
	.globl _showScoreScreen
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
	.globl _difficulty
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
	.globl _bonusLabel
	.globl _marshabLabel
	.globl _asteroids2Label
	.globl _asteroids1Label
	.globl _voidLabel
	.globl _selectLevelLabel
	.globl _controlsLabel
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
	.globl _enemyOptionCount
	.globl _healthblock
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
	.ds 180
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
_hullabel::
	.ds 4
_shieldlabel::
	.ds 4
_weaponlabel::
	.ds 4
_scorelabel::
	.ds 4
_endScoreLabel::
	.ds 5
_pressAnyKeyLabel::
	.ds 13
_toContinueLabel::
	.ds 11
_emptyRow::
	.ds 20
_pressStartLabel::
	.ds 11
_playLabel::
	.ds 4
_controlsLabel::
	.ds 8
_selectLevelLabel::
	.ds 12
_voidLabel::
	.ds 4
_asteroids1Label::
	.ds 11
_asteroids2Label::
	.ds 11
_marshabLabel::
	.ds 8
_bonusLabel::
	.ds 5
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
_difficulty::
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
;src/main.c:179: void interruptLCD()
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;src/main.c:181: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:182: }
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
	.db #0x0a	; 10
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
_MAXGUNLEVEL:
	.db #0x01	; 1
_SPLASHDROPOFF:
	.db #0x01	; 1
_exCount:
	.db #0x04	; 4
_EXPLFRAMETIME:
	.db #0x04	; 4
_exTileCount:
	.db #0x03	; 3
_AUXTICKFREQUENCY:
	.db #0x01	; 1
;src/main.c:185: void setHealthBar(uint8_t row, uint8_t hp) {
;	---------------------------------
; Function setHealthBar
; ---------------------------------
_setHealthBar::
	add	sp, #-5
;src/main.c:187: if (hp >= 80) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x50
	jr	C, 00102$
;src/main.c:188: unsigned char blockmap[] = {0x50,0x50,0x50, 0x50, 0x50};
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
;src/main.c:189: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:190: return;
	jp	00111$
00102$:
;src/main.c:192: if (hp >= 60) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x3c
	jr	C, 00104$
;src/main.c:193: unsigned char blockmap[] = {0x50,0x50,0x50, 0x50, 0x00};
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
;src/main.c:194: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:195: return;
	jp	00111$
00104$:
;src/main.c:197: if (hp >= 40) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x28
	jr	C, 00106$
;src/main.c:198: unsigned char blockmap[] = {0x50,0x50,0x50,0x00,0x00};
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
;src/main.c:199: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:200: return;
	jp	00111$
00106$:
;src/main.c:202: if (hp >= 20) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x14
	jr	C, 00108$
;src/main.c:203: unsigned char blockmap[] = {0x50,0x50,0x00,0x00,0x00};
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
;src/main.c:204: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:205: return;
	jr	00111$
00108$:
;src/main.c:207: if (hp >= 1) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x01
	jr	C, 00110$
;src/main.c:208: unsigned char blockmap[] = {0x50,0x00,0x00,0x00,0x00};
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
;src/main.c:209: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:210: return;
	jr	00111$
00110$:
;src/main.c:212: unsigned char blockmap[] = {0x00,0x00,0x00,0x00,0x00};
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
;src/main.c:213: set_win_tiles(5,row,5,1,blockmap);
	push	bc
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#11
	ld	h, (hl)
	ld	l, #0x05
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:214: return;
00111$:
;src/main.c:216: }
	add	sp, #5
	ret
;src/main.c:218: void updateScore() {
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
	add	sp, #-10
;src/main.c:222: len = bcd2text(&SCORE, 0x01, buf);
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
;src/main.c:223: set_win_tiles(15, 1, 5, 1, buf+3);
	inc	bc
	inc	bc
	inc	bc
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x10f
	push	hl
	call	_set_win_tiles
;src/main.c:224: }
	add	sp, #16
	ret
;src/main.c:226: void updateMissileCount(int8_t amount) {
;	---------------------------------
; Function updateMissileCount
; ---------------------------------
_updateMissileCount::
	add	sp, #-10
;src/main.c:227: if (amount == -1) {
	ldhl	sp,	#12
	ld	a, (hl)
	inc	a
	jr	NZ, 00112$
;src/main.c:228: missiles--;
	ld	hl, #_missiles
	dec	(hl)
;src/main.c:229: bcd_sub(&MISSILES, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_sub
	add	sp, #4
	jr	00104$
;src/main.c:232: for(int8_t i=0; i<amount;i++) {
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
;src/main.c:233: ++missiles;
	ld	hl, #_missiles
	inc	(hl)
;src/main.c:234: bcd_add(&MISSILES, &INCREMENT);
	push	bc
	ld	de, #_INCREMENT
	push	de
	ld	de, #_MISSILES
	push	de
	call	_bcd_add
	add	sp, #4
	pop	bc
;src/main.c:232: for(int8_t i=0; i<amount;i++) {
	inc	c
	jr	00106$
00104$:
;src/main.c:239: len = bcd2text(&MISSILES, 0x01, buf);
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
;src/main.c:240: set_win_tiles(18, 0, 2, 1, buf+6);
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	hl, #0x102
	push	hl
	ld	hl, #0x12
	push	hl
	call	_set_win_tiles
;src/main.c:242: }
	add	sp, #16
	ret
;src/main.c:244: void incrementScore() {
;	---------------------------------
; Function incrementScore
; ---------------------------------
_incrementScore::
;src/main.c:245: score += 1;
	ld	hl, #_score
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:246: bcd_add(&SCORE, &INCREMENT);
	ld	de, #_INCREMENT
	push	de
	ld	de, #_SCORE
	push	de
	call	_bcd_add
	add	sp, #4
;src/main.c:247: }
	ret
;src/main.c:249: void updateDirection() {
;	---------------------------------
; Function updateDirection
; ---------------------------------
_updateDirection::
	add	sp, #-4
;src/main.c:253: if ((joydata & J_RIGHT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:254: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:255: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00102$:
;src/main.c:257: if ((joydata & J_LEFT) && !(joydata & J_UP) && !(joydata & J_DOWN)) {
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
;src/main.c:258: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:259: yDir = 0;
	ld	hl, #_yDir
	ld	(hl), #0x00
00106$:
;src/main.c:261: if ((joydata & J_UP) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:262: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:263: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00110$:
;src/main.c:265: if ((joydata & J_DOWN) && !(joydata & J_LEFT) && !(joydata & J_RIGHT)) {
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
;src/main.c:266: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:267: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00114$:
;src/main.c:271: if ((joydata & J_UP) && (joydata & J_RIGHT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00118$
;src/main.c:272: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:273: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00118$:
;src/main.c:275: if ((joydata & J_UP) && (joydata & J_LEFT)) {
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00121$
	ld	a, d
	or	a, e
	jr	Z, 00121$
;src/main.c:276: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:277: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
00121$:
;src/main.c:279: if ((joydata & J_DOWN) && (joydata & J_RIGHT)) {
	ld	a, b
	or	a, c
	jr	Z, 00124$
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;src/main.c:280: xDir = 1;
	ld	hl, #_xDir
	ld	(hl), #0x01
;src/main.c:281: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00124$:
;src/main.c:283: if ((joydata & J_DOWN) && (joydata & J_LEFT)) {
	ld	a, b
	or	a, c
	jr	Z, 00127$
	ld	a, d
	or	a, e
	jr	Z, 00127$
;src/main.c:284: xDir = -1;
	ld	hl, #_xDir
	ld	(hl), #0xff
;src/main.c:285: yDir = 1;
	ld	hl, #_yDir
	ld	(hl), #0x01
00127$:
;src/main.c:290: if (xDir == 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00130$
	ld	a, (#_yDir)
	or	a, a
;src/main.c:291: return;
	jp	Z,00194$
00130$:
;src/main.c:323: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jp	NZ, 00194$
;src/main.c:324: if (xDir == 0 && yDir > 0) {
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
;src/main.c:328: set_sprite_prop(1, S_FLIPY); 
	jp	00194$
00157$:
;src/main.c:330: else if (xDir == 0 && yDir < 0) {
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
;src/main.c:334: set_sprite_prop(1, 0); 
	jp	00194$
00153$:
;src/main.c:336: else if (xDir > 0 && yDir == 0) {
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
;src/main.c:340: set_sprite_prop(1, 0); 
	jp	00194$
00149$:
;src/main.c:342: else if (xDir < 0 && yDir == 0) {
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
;src/main.c:346: set_sprite_prop(1, S_FLIPX); 
	jr	00194$
00145$:
;src/main.c:348: else if (xDir > 0 && yDir < 0) {
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
;src/main.c:352: set_sprite_prop(1, 0); 
	jr	00194$
00141$:
;src/main.c:354: else if (xDir > 0 && yDir > 0) {
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
;src/main.c:358: set_sprite_prop(1, S_FLIPY); 
	jr	00194$
00137$:
;src/main.c:360: else if (xDir < 0 && yDir > 0) {
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
;src/main.c:364: set_sprite_prop(1, S_FLIPY | S_FLIPX); 
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
;src/main.c:370: set_sprite_prop(1, S_FLIPX); 
00194$:
;src/main.c:375: }
	add	sp, #4
	ret
;src/main.c:409: void playSound(uint8_t type) {
;	---------------------------------
; Function playSound
; ---------------------------------
_playSound::
;src/main.c:410: if (type == 20) { //singlegun
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00102$
;src/main.c:411: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:412: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:413: NR12_REG = 0x43;
	ld	a, #0x43
	ldh	(_NR12_REG + 0), a
;src/main.c:414: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/main.c:415: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
;src/main.c:416: return;
	ret
00102$:
;src/main.c:418: if (type == 23) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x17
	jr	NZ, 00104$
;src/main.c:419: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:420: NR11_REG = 0x81;
	ld	a, #0x81
	ldh	(_NR11_REG + 0), a
;src/main.c:421: NR12_REG = 0x53;
	ld	a, #0x53
	ldh	(_NR12_REG + 0), a
;src/main.c:422: NR13_REG = 0X00;//0x6D;
	xor	a, a
	ldh	(_NR13_REG + 0), a
;src/main.c:423: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00104$:
;src/main.c:425: if (type == 26) {
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x1a
	jr	NZ, 00106$
;src/main.c:426: NR10_REG = 0x00;
	xor	a, a
	ldh	(_NR10_REG + 0), a
;src/main.c:427: NR11_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR11_REG + 0), a
;src/main.c:428: NR12_REG = 0x55;
	ld	a, #0x55
	ldh	(_NR12_REG + 0), a
;src/main.c:429: NR13_REG = 0x70;//0Xbe;//0x6D;
	ld	a, #0x70
	ldh	(_NR13_REG + 0), a
;src/main.c:430: NR14_REG = 0x84;
	ld	a, #0x84
	ldh	(_NR14_REG + 0), a
00106$:
;src/main.c:432: if (type == 0) {  // explosion
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/main.c:433: NR41_REG = 0x20;  
	ld	a, #0x20
	ldh	(_NR41_REG + 0), a
;src/main.c:434: NR42_REG = 0xa2;//0xa3;  
	ld	a, #0xa2
	ldh	(_NR42_REG + 0), a
;src/main.c:435: NR43_REG = 0x57;  
	ld	a, #0x57
	ldh	(_NR43_REG + 0), a
;src/main.c:436: NR44_REG = 0x80;  
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;src/main.c:442: }
	ret
;src/main.c:444: void initFont() {
;	---------------------------------
; Function initFont
; ---------------------------------
_initFont::
;src/main.c:445: font_init();
	call	_font_init
;src/main.c:447: min_font = font_load(font_min); // 36 tiles of characters
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_min_font
	ld	a, e
	ld	(hl+), a
;src/main.c:448: font_set(min_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;src/main.c:449: }
	ret
;src/main.c:452: void clearScreen() {
;	---------------------------------
; Function clearScreen
; ---------------------------------
_clearScreen::
;src/main.c:453: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:454: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;src/main.c:455: for (uint8_t i=0; i < 18; ++i) {
	ld	b, #0x00
00105$:
	ld	a, b
	sub	a, #0x12
	jr	NC, 00101$
;src/main.c:456: set_win_tiles(1,i,20,1,emptyRow);
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
;src/main.c:457: set_bkg_tiles(1,i,20,1,emptyRow);
	ld	de, #_emptyRow
	push	de
	ld	hl, #0x114
	push	hl
	push	bc
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:455: for (uint8_t i=0; i < 18; ++i) {
	inc	b
	jr	00105$
00101$:
;src/main.c:459: for (uint8_t j=0; j < 40; ++j) {
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
;src/main.c:459: for (uint8_t j=0; j < 40; ++j) {
	inc	c
	jr	00108$
00102$:
;src/main.c:465: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:466: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:468: }
	ret
;src/main.c:470: void initEnemies(uint8_t loadSprites) {
;	---------------------------------
; Function initEnemies
; ---------------------------------
_initEnemies::
	add	sp, #-7
;src/main.c:472: if (loadSprites) {
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/main.c:474: set_sprite_data(0x40, 13, enemy1);
	ld	de, #_enemy1
	push	de
	ld	hl, #0xd40
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:475: set_sprite_data(0x50, 32, largeenemies);
	ld	de, #_largeenemies
	push	de
	ld	hl, #0x2050
	push	hl
	call	_set_sprite_data
	add	sp, #4
00102$:
;src/main.c:478: struct Enemy *eptr = enemies;
	ld	bc, #_enemies+0
;src/main.c:480: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#6
	ld	(hl), #0x00
00116$:
	ld	hl, #_ENEMYCOUNT
	ld	e, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, e
	jp	NC, 00118$
;src/main.c:481: if (eptr->alive == 0) {
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;src/main.c:483: uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) enemyOptionCount;
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
;src/main.c:485: (*eptr) = enemyOptions[enemyInd];
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
;src/main.c:488: eptr->x = xSpawnPositions[posIndex];
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
;src/main.c:489: eptr->y = ySpawnPositions[posIndex];
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
;src/main.c:491: if (eptr->spriteCount == 1) {
	ld	hl, #0x0008
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
;src/main.c:492: set_sprite_tile(10+ (i<<1), eptr->sprite0);
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
;src/main.c:491: if (eptr->spriteCount == 1) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	dec	a
	jr	NZ, 00104$
;src/main.c:492: set_sprite_tile(10+ (i<<1), eptr->sprite0);
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
;src/main.c:493: move_sprite(10+ (i<<1), eptr->x, eptr->y);
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
;src/main.c:493: move_sprite(10+ (i<<1), eptr->x, eptr->y);
	jr	00107$
00104$:
;src/main.c:496: set_sprite_tile(10+ (i<<1), eptr->sprite0);
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
;src/main.c:497: move_sprite(10+ (i<<1), eptr->x, eptr->y);
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
;src/main.c:499: set_sprite_tile(10+ (i<<1) +1, eptr->sprite1);
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
;src/main.c:500: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
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
;src/main.c:500: move_sprite(10+ (i<<1) +1, eptr->x, eptr->y);
00107$:
;src/main.c:505: eptr++;
	ld	hl, #0x0012
	add	hl, bc
	ld	c, l
	ld	b, h
;src/main.c:480: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#6
	inc	(hl)
	jp	00116$
00118$:
;src/main.c:508: }
	add	sp, #7
	ret
;src/main.c:510: void initEnemy(uint8_t i) {
;	---------------------------------
; Function initEnemy
; ---------------------------------
_initEnemy::
	add	sp, #-5
;src/main.c:513: if (enemies[i].alive == 0) {
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
;src/main.c:515: uint8_t enemyInd = ((uint8_t)rand()) % (uint8_t) enemyOptionCount;
	call	_rand
	ld	a, e
	ld	hl, #_enemyOptionCount
	ld	b, (hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	__moduchar
	pop	hl
;src/main.c:516: enemies[i] = enemyOptions[enemyInd];
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
;src/main.c:518: uint8_t posIndex =  ((uint8_t)rand()) % (uint8_t)8;//(rand() & 8);
	call	_rand
	ldhl	sp,#4
	ld	(hl), e
	ld	a, (hl)
	and	a, #0x07
	ld	(hl), a
;src/main.c:519: enemies[i].x = xSpawnPositions[posIndex];
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
;src/main.c:520: enemies[i].y = ySpawnPositions[posIndex];
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
;src/main.c:521: enemies[i].hp += difficulty % HPSCALESPEED;
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
;src/main.c:522: enemies[i].damage += difficulty & ATTACKSCALESPEED;
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
;src/main.c:523: difficulty += 1;
	ld	hl, #_difficulty
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:525: if (enemies[i].spriteCount == 1) {
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
;src/main.c:526: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
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
;src/main.c:525: if (enemies[i].spriteCount == 1) {
	dec	b
	jr	NZ, 00102$
;src/main.c:526: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
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
;src/main.c:526: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
	jr	00109$
00102$:
;src/main.c:530: set_sprite_tile(10+ (i<<1), enemies[i].sprite0);
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
;src/main.c:533: set_sprite_tile(10+ (i<<1) +1, enemies[i].sprite1);
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
;src/main.c:533: set_sprite_tile(10+ (i<<1) +1, enemies[i].sprite1);
00109$:
;src/main.c:542: }
	add	sp, #5
	ret
;src/main.c:545: void updateEnemyPositions() {
;	---------------------------------
; Function updateEnemyPositions
; ---------------------------------
_updateEnemyPositions::
	add	sp, #-16
;src/main.c:548: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	ld	(hl), #0x00
00197$:
	ld	hl, #_ENEMYCOUNT
	ld	c, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jp	NC, 00145$
;src/main.c:549: if (!enemies[i].alive) {
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
;src/main.c:557: if (enemies[i].x < playerDrawX) {
	ld	bc,#_enemies
	add	hl,bc
	inc	sp
	inc	sp
;src/main.c:549: if (!enemies[i].alive) {
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
;src/main.c:552: enemies[i].x -= xOverflow;
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
;src/main.c:553: enemies[i].y -= yOverflow;
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
;src/main.c:556: if (abs(enemies[i].x - playerDrawX) > 8) {
	ldhl	sp,	#13
	ld	a, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:399: if (value >= 0) return value;
	bit	7, c
	jr	NZ, 00170$
	ld	b, c
	jr	00172$
00170$:
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, c
	ld	b, a
;src/main.c:556: if (abs(enemies[i].x - playerDrawX) > 8) {
00172$:
;src/main.c:571: enemies[i].ySpeed += enemies[i].accel;
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
;src/main.c:558: enemies[i].xSpeed += enemies[i].accel;
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
;src/main.c:565: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/main.c:556: if (abs(enemies[i].x - playerDrawX) > 8) {
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
;src/main.c:557: if (enemies[i].x < playerDrawX) {
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
;src/main.c:558: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;src/main.c:557: if (enemies[i].x < playerDrawX) {
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
;src/main.c:558: enemies[i].xSpeed += enemies[i].accel;
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
;src/main.c:561: enemies[i].xSpeed -= enemies[i].accel;
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
;src/main.c:565: if (enemies[i].xSpeed > 0) enemies[i].xSpeed--;
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
;src/main.c:566: if (enemies[i].xSpeed < 0) enemies[i].xSpeed++;
	bit	7, c
	jr	Z, 00112$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00112$:
;src/main.c:569: if (abs(enemies[i].y - playerDrawY) > 8) {
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, l
	jr	NZ, 00174$
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	jr	00176$
00174$:
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, l
	ld	e, a
	ldhl	sp,	#14
	ld	(hl), e
;src/main.c:569: if (abs(enemies[i].y - playerDrawY) > 8) {
00176$:
;src/main.c:571: enemies[i].ySpeed += enemies[i].accel;
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
;src/main.c:578: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;src/main.c:569: if (abs(enemies[i].y - playerDrawY) > 8) {
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
;src/main.c:570: if (enemies[i].y < playerDrawY) {
	ld	a, (#_playerDrawY)
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:558: enemies[i].xSpeed += enemies[i].accel;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
;src/main.c:570: if (enemies[i].y < playerDrawY) {
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
;src/main.c:571: enemies[i].ySpeed += enemies[i].accel;
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
;src/main.c:574: enemies[i].ySpeed -= enemies[i].accel;
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
;src/main.c:578: if (enemies[i].ySpeed > 0) enemies[i].ySpeed--;
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
;src/main.c:579: if (enemies[i].ySpeed < 0) enemies[i].ySpeed++;
	bit	7, c
	jr	Z, 00122$
	inc	c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
00122$:
;src/main.c:583: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
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
;src/main.c:380: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:583: enemies[i].xSpeed = clamp(enemies[i].xSpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:584: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
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
;src/main.c:380: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:584: enemies[i].ySpeed = clamp(enemies[i].ySpeed, -enemies[i].speed, enemies[i].speed);
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;src/main.c:587: enemies[i].xReserve += enemies[i].xSpeed;
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
;src/main.c:588: enemies[i].yReserve += enemies[i].ySpeed;
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
;src/main.c:592: if (enemies[i].xReserve >> 3 > 0) {
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
;src/main.c:593: int8_t xMovement = enemies[i].xReserve >> 3;
	ldhl	sp,	#14
	ld	a, (hl)
	sra	a
	sra	a
	sra	a
	ld	(hl), a
;src/main.c:594: enemies[i].x += xMovement;
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
;src/main.c:595: enemies[i].xReserve -=  xMovement << 3;
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
;src/main.c:598: else if ((-enemies[i].xReserve) >> 3 > 0){
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
;src/main.c:599: int8_t xMovement = -((-enemies[i].xReserve) >> 3);
	xor	a, a
	sub	a, c
	ld	c, a
	ldhl	sp,	#14
	ld	(hl), c
;src/main.c:600: enemies[i].x += xMovement;
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
;src/main.c:601: enemies[i].xReserve +=  (-xMovement) << 3;
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
;src/main.c:588: enemies[i].yReserve += enemies[i].ySpeed;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
;src/main.c:604: if (enemies[i].yReserve >> 3 > 0) {
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
;src/main.c:605: int8_t yMovement = enemies[i].yReserve >> 3;
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;src/main.c:606: enemies[i].y += yMovement;
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
;src/main.c:607: enemies[i].yReserve -=  yMovement << 3;
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
;src/main.c:609: else if ((-enemies[i].yReserve) >> 3 > 0){
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
;src/main.c:610: int8_t yMovement = -((-enemies[i].yReserve) >> 3);
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	c, a
	xor	a, a
	sub	a, c
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;src/main.c:611: enemies[i].y += yMovement;
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
;src/main.c:612: enemies[i].yReserve +=  (-yMovement) << 3;
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
;src/main.c:617: if (auxTick == 1) {
	ld	a, (#_auxTick)
	dec	a
	jp	NZ,00144$
;src/main.c:619: if (enemies[i].spriteCount == 1) {
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
;src/main.c:620: move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
	ldhl	sp,	#15
	ld	a, (hl-)
	add	a, a
	ld	c, a
	add	a, #0x0a
	ld	(hl), a
;src/main.c:619: if (enemies[i].spriteCount == 1) {
	dec	b
	jr	NZ, 00140$
;src/main.c:620: move_sprite(10+ (i<<1), enemies[i].x+4, enemies[i].y+12);
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
;src/main.c:621: if (enemies[i].xSpeed >= 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	bit	7,a
	jr	NZ, 00134$
;src/main.c:622: set_sprite_prop(10+(i<<1), 0);
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
;src/main.c:622: set_sprite_prop(10+(i<<1), 0);
	jp	00144$
00134$:
;src/main.c:625: set_sprite_prop(10+(i<<1), S_FLIPX);
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
;src/main.c:625: set_sprite_prop(10+(i<<1), S_FLIPX);
	jp	00144$
00140$:
;src/main.c:630: if (enemies[i].xSpeed >= 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	bit	7,a
	jr	NZ, 00137$
;src/main.c:631: set_sprite_prop(10+(i<<1), 0);
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
;src/main.c:632: set_sprite_prop(10+(i<<1)+1, 0);
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
;src/main.c:633: move_sprite(10+ (i<<1), enemies[i].x , enemies[i].y + 8);
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
;src/main.c:634: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
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
;src/main.c:634: move_sprite(10+ (i<<1)+1, enemies[i].x +8, enemies[i].y +8);
	jr	00144$
00137$:
;src/main.c:637: set_sprite_prop(10+(i<<1), S_FLIPX);
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
;src/main.c:638: set_sprite_prop(10+(i<<1)+1, S_FLIPX);
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
;src/main.c:639: move_sprite(10+ (i<<1), enemies[i].x +8, enemies[i].y + 8);
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
;src/main.c:640: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
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
;src/main.c:640: move_sprite(10+ (i<<1)+1, enemies[i].x, enemies[i].y +8);
00144$:
;src/main.c:548: for (uint8_t i = 0; i < ENEMYCOUNT; ++i) {
	ldhl	sp,	#15
	inc	(hl)
	jp	00197$
00145$:
;src/main.c:650: uint8_t i = enemyCollisionCount;
	ld	a, (#_enemyCollisionCount)
	ldhl	sp,	#1
	ld	(hl), a
;src/main.c:652: if (enemies[i].alive) {
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
;src/main.c:653: if (enemies[i].visible == 1) {
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
;src/main.c:654: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
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
;src/main.c:656: set_sprite_tile(10+(i<<1), 0x7f);
	ldhl	sp,	#1
	ld	e, (hl)
;src/main.c:654: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#12
;src/main.c:656: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl+), a
	ld	a, e
	add	a, a
;src/main.c:654: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	rlca
	and	a,#0x01
;src/main.c:656: set_sprite_tile(10+(i<<1), 0x7f);
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	add	a, #0x0a
	ld	(hl), a
;src/main.c:653: if (enemies[i].visible == 1) {
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	NZ, 00165$
;src/main.c:654: if (enemies[i].x < 0 || enemies[i].x > 172 || enemies[i].y < 0 || enemies[i].y > 152) {
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
;src/main.c:655: enemies[i].visible = 0;
	xor	a, a
	ld	(bc), a
;src/main.c:656: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:657: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:657: set_sprite_tile(10+(i<<1)+1, 0x7f);
	jp	00198$
00165$:
;src/main.c:661: if (enemies[i].x >= 0 && enemies[i].x < 172 && enemies[i].y > 0 && enemies[i].y < 152) {
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
;src/main.c:662: enemies[i].visible = 1;
	ld	a, #0x01
	ld	(bc), a
;src/main.c:663: set_sprite_tile(10+(i<<1), enemies[i].sprite0);
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
;src/main.c:664: if (enemies[i].spriteCount == 2) {
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
;src/main.c:665: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
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
;src/main.c:665: set_sprite_tile(10+(i<<1)+1, enemies[i].sprite1);
	jp	00198$
00159$:
;src/main.c:668: else if (enemies[i].x < -100 || enemies[i].x > 272 || enemies[i].y < -100 || enemies[i].y > 252) {
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
;src/main.c:669: enemies[i].alive = 0;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:670: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:671: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:672: initEnemy(i);
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00198$:
;src/main.c:678: }
	add	sp, #16
	ret
;src/main.c:683: void move() {
;	---------------------------------
; Function move
; ---------------------------------
_move::
	add	sp, #-4
;src/main.c:686: if (joydata & J_A) {
	ld	a, (#_joydata)
	bit	4, a
	jr	Z, 00102$
;src/main.c:687: xSpeed += xDir + xDir + xDir;
	ld	hl, #_xDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_xSpeed
	add	a, (hl)
	ld	(hl), a
;src/main.c:688: ySpeed += yDir + yDir + yDir;
	ld	hl, #_yDir
	ld	a, (hl)
	add	a, a
	add	a, (hl)
	ld	hl, #_ySpeed
	add	a, (hl)
	ld	(hl), a
00102$:
;src/main.c:692: xSpeed = clamp(xSpeed, -100, 100);
	ld	hl, #_xSpeed
	ld	c, (hl)
;src/main.c:380: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:693: ySpeed = clamp(ySpeed, -100, 100);
	ld	hl, #_ySpeed
	ld	c, (hl)
;src/main.c:380: return (value < min) ? min : (value > max) ? max : value;
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
;src/main.c:695: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:696: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:701: uint8_t xCollisionPoint = playerDrawX; 
	ld	hl, #_playerDrawX
	ld	c, (hl)
;src/main.c:704: xCollisionPoint = playerDrawX +8; //right edge
	ld	b, (hl)
;src/main.c:703: if (xSpeed > 0) {
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
;src/main.c:704: xCollisionPoint = playerDrawX +8; //right edge
	ld	a, b
	add	a, #0x08
	ld	c, a
00104$:
;src/main.c:706: if (xSpeed < 0) {
	ld	a, (#_xSpeed)
	bit	7, a
	jr	Z, 00106$
;src/main.c:707: xCollisionPoint = playerDrawX -8; //left edge
	ld	a, b
	add	a, #0xf8
	ld	c, a
00106$:
;src/main.c:711: int16_t bgindX = ((xCollisionPoint + bgX) >> 3)%32;
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
;src/main.c:715: uint8_t bgindY = ((playerDrawY + bgY) >> 3)%32; 
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
;src/main.c:718: uint16_t ind = 32*bgindY + bgindX;
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
;src/main.c:719: uint8_t result = 1; // 0 incase of clear path, 1 for blocked
	ldhl	sp,	#0
	ld	(hl), #0x01
;src/main.c:720: for (uint8_t i=0; i<BLANKSIZE; i++) {
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
;src/main.c:721: if ((*(collisionTiles+ind)) == BLANK[i] ) {
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
;src/main.c:722: result = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;src/main.c:723: break;
	jr	00109$
00159$:
;src/main.c:720: for (uint8_t i=0; i<BLANKSIZE; i++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00158$
00109$:
;src/main.c:727: if (result == 0) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	NZ, 00114$
;src/main.c:728: playerX+=xSpeed;
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
;src/main.c:730: uint16_t limitedPlayerX = u16Clamp(playerX, 68<<5, 92<<5);//0->160, with 8 px margin for left edge & 50px for the edges
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
;src/main.c:732: xOverflow = (playerX - limitedPlayerX);
	ld	a, (#_playerX)
	sub	a, e
	ld	(#_xOverflow),a
	ld	a, (#_playerX + 1)
	sbc	a, d
	ld	hl, #_xOverflow + 1
;src/main.c:733: if (xOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_xOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00111$
;src/main.c:734: xOverflow = xOverflow >> 5;
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
;src/main.c:737: xOverflow = -((-xOverflow) >> 5);
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
;src/main.c:739: bgX += xOverflow;
	ld	a, (#_bgX)
	ld	hl, #_xOverflow
	add	a, (hl)
	ld	hl, #_bgX
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_xOverflow + 1
	adc	a, (hl)
	ld	(#_bgX + 1),a
;src/main.c:740: playerX = limitedPlayerX;
	ld	hl, #_playerX
	ld	a, c
	ld	(hl+), a
;src/main.c:741: playerDrawX=playerX >> 5;
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
;src/main.c:749: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
00115$:
;src/main.c:757: uint8_t yCollisionPoint = playerDrawY; 
	ld	hl, #_playerDrawY
	ld	c, (hl)
;src/main.c:760: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	b, (hl)
;src/main.c:759: if (ySpeed > 0) {
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
;src/main.c:760: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, b
	add	a, #0x08
	ld	c, a
00117$:
;src/main.c:762: if (ySpeed < 0) {
	ld	a, (#_ySpeed)
	bit	7, a
	jr	Z, 00119$
;src/main.c:763: yCollisionPoint = playerDrawY -8; //top edge, 
	ld	a, b
	add	a, #0xf8
	ld	c, a
00119$:
;src/main.c:767: bgindX = ((playerDrawX + bgX) >> 3)%32;
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
;src/main.c:770: bgindY = ((yCollisionPoint + bgY) >> 3)%32; 
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
;src/main.c:773: ind = 32*bgindY + bgindX;
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
;src/main.c:774: result = 1;
;src/main.c:775: for (uint8_t j=0; j<BLANKSIZE; j++) {
	ld	de, #0x1
00161$:
	ld	a, d
	ldhl	sp,	#1
	sub	a, (hl)
	jr	NC, 00122$
;src/main.c:776: if ((*(collisionTiles+ind)) == BLANK[j] ) {
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
;src/main.c:777: result = 0;
	sub	a,b
	jr	NZ, 00162$
	ld	e,a
;src/main.c:778: break;
	jr	00122$
00162$:
;src/main.c:775: for (uint8_t j=0; j<BLANKSIZE; j++) {
	inc	d
	jr	00161$
00122$:
;src/main.c:782: if (result == 0) {
	ld	a, e
	or	a, a
	jp	NZ, 00127$
;src/main.c:783: playerY += ySpeed;
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
;src/main.c:785: uint16_t limitedPlayerY = u16Clamp(playerY, 48<<5, 78<<5);//0->144, with 16px margin for top & -8 for bottom, 45px for edges
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
;src/main.c:787: yOverflow = (playerY - limitedPlayerY);
	ld	a, (#_playerY)
	sub	a, e
	ld	(#_yOverflow),a
	ld	a, (#_playerY + 1)
	sbc	a, d
	ld	hl, #_yOverflow + 1
;src/main.c:788: if (yOverflow >= 0) {
	ld	(hl-), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_yOverflow + 1)
;	spillPairReg hl
;	spillPairReg hl
	bit	7,a
	jr	NZ, 00124$
;src/main.c:789: yOverflow = yOverflow >> 5;
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
;src/main.c:792: yOverflow = -((-yOverflow) >> 5);
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
;src/main.c:794: bgY += yOverflow;
	ld	a, (#_bgY)
	ld	hl, #_yOverflow
	add	a, (hl)
	ld	hl, #_bgY
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_yOverflow + 1
	adc	a, (hl)
	ld	(#_bgY + 1),a
;src/main.c:795: playerY = limitedPlayerY;
	ld	hl, #_playerY
	ld	a, c
	ld	(hl+), a
;src/main.c:796: playerDrawY=playerY >> 5;
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
;src/main.c:801: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
00128$:
;src/main.c:701: uint8_t xCollisionPoint = playerDrawX; 
	ld	a, (#_playerDrawX)
	ldhl	sp,	#3
	ld	(hl), a
;src/main.c:760: yCollisionPoint = playerDrawY +8; //bottom edge
	ld	a, (#_playerDrawY)
	add	a, #0x08
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:804: if (xDir >= 0) {
	ld	a, (#_xDir)
	bit	7, a
	jr	NZ, 00130$
;src/main.c:805: move_sprite(0, playerDrawX , playerDrawY + 8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	de, #_shadow_OAM
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 1)
	ld	a, (hl)
	ld	(de), a
;src/main.c:807: move_sprite(1, playerDrawX +8, playerDrawY +8);
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
;src/main.c:807: move_sprite(1, playerDrawX +8, playerDrawY +8);
	jr	00131$
00130$:
;src/main.c:810: move_sprite(1, playerDrawX , playerDrawY +8);
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 4)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/main.c:812: move_sprite(0, playerDrawX +8, playerDrawY +8);
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
;src/main.c:812: move_sprite(0, playerDrawX +8, playerDrawY +8);
00131$:
;src/main.c:817: if (bgX >= 256) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00133$
;src/main.c:818: bgX = bgX % 256;
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
;src/main.c:820: if (bgX < 0) {
	ld	hl, #_bgX
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00135$
;src/main.c:821: bgX = 255 - (bgX % 256);
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
;src/main.c:823: if (bgY >= 256) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	xor	a, #0x80
	sub	a, #0x81
	jr	C, 00137$
;src/main.c:824: bgY = bgY % 256;
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
;src/main.c:826: if (bgY < 0) {
	ld	hl, #_bgY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00139$
;src/main.c:827: bgY = 255 - (bgY % 256);
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
;src/main.c:830: move_bkg(bgX, bgY);
	ld	hl, #_bgY
	ld	c, (hl)
	ld	a, (#_bgX)
	ldh	(_SCX_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/main.c:833: if (ySpeed > 0) ySpeed--;
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
;src/main.c:834: if (ySpeed < 0) ySpeed++;
	ld	hl, #_ySpeed
	bit	7, (hl)
	jr	Z, 00143$
	inc	(hl)
00143$:
;src/main.c:835: if (xSpeed > 0) xSpeed--;
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
;src/main.c:836: if (xSpeed < 0) xSpeed++;
	ld	hl, #_xSpeed
	bit	7, (hl)
	jr	Z, 00163$
	inc	(hl)
00163$:
;src/main.c:840: }
	add	sp, #4
	ret
;src/main.c:842: void takeDamage(int16_t amount) {
;	---------------------------------
; Function takeDamage
; ---------------------------------
_takeDamage::
	dec	sp
;src/main.c:843: if (amount > shield) {
	ld	a, (#_shield)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
;src/main.c:845: hull -= (amount - shield);
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;src/main.c:843: if (amount > shield) {
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
;src/main.c:844: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;src/main.c:845: hull -= (amount - shield);
	ld	a, (#_hull)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_hull),a
	jr	00104$
00102$:
;src/main.c:848: shield -= amount;
	ld	a, (#_shield)
	ldhl	sp,	#0
	sub	a, (hl)
	ld	(#_shield),a
00104$:
;src/main.c:850: }
	inc	sp
	ret
;src/main.c:852: void spawnPickup(int16_t x, int16_t y) {
;	---------------------------------
; Function spawnPickup
; ---------------------------------
_spawnPickup::
;src/main.c:853: uint8_t spawn = ((uint8_t)rand()) % (uint8_t) 8;
	call	_rand
	ld	a, e
	and	a, #0x07
	ret	NZ
;src/main.c:854: if (spawn == 0) {
;src/main.c:855: uint8_t type = ((uint8_t)rand()) % (uint8_t) 3;
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
;src/main.c:856: if (type == 0) {
	ld	a,e
	ld	c,a
	or	a, a
	jr	NZ, 00106$
;src/main.c:857: pickup = health;
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
;src/main.c:859: else if (type == 1 && gunLevel < MAXGUNLEVEL) {
	dec	c
	jr	NZ, 00102$
	ld	hl, #_MAXGUNLEVEL
	ld	c, (hl)
	ld	a, (#_gunLevel)
	sub	a, c
	jr	NC, 00102$
;src/main.c:860: pickup = upgrade;
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
;src/main.c:863: pickup = ammo;
	ld	bc, #_pickup
	ld	de, #0x0009
	push	de
	ld	de, #_ammo
	push	de
	push	bc
	call	___memcpy
	add	sp, #6
00107$:
;src/main.c:865: pickup.active = 1;
	ld	hl, #(_pickup + 5)
	ld	(hl), #0x01
;src/main.c:867: pickup.x = x;
	ld	de, #(_pickup + 1)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/main.c:868: pickup.y = y;
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_pickup + 3)
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:870: set_sprite_tile(3, pickup.tile); //0x7f
	ld	hl, #(_pickup + 8)
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;src/main.c:870: set_sprite_tile(3, pickup.tile); //0x7f
;src/main.c:876: }
	ret
;src/main.c:878: void killEnemy(uint8_t i) {
;	---------------------------------
; Function killEnemy
; ---------------------------------
_killEnemy::
	add	sp, #-4
;src/main.c:879: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:880: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:882: spawnPickup(enemies[i].x, enemies[i].y);
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
;src/main.c:884: enemies[i].alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:885: enemies[i].visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:887: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:888: incrementScore();
	call	_incrementScore
;src/main.c:889: updateScore();
	call	_updateScore
;src/main.c:891: explosions[oldestEx].visible = 1;
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
;src/main.c:892: explosions[oldestEx].x = enemies[i].x;
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
;src/main.c:893: explosions[oldestEx].y = enemies[i].y;
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
;src/main.c:896: uint8_t tileNum = ((uint8_t)rand()) % exTileCount;
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
;src/main.c:898: explosions[oldestEx].tile = exTiles[tileNum];
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
;src/main.c:899: explosions[oldestEx].frame = 0;
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
;src/main.c:900: explosions[oldestEx].frameCounter = 0;
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
;src/main.c:902: set_sprite_tile(20 + oldestEx+oldestEx, explosions[oldestEx].tile + (explosions[oldestEx].frame<<1));
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
;src/main.c:903: set_sprite_tile(21 + oldestEx+oldestEx, explosions[oldestEx].tile+(explosions[oldestEx].frame<<1) +2);
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
;src/main.c:908: oldestEx++;
	ld	hl, #_oldestEx
	inc	(hl)
;src/main.c:909: if (oldestEx >= exCount) {
	ld	hl, #_exCount
	ld	c, (hl)
	ld	hl, #_oldestEx
	ld	a, (hl)
	sub	a, c
	jr	C, 00107$
;src/main.c:910: oldestEx = 0;
	ld	(hl), #0x00
00107$:
;src/main.c:914: }
	add	sp, #4
	ret
;src/main.c:916: void checkCollision() {
;	---------------------------------
; Function checkCollision
; ---------------------------------
_checkCollision::
	add	sp, #-23
;src/main.c:923: struct Enemy *eptr = enemies + enemyCollisionCount;
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
;src/main.c:924: uint8_t i = enemyCollisionCount;
	ld	a, (#_enemyCollisionCount)
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:926: if (eptr->visible && eptr->alive) {
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
;src/main.c:928: uint8_t alive = 1;
	ldhl	sp,	#18
	ld	(hl), #0x01
;src/main.c:931: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
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
;src/main.c:932: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00352$
	xor	a, a
00352$:
	ldhl	sp,	#21
;src/main.c:931: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00147$
;src/main.c:400: else return - value;
	xor	a, a
	ldhl	sp,	#22
	sub	a, (hl)
	ld	c, a
	ld	(hl), c
;src/main.c:931: if ((eptr->spriteCount == 1 && abs(eptr->x - playerDrawX) <= 8 ) || 
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
;src/main.c:932: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, c
	jr	NZ, 00149$
	ld	b, c
	jr	00151$
00149$:
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, c
	ld	b, a
;src/main.c:932: (eptr->spriteCount == 2 && abs(eptr->x - playerDrawX) <= 16 )) {
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
;src/main.c:933: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00155$
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:933: if ((eptr->spriteCount == 1 && abs(eptr->y - playerDrawY) <= 8 ) || 
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
;src/main.c:934: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	jp	Z, 00107$
	inc	hl
	ld	a, (bc)
	sub	a, (hl)
	ld	c, a
;src/main.c:399: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00159$
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:934: (eptr->spriteCount == 2 && abs(eptr->y - playerDrawY) <= 16 )) {
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
;src/main.c:936: set_sprite_tile(10+(i<<1), 0x7f);
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
;src/main.c:937: set_sprite_tile(10+(i<<1)+1, 0x7f);
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
;src/main.c:938: eptr->alive = 0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:939: eptr->visible = 0;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/main.c:940: takeDamage(eptr->damage);
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
;src/main.c:941: initEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
;src/main.c:942: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:944: alive = 0;
	ldhl	sp,	#18
	ld	(hl), #0x00
00107$:
;src/main.c:950: if (alive) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00139$
;src/main.c:951: struct Projectile *pptr = projectiles;
	inc	hl
	ld	a, #<(_projectiles)
	ld	(hl+), a
	ld	(hl), #>(_projectiles)
;src/main.c:953: while (j < PROJECTILECOUNT) {
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
;src/main.c:954: if (pptr->active) {
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
;src/main.c:956: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
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
;src/main.c:957: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00364$
	xor	a, a
00364$:
	ldhl	sp,	#18
;src/main.c:956: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00165$
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:956: if ((eptr->spriteCount == 1 && abs(eptr->x - pptr->x) <= 8 ) || 
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
;src/main.c:957: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, (hl)
	jr	NZ, 00167$
	ld	c, (hl)
	jr	00169$
00167$:
;src/main.c:400: else return - value;
	xor	a, a
	ldhl	sp,	#22
	sub	a, (hl)
	ld	c, a
;src/main.c:957: (eptr->spriteCount == 2 && abs(eptr->x - pptr->x) <= 16 )) {
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
;src/main.c:958: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, l
	jr	Z, 00173$
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;src/main.c:958: if ((eptr->spriteCount == 1 && abs(eptr->y - pptr->y) <= 8 ) || 
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
;src/main.c:959: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
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
;src/main.c:399: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00177$
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:959: (eptr->spriteCount == 2 && abs(eptr->y - pptr->y) <= 16 )) {
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
;src/main.c:961: set_sprite_tile(30+j, 0x7f);
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
;src/main.c:962: pptr->active = 0;
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
;src/main.c:964: if (pptr->type == 0x2c) { //missile
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
;src/main.c:969: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
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
;src/main.c:964: if (pptr->type == 0x2c) { //missile
	ld	a, e
	sub	a, #0x2c
	jp	NZ,00119$
;src/main.c:969: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
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
;src/main.c:970: int16_t dmgDropOff = ((i16abs(eptr->x - enemies[k].x) + i16abs(eptr->y - enemies[k].y))<<SPLASHDROPOFF);
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
;src/main.c:971: int16_t dmg = pptr->damage - dmgDropOff;
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
;src/main.c:972: if (dmg > 0) {
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
;src/main.c:973: enemies[k].hp -= dmg;
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
;src/main.c:974: if (enemies[k].hp <= 0) {
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
;src/main.c:975: killEnemy(k);
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	call	_killEnemy
	inc	sp
;src/main.c:976: initEnemy(k);
	ldhl	sp,	#22
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00189$:
;src/main.c:969: for (uint8_t k=0; k < ENEMYCOUNT;++k) {
	ldhl	sp,	#22
	inc	(hl)
	jp	00188$
00119$:
;src/main.c:984: eptr->hp -= pptr->damage;
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
;src/main.c:986: if (eptr->hp <= 0) {
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
;src/main.c:988: killEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_killEnemy
	inc	sp
;src/main.c:989: initEnemy(i);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_initEnemy
	inc	sp
00132$:
;src/main.c:1001: j++;
	ldhl	sp,	#21
	inc	(hl)
;src/main.c:1002: pptr++;
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
;src/main.c:1008: if (enemyCollisionCount == 0) {
	ld	a, (#_enemyCollisionCount)
	or	a, a
	jr	NZ, 00142$
;src/main.c:1009: enemyCollisionCount = ENEMYCOUNT - 1;
	ld	a, (#_ENEMYCOUNT)
	dec	a
	ld	(#_enemyCollisionCount),a
	jr	00190$
00142$:
;src/main.c:1012: enemyCollisionCount--;
	ld	hl, #_enemyCollisionCount
	dec	(hl)
00190$:
;src/main.c:1017: }
	add	sp, #23
	ret
;src/main.c:1020: void setGunIcon() {
;	---------------------------------
; Function setGunIcon
; ---------------------------------
_setGunIcon::
;src/main.c:1022: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00102$
;src/main.c:1023: set_win_tiles(15, 0,1,1,gunMap+gunLevel);
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
;src/main.c:1026: set_win_tiles(15, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1028: }
	ret
;src/main.c:1038: void fire() {
;	---------------------------------
; Function fire
; ---------------------------------
_fire::
	add	sp, #-5
;src/main.c:1040: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	inc	(hl)
	ld	a, (hl)
;src/main.c:1041: if (oldestProjectile >= PROJECTILECOUNT) {
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ld	hl, #_oldestProjectile
	ld	a, (hl)
	sub	a, c
	jr	C, 00102$
;src/main.c:1042: oldestProjectile = 0;
	ld	(hl), #0x00
00102$:
;src/main.c:1047: projectiles[oldestProjectile] = singleGun;
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
;src/main.c:1045: if (currentGun == 0) {
	ld	a, (#_currentGun)
	or	a, a
	jr	NZ, 00113$
;src/main.c:1046: if (gunLevel == 0) {
	ld	a, (#_gunLevel)
	or	a, a
	jr	NZ, 00104$
;src/main.c:1047: projectiles[oldestProjectile] = singleGun;
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
;src/main.c:1050: projectiles[oldestProjectile] = doubleGun;
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
;src/main.c:1053: else if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00114$
;src/main.c:1054: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00107$
;src/main.c:1055: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:1056: setGunIcon();
	call	_setGunIcon
;src/main.c:1057: return;
	jp	00155$
00107$:
;src/main.c:1060: projectiles[oldestProjectile] = missile;
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
;src/main.c:1061: updateMissileCount(-1);
	ld	a, #0xff
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:1063: if (missiles == 0) {
	ld	a, (#_missiles)
	or	a, a
	jr	NZ, 00114$
;src/main.c:1064: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
;src/main.c:1065: setGunIcon();
	call	_setGunIcon
00114$:
;src/main.c:1068: projectiles[oldestProjectile].x = playerDrawX;
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
;src/main.c:1069: projectiles[oldestProjectile].y = playerDrawY;
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
;src/main.c:1070: projectiles[oldestProjectile].xSpeed = xDir * projectiles[oldestProjectile].speed;
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
;src/main.c:1071: projectiles[oldestProjectile].ySpeed = yDir * projectiles[oldestProjectile].speed;
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
;src/main.c:1040: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1047: projectiles[oldestProjectile] = singleGun;
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
;src/main.c:1076: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
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
;src/main.c:1075: if (yDir != 0 && xDir == 0) {
	ld	a, (#_yDir)
	or	a, a
	jr	Z, 00141$
	ld	a, (#_xDir)
	or	a, a
	jr	NZ, 00141$
;src/main.c:1076: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
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
;src/main.c:1040: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
;src/main.c:1076: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	add	a, #0x1e
	ld	c, a
;src/main.c:1077: if (yDir == 1) {
	ld	a, (#_yDir)
;src/main.c:1078: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
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
;src/main.c:1079: projectiles[oldestProjectile].offset = 4;
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
;src/main.c:1082: set_sprite_prop(30+oldestProjectile, 0); 
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
;src/main.c:1083: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1087: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
;src/main.c:1086: else if (xDir != 0 && yDir == 0) {
	ld	a, (#_xDir)
	or	a, a
	jp	Z, 00137$
	ld	a, (#_yDir)
	or	a, a
	jp	NZ, 00137$
;src/main.c:1087: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+2);
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
;src/main.c:1040: oldestProjectile += 1;
	ld	a, (#_oldestProjectile)
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1076: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	a, (hl)
	add	a, #0x1e
	ld	(hl), a
;src/main.c:1088: if (xDir == 1) {
	ld	a, (#_xDir)
	dec	a
	jr	NZ, 00119$
;src/main.c:1089: set_sprite_prop(30+oldestProjectile, 0);
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
;src/main.c:1090: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1093: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
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
;src/main.c:1094: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1098: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type+4);
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
;src/main.c:1099: if (xDir == 1 && yDir == -1) {
	ld	a, (#_xDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00268$
	xor	a, a
00268$:
	ldhl	sp,	#4
	ld	(hl), a
;src/main.c:1040: oldestProjectile += 1;
	ld	hl, #_oldestProjectile
	ld	c, (hl)
;src/main.c:1099: if (xDir == 1 && yDir == -1) {
	ld	a, (#_yDir)
	inc	a
	ld	a, #0x01
	jr	Z, 00270$
	xor	a, a
00270$:
	ldhl	sp,	#1
;src/main.c:1076: set_sprite_tile(30+oldestProjectile, projectiles[oldestProjectile].type);
	ld	(hl+), a
	ld	a, c
	add	a, #0x1e
;src/main.c:1099: if (xDir == 1 && yDir == -1) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00133$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
;src/main.c:1100: set_sprite_prop(30+oldestProjectile, 0); //default is right & up
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
;src/main.c:1101: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1077: if (yDir == 1) {
	ld	a, (#_yDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00273$
	xor	a, a
00273$:
	ldhl	sp,	#3
;src/main.c:1103: else if (xDir == 1 && yDir == 1) {
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00129$
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00129$
;src/main.c:1104: set_sprite_prop(30+oldestProjectile, S_FLIPY); 
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
;src/main.c:1105: projectiles[oldestProjectile].offset = 4;
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
;src/main.c:1107: else if (xDir == -1 && yDir == 1) {
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
;src/main.c:1108: set_sprite_prop(30+oldestProjectile, S_FLIPY | S_FLIPX);
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
;src/main.c:1109: projectiles[oldestProjectile].offset = 4;
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
;src/main.c:1111: else if (xDir == -1 && yDir == -1) {
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
;src/main.c:1112: set_sprite_prop(30+oldestProjectile, S_FLIPX); 
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
;src/main.c:1113: projectiles[oldestProjectile].offset = 12;
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
;src/main.c:1117: fireCooldown = projectiles[oldestProjectile].delay;
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
;src/main.c:1123: }
	add	sp, #5
	ret
;src/main.c:1126: void moveProjectiles() {
;	---------------------------------
; Function moveProjectiles
; ---------------------------------
_moveProjectiles::
	add	sp, #-10
;src/main.c:1127: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#9
	ld	(hl), #0x00
00112$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, c
	jp	NC, 00114$
;src/main.c:1128: if (projectiles[i].active) {
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
;src/main.c:1129: projectiles[i].x -= xOverflow;
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
;src/main.c:1130: projectiles[i].y -= yOverflow;
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
;src/main.c:1132: int16_t newY = projectiles[i].y + projectiles[i].ySpeed;
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
;src/main.c:1133: int16_t newX = projectiles[i].x + projectiles[i].xSpeed;
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
;src/main.c:1136: projectiles[i].y = newY;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:1137: projectiles[i].x = newX;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/main.c:1141: move_sprite(30+i, newX +4 , newY + projectiles[i].offset);
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
;src/main.c:1145: if (projectiles[i].x < 0 || projectiles[i].x > 170 || projectiles[i].y < 0 || projectiles[i].y > 154) {
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
;src/main.c:1146: projectiles[i].active = 0;
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
;src/main.c:1147: set_sprite_tile(30+i, 0x7f);
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
;src/main.c:1147: set_sprite_tile(30+i, 0x7f);
00113$:
;src/main.c:1127: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	ldhl	sp,	#9
	inc	(hl)
	jp	00112$
00114$:
;src/main.c:1152: }
	add	sp, #10
	ret
;src/main.c:1154: void tickPickups() {
;	---------------------------------
; Function tickPickups
; ---------------------------------
_tickPickups::
	dec	sp
	dec	sp
;src/main.c:1156: if (pickup.active) {
	ld	a, (#(_pickup + 5) + 0)
	or	a, a
	jp	Z, 00144$
;src/main.c:1157: pickup.x -= xOverflow;
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
;src/main.c:1158: pickup.y -= yOverflow;
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
;src/main.c:1159: move_sprite(3, pickup.x + 4, pickup.y + 12);
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
;src/main.c:1160: if (pickup.visible && auxTick == 1) {
	ld	hl, #_pickup
	ld	c, (hl)
;src/main.c:1157: pickup.x -= xOverflow;
	ld	de, #(_pickup + 1)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/main.c:1160: if (pickup.visible && auxTick == 1) {
	ld	a, c
	or	a, a
	jp	Z, 00127$
	ld	a, (#_auxTick)
	dec	a
	jp	NZ,00127$
;src/main.c:1162: if (abs(pickup.x - playerDrawX) < 10) {
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_playerDrawX
	ld	c, (hl)
	sub	a, c
	ld	c, a
;src/main.c:399: if (value >= 0) return value;
	bit	7, c
	jr	Z, 00136$
;src/main.c:400: else return - value;
	xor	a, a
	sub	a, c
	ld	c, a
;src/main.c:1162: if (abs(pickup.x - playerDrawX) < 10) {
00136$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8a
	jp	NC, 00115$
;src/main.c:1163: if (abs(pickup.y - playerDrawY) < 10) {
	ld	a, (#(_pickup + 3) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_playerDrawY
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
;src/main.c:399: if (value >= 0) return value;
	bit	7, (hl)
	jr	Z, 00140$
;src/main.c:400: else return - value;
	xor	a, a
	ldhl	sp,	#1
	sub	a, (hl)
	ld	(hl), a
;src/main.c:1163: if (abs(pickup.y - playerDrawY) < 10) {
00140$:
	ldhl	sp,	#1
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00115$
;src/main.c:1164: if (pickup.type == 0) { //upgrade
	ld	a, (#(_pickup + 6) + 0)
	or	a, a
	jr	NZ, 00104$
;src/main.c:1165: if (gunLevel < 1) {
	ld	hl, #_gunLevel
	ld	a, (hl)
	sub	a, #0x01
	jr	NC, 00104$
;src/main.c:1166: gunLevel += 1;
	inc	(hl)
	ld	a, (hl)
;src/main.c:1167: setGunIcon();
	call	_setGunIcon
00104$:
;src/main.c:1170: if (pickup.type == 1) { //missile ammo
	ld	hl, #(_pickup + 6)
	ld	l, (hl)
;	spillPairReg hl
;src/main.c:1171: updateMissileCount(pickup.amount);
	ld	bc, #_pickup + 7
;src/main.c:1170: if (pickup.type == 1) { //missile ammo
	dec	l
	jr	NZ, 00106$
;src/main.c:1171: updateMissileCount(pickup.amount);
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
	pop	bc
00106$:
;src/main.c:1173: if (pickup.type == 2) {
	ld	a, (#(_pickup + 6) + 0)
	sub	a, #0x02
	jr	NZ, 00111$
;src/main.c:1174: if (hull + pickup.amount <= 100) {
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
;src/main.c:1175: hull += pickup.amount;
	ld	a, c
	ld	hl, #_hull
	add	a, (hl)
	ld	(hl), a
	jr	00111$
00108$:
;src/main.c:1178: hull = 100;
	ld	hl, #_hull
	ld	(hl), #0x64
00111$:
;src/main.c:1181: pickup.active = 0;
	ld	hl, #(_pickup + 5)
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1182: set_sprite_tile(3, 0x7f);
00115$:
;src/main.c:1157: pickup.x -= xOverflow;
	ld	hl, #(_pickup + 1)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1185: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
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
;src/main.c:1158: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1185: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
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
;src/main.c:1186: pickup.visible = 0;
	ld	hl, #_pickup
	ld	(hl), #0x00
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1187: set_sprite_tile(3, 0x7f);
	jr	00144$
00127$:
;src/main.c:1191: if (pickup.x >= -10 && pickup.x <= 170 && pickup.y >= 0 && pickup.y <= 155) {
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
;src/main.c:1158: pickup.y -= yOverflow;
	ld	hl, #(_pickup + 3)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/main.c:1185: if (pickup.x < -10 || pickup.x > 170 || pickup.y < 0 || pickup.y > 155) {
;src/main.c:1191: if (pickup.x >= -10 && pickup.x <= 170 && pickup.y >= 0 && pickup.y <= 155) {
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
;src/main.c:1192: pickup.visible = 1;
	ld	hl, #_pickup
	ld	(hl), #0x01
;src/main.c:1193: set_sprite_tile(3, pickup.tile);
	ld	hl, #(_pickup + 8)
	ld	c, (hl)
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;src/main.c:1193: set_sprite_tile(3, pickup.tile);
00144$:
;src/main.c:1198: }
	inc	sp
	inc	sp
	ret
;src/main.c:1200: void tickEx() {
;	---------------------------------
; Function tickEx
; ---------------------------------
_tickEx::
	add	sp, #-12
;src/main.c:1201: for (uint8_t i = 0; i < exCount; ++i) {
	ldhl	sp,	#11
	ld	(hl), #0x00
00118$:
	ld	hl, #_exCount
	ld	c, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jp	NC, 00120$
;src/main.c:1202: if (explosions[i].visible) {
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
;src/main.c:1204: explosions[i].x -= xOverflow;
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
;src/main.c:1205: explosions[i].y -= yOverflow;
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
;src/main.c:1206: move_sprite(20 +i+i, explosions[i].x, explosions[i].y+8);
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
;src/main.c:1207: move_sprite(21 +i+i, explosions[i].x+8, explosions[i].y+8);
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
;src/main.c:1209: explosions[i].frameCounter++;
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
;src/main.c:1210: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jp	NZ, 00119$
;src/main.c:1211: if (explosions[i].frameCounter > EXPLFRAMETIME) {
	ld	a, (bc)
	ld	e, a
	ld	a, (#_EXPLFRAMETIME)
	sub	a, e
	jp	NC, 00119$
;src/main.c:1212: explosions[i].frameCounter = 0;
	xor	a, a
	ld	(bc), a
;src/main.c:1213: explosions[i].frame += 1; 
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
;src/main.c:1214: if (explosions[i].frame > 3) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x03
	sub	a, c
	jr	NC, 00102$
;src/main.c:1215: explosions[i].visible = 0;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/main.c:1216: set_sprite_tile(20 + i+i, 0x7f);
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
;src/main.c:1217: set_sprite_tile(21 + i+i, 0x7f);
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
;src/main.c:1217: set_sprite_tile(21 + i+i, 0x7f);
	jp	00119$
00102$:
;src/main.c:1220: set_sprite_tile(20 + i+i, explosions[i].tile + (explosions[i].frame *4));
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
;src/main.c:1221: set_sprite_tile(21 + i+i, explosions[i].tile+(explosions[i].frame *4) +2);
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
;src/main.c:1221: set_sprite_tile(21 + i+i, explosions[i].tile+(explosions[i].frame *4) +2);
00119$:
;src/main.c:1201: for (uint8_t i = 0; i < exCount; ++i) {
	ldhl	sp,	#11
	inc	(hl)
	jp	00118$
00120$:
;src/main.c:1227: }
	add	sp, #12
	ret
;src/main.c:1229: void initEnemyOptions() {
;	---------------------------------
; Function initEnemyOptions
; ---------------------------------
_initEnemyOptions::
;src/main.c:1230: enemyOptions[0] = minispike;
	ld	de, #0x0012
	push	de
	ld	de, #_minispike
	push	de
	ld	de, #_enemyOptions
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1231: enemyOptions[1] = minibomb;
	ld	de, #0x0012
	push	de
	ld	de, #_minibomb
	push	de
	ld	de, #(_enemyOptions + 18)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1232: enemyOptions[2] = miniship;
	ld	de, #0x0012
	push	de
	ld	de, #_miniship
	push	de
	ld	de, #(_enemyOptions + 36)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1233: enemyOptions[3] = minibubble;
	ld	de, #0x0012
	push	de
	ld	de, #_minibubble
	push	de
	ld	de, #(_enemyOptions + 54)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1235: enemyOptions[4] = minifighter;
	ld	de, #0x0012
	push	de
	ld	de, #_minifighter
	push	de
	ld	de, #(_enemyOptions + 72)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1236: enemyOptions[5] = shieldship;
	ld	de, #0x0012
	push	de
	ld	de, #_shieldship
	push	de
	ld	de, #(_enemyOptions + 90)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1237: enemyOptions[6] = owl;
	ld	de, #0x0012
	push	de
	ld	de, #_owl
	push	de
	ld	de, #(_enemyOptions + 108)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1238: enemyOptions[7] = calvine;
	ld	de, #0x0012
	push	de
	ld	de, #_calvine
	push	de
	ld	de, #(_enemyOptions + 126)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1239: enemyOptions[8] = xwing;
	ld	de, #0x0012
	push	de
	ld	de, #_xwing
	push	de
	ld	de, #(_enemyOptions + 144)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1240: enemyOptions[9] = destroyer;
	ld	de, #0x0012
	push	de
	ld	de, #_destroyer
	push	de
	ld	de, #(_enemyOptions + 162)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1241: enemyOptions[10] = doublefuse;
	ld	de, #0x0012
	push	de
	ld	de, #_doublefuse
	push	de
	ld	de, #(_enemyOptions + 180)
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1243: }
	ret
;src/main.c:1246: void initProjectiles() {
;	---------------------------------
; Function initProjectiles
; ---------------------------------
_initProjectiles::
;src/main.c:1247: set_sprite_data(0x20, 17, ProjectileTiles); 
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1120
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:1249: for (uint8_t i = 0; i < PROJECTILECOUNT; ++i) {
	xor	a, a
00103$:
	ld	hl, #_PROJECTILECOUNT
	ld	c, (hl)
	cp	a, c
	ret	NC
	inc	a
;src/main.c:1253: }
	jr	00103$
;src/main.c:1255: void initGame() {
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/main.c:1256: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:1257: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1258: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;src/main.c:1261: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG + 0), a
;src/main.c:1262: LYC_REG = 0x7e; //line 126
	ld	a, #0x7e
	ldh	(_LYC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1264: add_LCD(interruptLCD);
	ld	de, #_interruptLCD
	push	de
	call	_add_LCD
	inc	sp
	inc	sp
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;src/main.c:1266: set_interrupts(VBL_IFLAG | LCD_IFLAG);   
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;src/main.c:1268: xDir = 0;
	ld	hl, #_xDir
	ld	(hl), #0x00
;src/main.c:1269: yDir = -1;
	ld	hl, #_yDir
	ld	(hl), #0xff
;src/main.c:1270: xSpeed = 0;
	ld	hl, #_xSpeed
	ld	(hl), #0x00
;src/main.c:1271: ySpeed = 0;
	ld	hl, #_ySpeed
	ld	(hl), #0x00
;src/main.c:1274: playerX = 80<<5;
	ld	hl, #_playerX
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;src/main.c:1275: playerY = 80<<5;
	ld	hl, #_playerY
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x0a
;src/main.c:1277: playerDrawX = 80;
	ld	hl, #_playerDrawX
	ld	(hl), #0x50
;src/main.c:1278: playerDrawY = 80;
	ld	hl, #_playerDrawY
	ld	(hl), #0x50
;src/main.c:1281: bgX = 0;
	xor	a, a
	ld	hl, #_bgX
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1282: bgY = 0;
	xor	a, a
	ld	hl, #_bgY
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1284: hull = maxHull;
	ld	a, (#_maxHull)
	ld	(#_hull),a
;src/main.c:1285: shield = maxShield;
	ld	a, (#_maxShield)
	ld	(#_shield),a
;src/main.c:1287: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:1288: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/main.c:1289: set_sprite_data(0, 12, Player1);
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
;src/main.c:1296: set_win_tiles(1,0,4,1,shieldlabel);
	ld	de, #_shieldlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x01
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1298: set_win_tiles(1,1,4,1,hullabel);
	ld	de, #_hullabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1303: set_bkg_data(0x50,1,healthblock);
	ld	de, #_healthblock
	push	de
	ld	hl, #0x150
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1305: setHealthBar(1, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1306: setHealthBar(0, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x7e
	ldh	(_WY_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/main.c:1313: set_bkg_data(0x51, 18, ProjectileTiles);
	ld	de, #_ProjectileTiles
	push	de
	ld	hl, #0x1251
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1315: set_win_tiles(10, 0,4,1,weaponlabel);
	ld	de, #_weaponlabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x0a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1316: set_win_tiles(10, 1,4,1,scorelabel);
	ld	de, #_scorelabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x10a
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1318: setGunIcon();
	call	_setGunIcon
;src/main.c:1320: SCORE = MAKE_BCD(00000);
	xor	a, a
	ld	hl, #_SCORE
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1321: updateScore();
	call	_updateScore
;src/main.c:1322: missiles = 0;
	ld	hl, #_missiles
	ld	(hl), #0x00
;src/main.c:1323: MISSILES = MAKE_BCD(0);
	xor	a, a
	ld	hl, #_MISSILES
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1324: updateMissileCount(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateMissileCount
	inc	sp
;src/main.c:1325: set_win_tiles(17, 0,1,1,gunMap+2);
	ld	de, #(_gunMap + 2)
	push	de
	ld	hl, #0x101
	push	hl
	ld	hl, #0x11
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1329: pickup = upgrade;//upgrade;
	ld	de, #0x0009
	push	de
	ld	de, #_upgrade
	push	de
	ld	de, #_pickup
	push	de
	call	___memcpy
	add	sp, #6
;src/main.c:1331: set_sprite_data(0x70, 6, Pickups);
	ld	de, #_Pickups
	push	de
	ld	hl, #0x670
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x7f
;src/main.c:1333: move_sprite(3, pickup.x + 4, pickup.y + 12);
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
;src/main.c:1335: for (uint8_t i = 0; i<exCount; ++i) {
	ld	c, #0x00
00111$:
	ld	hl, #_exCount
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00101$
;src/main.c:1336: explosions[i] = ex;
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
;src/main.c:1335: for (uint8_t i = 0; i<exCount; ++i) {
	inc	c
	jr	00111$
00101$:
;src/main.c:1338: set_sprite_data(exTiles[0], 16, Ex1);
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
;src/main.c:1339: set_sprite_data(exTiles[1], 16, Ex2);
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
;src/main.c:1340: set_sprite_data(exTiles[2], 16, Ex3);
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
;src/main.c:1343: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1344: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1345: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:1347: }
	ret
;src/main.c:1352: void showScoreScreen() {
;	---------------------------------
; Function showScoreScreen
; ---------------------------------
_showScoreScreen::
	add	sp, #-10
;src/main.c:1353: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1354: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x08
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1358: clearScreen();
	call	_clearScreen
;src/main.c:1359: initFont();
	call	_initFont
;src/main.c:1361: set_win_tiles(7, 5, 5, 1, endScoreLabel);
	ld	de, #_endScoreLabel
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x507
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1366: bcd2text(&SCORE, 0x01, buf);
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
;src/main.c:1367: set_win_tiles(6, 8, 7, 1, buf+1);
	inc	bc
	push	bc
	ld	hl, #0x107
	push	hl
	ld	hl, #0x806
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1371: set_win_tiles(3, 11, 13, 1, pressAnyKeyLabel);
	ld	de, #_pressAnyKeyLabel
	push	de
	ld	hl, #0x10d
	push	hl
	ld	hl, #0xb03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1373: set_win_tiles(4, 12, 11, 1, toContinueLabel);
	ld	de, #_toContinueLabel
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0xc04
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1377: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1379: }
	add	sp, #10
	ret
;src/main.c:1381: void showControls() {
;	---------------------------------
; Function showControls
; ---------------------------------
_showControls::
;src/main.c:1382: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1383: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1387: clearScreen();
	call	_clearScreen
;src/main.c:1388: initFont();
	call	_initFont
;src/main.c:1390: set_win_tiles(8, 5, 5, 1, endScoreLabel);
	ld	de, #_endScoreLabel
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0x508
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1393: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1395: }
	ret
;src/main.c:1398: void showStartScreen() {
;	---------------------------------
; Function showStartScreen
; ---------------------------------
_showStartScreen::
;src/main.c:1399: initFont();
	call	_initFont
;src/main.c:1401: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x0c
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1406: set_win_tiles(4, 8, 11, 1, pressStartLabel);
	ld	de, #_pressStartLabel
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x804
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1408: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1409: }
	ret
;src/main.c:1412: void updateMenu(int8_t menuitem) {
;	---------------------------------
; Function updateMenu
; ---------------------------------
_updateMenu::
;src/main.c:1413: move_sprite(0, 48, 71+ (menuitem<<3));
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x47
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
;src/main.c:1414: move_sprite(1, 122, 71+ (menuitem<<3));
;src/main.c:1416: }
	ret
;src/main.c:1419: uint8_t showMenu() {
;	---------------------------------
; Function showMenu
; ---------------------------------
_showMenu::
;src/main.c:1420: initFont();
	call	_initFont
;src/main.c:1422: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1423: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:1425: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x10
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1431: set_win_tiles(7,7, 4, 1, playLabel);
	ld	de, #_playLabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x707
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1432: set_win_tiles(5, 8, 8, 1, controlsLabel);
	ld	de, #_controlsLabel
	push	de
	ld	hl, #0x108
	push	hl
	ld	hl, #0x805
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1436: set_sprite_data(0, 1, MenuPicker);
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
;src/main.c:1441: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1442: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1445: int8_t menuitem = 0;
	ld	c, #0x00
;src/main.c:1447: while (1) {
00113$:
;src/main.c:1448: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1450: if (joydata & J_DOWN) {
	ld	a, (hl)
	bit	3, a
	jr	Z, 00104$
;src/main.c:1451: menuitem++;
	inc	c
	jr	00105$
00104$:
;src/main.c:1453: else if (joydata & J_UP) {
	bit	2, a
	jr	Z, 00105$
;src/main.c:1454: menuitem--;
	dec	c
00105$:
;src/main.c:380: return (value < min) ? min : (value > max) ? max : value;
	bit	7, c
	jr	Z, 00123$
	ld	c, #0x00
	jr	00124$
00123$:
	ld	e, c
	ld	a,#0x01
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00169$
	bit	7, d
	jr	NZ, 00170$
	cp	a, a
	jr	00170$
00169$:
	bit	7, d
	jr	Z, 00170$
	scf
00170$:
	jr	NC, 00125$
	ld	c, #0x01
00125$:
00124$:
;src/main.c:1456: menuitem = clamp(menuitem, 0, 1);
	ld	b,c
;src/main.c:1457: updateMenu(menuitem);
	push	bc
	push	bc
	inc	sp
	call	_updateMenu
	inc	sp
	pop	bc
;src/main.c:1450: if (joydata & J_DOWN) {
	ld	a, (#_joydata)
;src/main.c:1459: if ((joydata & J_A) && menuitem == 0) {
	and	a, #0x10
	ld	e, a
	ld	d, #0x00
	ld	a, d
	or	a, e
	jr	Z, 00109$
	ld	a, b
	or	a, a
	jr	NZ, 00109$
;src/main.c:1460: waitpadup();
	call	_waitpadup
;src/main.c:1461: playSound(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;src/main.c:1462: return 0;
	ld	e, #0x00
	ret
00109$:
;src/main.c:1464: else if (joydata & J_A) {
	ld	a, d
	or	a, e
	jr	Z, 00110$
;src/main.c:1465: waitpadup();
	call	_waitpadup
;src/main.c:1466: return 1;
	ld	e, #0x01
	ret
00110$:
;src/main.c:1469: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:1472: }
	jr	00113$
;src/main.c:1476: uint8_t showLevelSelection() {
;	---------------------------------
; Function showLevelSelection
; ---------------------------------
_showLevelSelection::
;src/main.c:1477: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/main.c:1478: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/main.c:1479: clearScreen();
	call	_clearScreen
;src/main.c:1480: initFont();
	call	_initFont
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x08
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;src/main.c:1482: set_win_tiles(3,3, 12, 1, selectLevelLabel);
	ld	de, #_selectLevelLabel
	push	de
	ld	hl, #0x10c
	push	hl
	ld	hl, #0x303
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1484: set_win_tiles(3,6, 4, 1, voidLabel);
	ld	de, #_voidLabel
	push	de
	ld	hl, #0x104
	push	hl
	ld	hl, #0x603
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1485: set_win_tiles(3,7, 11, 1, asteroids1Label);
	ld	de, #_asteroids1Label
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x703
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1486: set_win_tiles(3,8, 11, 1, asteroids2Label);
	ld	de, #_asteroids2Label
	push	de
	ld	hl, #0x10b
	push	hl
	ld	hl, #0x803
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1487: set_win_tiles(3,9, 8, 1, marshabLabel);
	ld	de, #_marshabLabel
	push	de
	ld	hl, #0x108
	push	hl
	ld	hl, #0x903
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1488: set_win_tiles(3,10, 5, 1, bonusLabel);
	ld	de, #_bonusLabel
	push	de
	ld	hl, #0x105
	push	hl
	ld	hl, #0xa03
	push	hl
	call	_set_win_tiles
	add	sp, #6
;src/main.c:1490: set_sprite_data(0, 1, MenuPicker);
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
;src/main.c:1493: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1494: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1497: int8_t menuitem = 0;
	ld	c, #0x00
;src/main.c:1498: while(1) {
00121$:
;src/main.c:1499: prevJoyData = joydata;
	ld	a, (#_joydata)
	ld	(#_prevJoyData),a
;src/main.c:1500: joydata = joypad();
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1499: prevJoyData = joydata;
	ld	a, (hl)
;src/main.c:1502: if (joydata & J_A) {
	bit	4, a
	jp	Z,00111$
;src/main.c:1503: waitpadup();
	call	_waitpadup
;src/main.c:1505: if (menuitem == 0) {
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;src/main.c:1506: set_bkg_data(0x25, 8, backgroundtiles);		// load background tileset (start in vram, count, tilestruct)
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1507: set_bkg_tiles(0,0,background3Width, background3Height ,background3); //set tilemap to be a background
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
;src/main.c:1508: collisionTiles = background3; // set background to be the collision map
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background3)
	inc	hl
	ld	(hl), #>(_background3)
;src/main.c:1509: difficulty = 0;
	xor	a, a
	ld	hl, #_difficulty
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1510: return 1;
	ld	e, #0x01
	ret
00102$:
;src/main.c:1512: if (menuitem == 1) {
	ld	a, c
	dec	a
	jr	NZ, 00104$
;src/main.c:1513: set_bkg_data(0x25, 16, backgroundtiles);		
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1514: set_bkg_tiles(0,0,background1Width, background1Height ,background1); 
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
;src/main.c:1515: collisionTiles = background1;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background1)
	inc	hl
	ld	(hl), #>(_background1)
;src/main.c:1516: difficulty = 100;
	ld	hl, #_difficulty
	ld	a, #0x64
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:1517: return 1;
	ld	e, #0x01
	ret
00104$:
;src/main.c:1519: if (menuitem == 2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00106$
;src/main.c:1520: set_bkg_data(0x25, 16, backgroundtiles);		
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1521: set_bkg_tiles(0,0,background4Width, background4Height ,background4); 
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
;src/main.c:1522: collisionTiles = background4;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background4)
	inc	hl
	ld	(hl), #>(_background4)
;src/main.c:1523: difficulty = 200;
	ld	hl, #_difficulty
	ld	a, #0xc8
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:1524: return 1;
	ld	e, #0x01
	ret
00106$:
;src/main.c:1526: if (menuitem == 3) {
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00108$
;src/main.c:1527: set_bkg_data(0x25, 16, marstiles);		
	ld	de, #_marstiles
	push	de
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1528: set_bkg_tiles(0,0,marsbackgroundWidth, marsbackgroundHeight ,marsbackground); 
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
;src/main.c:1529: collisionTiles = marsbackground;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_marsbackground)
	inc	hl
	ld	(hl), #>(_marsbackground)
;src/main.c:1530: difficulty = 300;
	ld	hl, #_difficulty
	ld	a, #0x2c
	ld	(hl+), a
	ld	(hl), #0x01
;src/main.c:1531: return 1;
	ld	e, #0x01
	ret
00108$:
;src/main.c:1534: set_bkg_data(0x25, 16, backgroundtiles2);	
	ld	de, #_backgroundtiles2
	push	de
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:1535: set_bkg_tiles(0,0,background2Width, background2Height ,background2); 
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
;src/main.c:1536: collisionTiles = background2;
	ld	hl, #_collisionTiles
	ld	(hl), #<(_background2)
	inc	hl
	ld	(hl), #>(_background2)
;src/main.c:1537: difficulty = 400;
	ld	hl, #_difficulty
	ld	a, #0x90
	ld	(hl+), a
	ld	(hl), #0x01
;src/main.c:1538: return 1;
	ld	e, #0x01
	ret
00111$:
;src/main.c:1544: if (joydata & J_B) {
	bit	5, a
	jr	Z, 00113$
;src/main.c:1545: waitpadup();
	call	_waitpadup
;src/main.c:1546: return 0;
	ld	e, #0x00
	ret
00113$:
;src/main.c:1549: if (!(prevJoyData & J_DOWN) && (joydata & J_DOWN)) {
	ld	hl, #_prevJoyData
	ld	b, (hl)
	bit	3, b
	jr	NZ, 00115$
	bit	3, a
	jr	Z, 00115$
;src/main.c:1550: ++menuitem;
	inc	c
00115$:
;src/main.c:1552: if (!(prevJoyData & J_UP) && (joydata & J_UP)) {
	bit	2, b
	jr	NZ, 00118$
	bit	2, a
	jr	Z, 00118$
;src/main.c:1553: --menuitem;
	dec	c
00118$:
;src/main.c:380: return (value < min) ? min : (value > max) ? max : value;
	bit	7, c
	jr	Z, 00129$
	xor	a, a
	jr	00130$
00129$:
	ld	e, c
	ld	a,#0x04
	ld	d,a
	sub	a, c
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
	ld	a, c
00132$:
00130$:
;src/main.c:1555: menuitem = clamp(menuitem, 0, 4);
	ld	c, a
;src/main.c:1556: move_sprite(0, 24, 63 + (menuitem<<3));
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x3f
	ld	b, a
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0x18
;src/main.c:1558: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:1561: }
	jp	00121$
;src/main.c:1564: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-4
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1570: showStartScreen();
	call	_showStartScreen
;src/main.c:1571: waitpad(J_START | J_A);
	ld	a, #0x90
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1572: waitpadup();
	call	_waitpadup
;src/main.c:1577: NR52_REG = 0x80; // sound on 
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/main.c:1578: NR50_REG = 0x77; // volume
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/main.c:1579: NR51_REG = 0xFF; // all channels
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/main.c:1582: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	c, a
	ld	b, #0x00
;src/main.c:1583: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;src/main.c:1584: initrand(seed);
	push	bc
	call	_initrand
	inc	sp
	inc	sp
;src/main.c:1589: while(1) {
00146$:
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1594: set_interrupts(1);   
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;src/main.c:1596: clearScreen();
	call	_clearScreen
;src/main.c:1598: uint8_t result = showMenu();
	call	_showMenu
	ld	a, e
	ld	b, a
;src/main.c:1601: if (result == 0) {
	or	a, a
	jp	NZ, 00143$
;src/main.c:1603: uint8_t map = showLevelSelection();
	call	_showLevelSelection
	ld	a, e
;src/main.c:1604: if (map == 0) {
	or	a, a
	jr	Z, 00146$
;src/main.c:1609: initEnemyOptions();
	call	_initEnemyOptions
;src/main.c:1610: initGame();
	call	_initGame
;src/main.c:1611: initEnemies(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_initEnemies
	inc	sp
;src/main.c:1612: initProjectiles();
	call	_initProjectiles
;src/main.c:1615: while(hull > 0) {
00121$:
	ld	a, (#_hull)
	or	a, a
	jp	Z, 00186$
;src/main.c:1616: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1618: joydata = joypad(); // query for button states
	call	_joypad
	ld	hl, #_joydata
	ld	(hl), e
;src/main.c:1620: updateDirection(); // set player direction
	call	_updateDirection
;src/main.c:1623: move(); 
	call	_move
;src/main.c:1625: moveProjectiles();
	call	_moveProjectiles
;src/main.c:1626: tickPickups();
	call	_tickPickups
;src/main.c:1627: tickEx();
	call	_tickEx
;src/main.c:1631: updateEnemyPositions();
	call	_updateEnemyPositions
;src/main.c:1632: checkCollision(); 
	call	_checkCollision
;src/main.c:1031: if (shield < maxShield) {
	ld	hl, #_maxShield
	ld	c, (hl)
	ld	e, c
	ld	hl, #_shield
	ld	d, (hl)
	ld	a, (hl)
	sub	a, c
	bit	7, e
	jr	Z, 00341$
	bit	7, d
	jr	NZ, 00342$
	cp	a, a
	jr	00342$
00341$:
	bit	7, d
	jr	Z, 00342$
	scf
00342$:
	jr	NC, 00151$
;src/main.c:1032: shield += 1;
	ld	hl, #_shield
	inc	(hl)
00151$:
;src/main.c:1034: setHealthBar(1, hull);
	ld	a, (#_hull)
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1035: setHealthBar(0, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1637: if (joydata & J_B && fireCooldown == 0) {
	ld	a, (#_joydata)
	bit	5, a
	jr	Z, 00102$
	ld	a, (#_fireCooldown)
	or	a, a
	jr	NZ, 00102$
;src/main.c:1638: fire();
	call	_fire
00102$:
;src/main.c:1640: if (fireCooldown > 0) {
	ld	hl, #_fireCooldown
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
;src/main.c:1641: --fireCooldown;
	dec	(hl)
00105$:
;src/main.c:1644: if (joydata & J_SELECT && switchDelay == 0) {
	ld	a, (#_joydata)
	bit	6, a
	jr	Z, 00112$
	ld	a, (#_switchDelay)
	or	a, a
	jr	NZ, 00112$
;src/main.c:1645: if (currentGun == 0) {
	ld	hl, #_currentGun
	ld	a, (hl)
	or	a, a
	jr	NZ, 00109$
;src/main.c:1646: currentGun = 1;
	ld	(hl), #0x01
	jr	00110$
00109$:
;src/main.c:1648: else if (currentGun == 1) {
	ld	a, (#_currentGun)
	dec	a
	jr	NZ, 00110$
;src/main.c:1649: currentGun = 0;
	ld	hl, #_currentGun
	ld	(hl), #0x00
00110$:
;src/main.c:1651: setGunIcon();
	call	_setGunIcon
;src/main.c:1652: switchDelay = 30;
	ld	hl, #_switchDelay
	ld	(hl), #0x1e
00112$:
;src/main.c:1654: if (switchDelay != 0) {
	ld	hl, #_switchDelay
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
;src/main.c:1655: switchDelay--;
	dec	(hl)
00115$:
;src/main.c:1658: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jr	NZ, 00117$
;src/main.c:1659: auxTick = AUXTICKFREQUENCY;
	ld	a, (#_AUXTICKFREQUENCY)
	ld	(#_auxTick),a
	jr	00118$
00117$:
;src/main.c:1662: auxTick--;
	ld	hl, #_auxTick
	dec	(hl)
00118$:
;src/main.c:1667: if (hull > 100) {
	ld	a, #0x64
	ld	hl, #_hull
	sub	a, (hl)
	jr	NC, 00120$
;src/main.c:1668: hull = 0;
	ld	(hl), #0x00
;src/main.c:1669: shield = 0;
	ld	hl, #_shield
	ld	(hl), #0x00
;src/main.c:1670: setHealthBar(1, hull);
	ld	hl, #0x01
	push	hl
	call	_setHealthBar
	pop	hl
;src/main.c:1671: setHealthBar(0, shield);
	ld	a, (#_shield)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_setHealthBar
	pop	hl
00120$:
;src/main.c:1674: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1676: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1677: wait_vbl_done(); // Idle until next frame
	call	_wait_vbl_done
	jp	00121$
;src/main.c:1682: for (uint8_t i=0; i<exCount; ++i) {
00186$:
	ldhl	sp,	#3
	ld	(hl), #0x00
00159$:
	ld	hl, #_exCount
	ld	c, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NC, 00124$
;src/main.c:1683: explosions[i].x = 200;
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
;src/main.c:1684: explosions[i].y = 200;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0xc8
;src/main.c:1686: explosions[i].tile = exTiles[0];
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
;src/main.c:1687: explosions[i].frameCounter = 0;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;src/main.c:1688: explosions[i].frame = 2-i;
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
;src/main.c:1689: explosions[i].visible = 1;
	ld	a, #0x01
	ld	(bc), a
;src/main.c:1682: for (uint8_t i=0; i<exCount; ++i) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00159$
00124$:
;src/main.c:1691: xOverflow = 0;
	xor	a, a
	ld	hl, #_xOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1692: yOverflow = 0;
	xor	a, a
	ld	hl, #_yOverflow
	ld	(hl+), a
	ld	(hl), a
;src/main.c:1694: while(endExCount < 12) {
	ldhl	sp,	#3
	ld	(hl), #0x00
00132$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x0c
	jp	NC, 00134$
;src/main.c:1696: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1697: tickEx();
	call	_tickEx
;src/main.c:1698: if (auxTick == 0) {
	ld	a, (#_auxTick)
	or	a, a
	jr	NZ, 00126$
;src/main.c:1699: auxTick = AUXTICKFREQUENCY;
	ld	a, (#_AUXTICKFREQUENCY)
	ld	(#_auxTick),a
	jr	00127$
00126$:
;src/main.c:1702: auxTick--;
	ld	hl, #_auxTick
	dec	(hl)
00127$:
;src/main.c:1704: if (!explosions[oldestEx].visible) {
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
	jp	NZ, 00131$
;src/main.c:1705: explosions[oldestEx].visible = 1;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x01
;src/main.c:1708: uint8_t tileNum = ((uint8_t)rand()) % exTileCount;
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
;src/main.c:1709: uint8_t xOff = ((uint8_t)rand()) % 32;
	call	_rand
	ld	a, e
	and	a, #0x1f
	ldhl	sp,	#1
	ld	(hl), a
;src/main.c:1710: uint8_t yOff = ((uint8_t)rand()) % 32;
	call	_rand
	ld	a, e
	and	a, #0x1f
	ldhl	sp,	#2
	ld	(hl), a
;src/main.c:1712: explosions[oldestEx].x = playerDrawX -16 + xOff;
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
;src/main.c:1713: explosions[oldestEx].y = playerDrawY -16 + yOff;
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
;src/main.c:1714: explosions[oldestEx].tile = exTiles[tileNum];
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
;src/main.c:1715: explosions[oldestEx].frame = 0;
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
;src/main.c:1716: explosions[oldestEx].frameCounter = 0;
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
;src/main.c:1718: set_sprite_tile(20 + oldestEx+oldestEx, explosions[oldestEx].tile + (explosions[oldestEx].frame<<1));
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
;src/main.c:1719: set_sprite_tile(21 + oldestEx+oldestEx, explosions[oldestEx].tile+(explosions[oldestEx].frame<<1) +2);
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
;src/main.c:1721: oldestEx++;
	ld	hl, #_oldestEx
	inc	(hl)
;src/main.c:1722: if (oldestEx >= exCount) {
	ld	hl, #_exCount
	ld	c, (hl)
	ld	hl, #_oldestEx
	ld	a, (hl)
	sub	a, c
	jr	C, 00129$
;src/main.c:1723: oldestEx = 0;
	ld	(hl), #0x00
00129$:
;src/main.c:1725: endExCount++;
	ldhl	sp,	#3
	inc	(hl)
00131$:
;src/main.c:1728: SHOW_WIN;	
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1730: wait_vbl_done();
	call	_wait_vbl_done
	jp	00132$
00134$:
;src/main.c:1733: for (uint8_t j=0; j<exCount; ++j) {
	ld	c, #0x00
00162$:
	ld	hl, #_exCount
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00135$
;src/main.c:1735: move_sprite(20 +j+j, 200, 200);
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
;src/main.c:1736: move_sprite(21 +j+j, 200, 200);
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
;src/main.c:1733: for (uint8_t j=0; j<exCount; ++j) {
	inc	c
	jr	00162$
00135$:
;src/main.c:1738: for (uint16_t k=0; k<180; ++k) {
	ld	bc, #0x0000
00165$:
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0xb4
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00136$
;src/main.c:1739: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:1740: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/main.c:1741: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:1738: for (uint16_t k=0; k<180; ++k) {
	inc	bc
	jr	00165$
00136$:
;/home/milan/Documents/gameboy/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;src/main.c:1745: showScoreScreen();
	call	_showScoreScreen
;src/main.c:1746: waitpad(J_A | J_B | J_DOWN | J_LEFT | J_RIGHT | J_UP | J_SELECT | J_START);
	ld	a, #0xff
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1747: waitpadup();
	call	_waitpadup
	jp	00146$
00143$:
;src/main.c:1752: else if (result == 1) {
	dec	b
	jp	NZ,00146$
;src/main.c:1753: showControls();
	call	_showControls
;src/main.c:1754: waitpad(J_B);
	ld	a, #0x20
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;src/main.c:1755: waitpadup();
	call	_waitpadup
	jp	00146$
;src/main.c:1760: }
	add	sp, #4
	ret
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
__xinit__endScoreLabel:
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x0f	; 15
__xinit__pressAnyKeyLabel:
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
__xinit__toContinueLabel:
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
__xinit__emptyRow:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__pressStartLabel:
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
__xinit__playLabel:
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x23	; 35
__xinit__controlsLabel:
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x19	; 25
	.db #0x16	; 22
	.db #0x1d	; 29
__xinit__selectLevelLabel:
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
__xinit__voidLabel:
	.db #0x20	; 32
	.db #0x19	; 25
	.db #0x13	; 19
	.db #0x0e	; 14
__xinit__asteroids1Label:
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
__xinit__asteroids2Label:
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
__xinit__marshabLabel:
	.db #0x17	; 23
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x0b	; 11
	.db #0x0c	; 12
__xinit__bonusLabel:
	.db #0x0c	; 12
	.db #0x19	; 25
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x1d	; 29
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
__xinit__difficulty:
	.dw #0x0000
	.area _CABS (ABS)
