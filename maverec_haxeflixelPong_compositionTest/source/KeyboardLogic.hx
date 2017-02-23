package ;

import flixel.FlxG;
import flixel.FlxSprite;

class KeyboardLogic
{
	public static function keysLogic( playerObject : FlxSprite, pixelsToMove : Int ) {
		if ( FlxG.keys.anyPressed( [ "DOWN", "S" ] ) ) {
			playerObject.y += pixelsToMove;
		}
		if ( FlxG.keys.anyPressed( [ "UP", "W" ] ) ) {
			playerObject.y -= pixelsToMove;
		}
	}
	
	public function new() { }
}