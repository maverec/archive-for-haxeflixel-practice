package ;

import flixel.FlxSprite;
import flixel.system.FlxSound;

class BoundariesLogic
{
	public static function screenYBounds( object : FlxSprite, num_1 : Int, num_2 : Int ) {
		if ( object.y < num_1 ) {
			object.y = num_1;
		}
		
		if ( object.y > num_2 ) {
			object.y = num_2;
		}
	}
	
	public static function bounceYBounds( object : FlxSprite, sfxObject : FlxSound ) {
		object.velocity.y *= -1;
		sfxObject.play();
	}
	
	public function new() { }
}