package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxVelocity;

class InputLogicTree
{
	public static function keyNode( keys1:Array<String>, keys2:Array<String>, pixels:Int, sprite:FlxSprite ) : Void {
		if ( FlxG.keys.anyPressed( keys1 ) ) {
			sprite.y += pixels;
		}
		if ( FlxG.keys.anyPressed( keys2 ) ) {
			sprite.y -= pixels;
		}
	}
	
	// public static function mouseNode( sprite:FlxSprite ) : Void {
	// 	FlxVelocity.moveTowardsMouse( sprite, 5 );
	// }
	
	public function new() { }
}