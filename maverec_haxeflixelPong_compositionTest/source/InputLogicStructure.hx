package ;

import flixel.FlxSprite;
import flixel.FlxG;

class InputLogicStructure
{
	public static function keysNode( playerObject : FlxSprite, pixelsToMove : Int ) {
		if ( FlxG.keys.anyPressed( [ "DOWN", "S" ] ) ) {
			playerObject.y += pixelsToMove;
		}
		if ( FlxG.keys.anyPressed( [ "UP", "W" ] ) ) {
			playerObject.y -= pixelsToMove;
		}
	}
	
	public function new( ) { }
}