package node;

import flixel.FlxG;

class PointNode
{	
	public function new( object:Dynamic ) {
		
		if ( object.x < 10 || object.x > 624 ) {
			
			object.x = FlxG.width / 2;
			object.y = FlxG.height / 2;
			// TODO : ADD SOUND EFFECT HERE
		}
		// if ( object.x > 624 ) {
		// 	
		// 	object.x = FlxG.width / 2;
		// 	object.y = FlxG.height / 2;
		// 	// TODO : ADD SOUND EFFECT HERE
		// }
	}
}