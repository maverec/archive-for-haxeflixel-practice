package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;

class PlayState extends FlxState
{
	var _player 	: Player;
	var _bullets	: BulletGenerator;
	var _enemies	: EnemyGenerator;
	
	override public function create():Void {
		super.create();
		
		_player = new Player();
		_player.x = 240;
		_player.y = 240;
		_player.makeGraphic(48,24,FlxColor.BLUE);
				
		_bullets = new BulletGenerator();
		_enemies = new EnemyGenerator();
		
		add(_player);
		add(_bullets);
		add(_enemies);
	} //create

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		_bullets.position(_player.x,_player.y + 7);
		if(_bullets.cd == 0) {
			_bullets.leftgun = !_bullets.leftgun;
		}
		if(FlxG.keys.anyPressed( [SPACE] )) {
			_bullets.trigger = true;
		} else {
			_bullets.trigger = false;
		}
		
		_enemies.position(( Math.random() * (FlxG.width - _player.width) ), -25);
	} //update
	
	override public function destroy() {
		super.destroy();
	} //destroy

} //PlayState
