package node;

import flixel.FlxG;
import flixel.FlxSprite;

class KeyboardNode
{
	public function new( keys1:Array<String>, keys2:Array<String>, pixels:Int, sprite:FlxSprite ) : Void {
		if ( FlxG.keys.anyPressed( keys1 ) ) {
			sprite.y += pixels;
		}
		if ( FlxG.keys.anyPressed( keys2 ) ) {
			sprite.y -= pixels;
		}
	}
}