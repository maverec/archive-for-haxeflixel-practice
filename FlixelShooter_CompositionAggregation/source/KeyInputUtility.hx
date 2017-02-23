package ;	// TODO : will add this class to Utility later

class KeyInputUtility
{
	public function new( keys:Array<String>, object:Dynamic, pixels:Float, vertical:Bool ) {
		if ( flixel.FlxG.keys.anyPressed( keys ) ) {
			if ( vertical ) {
				object.y += pixels;
			} else {
				object.x += pixels;
			}
		}
	}
}