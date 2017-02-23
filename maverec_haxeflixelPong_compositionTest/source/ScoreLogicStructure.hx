package ;

import flixel.FlxState;
import flixel.system.FlxSound;

class ScoreLogicStructure
{
	public function new( score : Array, sfx : FlxSound ) {
		score++;
		FlxG.switchState( new MenuState() );
		sfx.play();
	}
}