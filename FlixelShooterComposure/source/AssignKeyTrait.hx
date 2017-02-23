package ;

import flixel.FlxG;

class AssignKeyTrait
{
	public function new( key:Array<String> ) {
		FlxG.keys.anyPressed( key );
	}
}