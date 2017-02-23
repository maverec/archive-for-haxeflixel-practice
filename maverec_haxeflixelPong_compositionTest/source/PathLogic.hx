package ;

import flixel.FlxSprite;
import flixel.system.FlxSound;

class PathLogic
{
	public static function bounceLogic( object1 : FlxSprite, object2 : FlxSprite, objectToBounce : FlxSprite, sfx : FlxSound ) {
		if ( object1 != object2 ) {
			objectToBounce.velocity.x *= -1;
			object1 = object2;
			sfx.play();
		}
	}
}