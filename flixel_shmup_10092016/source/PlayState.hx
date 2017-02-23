package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;
import flixel.effects.particles.FlxEmitter;

import trait.*;
import system.*;
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import entity.*;

class PlayState extends FlxState
{
	var _player		: Player;
	var _bullets		: FlxSpriteGroup;
	var _enemies		: FlxSpriteGroup;
	var _potions		: FlxSpriteGroup;
	var _explosions		: FlxEmitter;
	
	var _cd			: Int;
	var _bulletcd		: Int;
	var _enemycd		: Int;
	var _potioncd		: Int;
	var _altgun		: Bool;
	
	override public function create():Void {
		super.create();
		
		_cd		= 0;
		_bulletcd	= 5;
		_enemycd	= Math.round(Math.random() * 50) + 50;
		_potioncd	= Math.round(Math.random() * 100) + 100;
		_altgun		= true;
		
		_bullets	= new FlxSpriteGroup();
		_enemies	= new FlxSpriteGroup();
		_potions	= new FlxSpriteGroup();
		_explosions	= new FlxEmitter();
		
		_player = new Player(FlxG.width/2-24,FlxG.height - 64);
		_player.makeGraphic(48,24,FlxColor.BLUE);
		_player.health = 5;
				
		add(_bullets);
		add(_enemies);
		add(_potions);
		add(_explosions);
		add(_player);
	} //create

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		var collision_handler = new ComposeGroup();
		collision_handler.addTrait(new Emitter( _explosions ));
		collision_handler.addTrait(new Colliders( _player,_enemies ));
		collision_handler.addTrait(new Particles( 3,3 ));
		collision_handler.addTrait(new HpModifier( -1,-3 ));
		collision_handler.addTrait(new ScoreModifier( 0,1 ));
		collision_handler.addTrait(new Collisions( ));
		collision_handler.addTrait(new Colliders( _player,_potions ));
		collision_handler.addTrait(new Particles( 3,1 ));
		collision_handler.addTrait(new HpModifier( 1,-1 ));
		collision_handler.addTrait(new ScoreModifier( 0,0 ));
		collision_handler.addTrait(new Collisions( ));
		collision_handler.addTrait(new Colliders( _bullets,_enemies ));
		collision_handler.addTrait(new Particles( 1,3 ));
		collision_handler.addTrait(new HpModifier( -1,-1 ));
		collision_handler.addTrait(new ScoreModifier( 0,1 ));
		collision_handler.addTrait(new Collisions( ));
		
		//bullets
		if(FlxG.keys.anyPressed( [SPACE] )) {
			if(_cd < 0) _cd = 0;
			if(_cd == 0) {
				_cd = _bulletcd;
				
				var _b = new Bullet();
				_b.makeGraphic(3,7,FlxColor.WHITE);
				
				_b.y = _player.y - _b.height;
				if(_altgun) _b.x = _player.x + 8;
				else _b.x = _player.x + 40;
				
				_bullets.add(_b);
			}
			_altgun = !_altgun;
			if(_cd > 0) _cd--; 
		}
		
		//enemies
		if(_enemycd < 0) _enemycd = 0;
		if(_enemycd == 0) {			
			var _e = new Enemy();
			_e.makeGraphic(48,24,FlxColor.RED);
			_e.y = -25;
			_e.x = Math.round(Math.random() * (FlxG.width - _e.width));
			_e.health = 3;
			var _move = new ComposeGroup();
	                _move.addTrait(new Visuals( _e ));
	                _move.addTrait(new Speed( 0,Math.random() * 450 ));
	                _move.addTrait(new Motion( ));
			_enemies.add(_e);
			
			_enemycd = Math.round(Math.random() * 20) + 30;
		}
		if(_enemycd > 0) _enemycd--;
		
		//potions
		if(_potioncd < 0) _potioncd = 0;
		if(_potioncd == 0) {			
			var _p = new Potion();
			_p.makeGraphic(16,16,FlxColor.PURPLE);
			_p.y = -25;
			_p.x = Math.round(Math.random() * (FlxG.width - _p.width));
			var _move = new ComposeGroup();
	                _move.addTrait(new Visuals( _p ));
	                _move.addTrait(new Speed( 0,Math.random() * 350 ));
	                _move.addTrait(new Motion( ));
			_enemies.add(_p);
			
			_potioncd = Math.round(Math.random() * 500) + 300;
		}
		if(_potioncd > 0) _potioncd--;
	} //update

} //PlayState
