package ;

import flixel.FlxG;

class KeyboardNode
{
	public function new( keysUp:Array<String>, keysDown:Array<String>, keysLeft:Array<String>, keysRight:Array<String>, object:Dynamic, pixels:Int ) {		
		if ( FlxG.keys.anyPressed( keysUp ) ) {
			object.y -= pixels;
		}
		if ( FlxG.keys.anyPressed( keysDown ) ) {
			object.y += pixels;
		}
		if ( FlxG.keys.anyPressed( keysLeft ) ) {
			object.x -= pixels;
		}
		if ( FlxG.keys.anyPressed( keysRight ) ) {
			object.x += pixels;
		}
	}
}