package ;

import flixel.FlxSprite;
import flixel.FlxG;

class BoundsLogicTree
{
	public static function boundsYNode( sprite:FlxSprite, num1:Int, num2:Int ) : Void {
		if ( sprite.y < num1 ) {
			sprite.y = num1;
		}
		if ( sprite.y > num2 ) {
			sprite.y = num2;
		}
	}
	
	public static function bounceYNode( sprite:FlxSprite, num1:Int, num2:Int ) : Void {
		if ( sprite.y < num1 || sprite.y > num2 ) {
			sprite.velocity.y *= -1;
			// TODO : ADD SOUND EFFECT HERE
		}
	}
		
	public function new() { }
}