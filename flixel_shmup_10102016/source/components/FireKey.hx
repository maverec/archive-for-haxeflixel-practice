package components;

import flixel.input.keyboard.FlxKey;

class FireKey
{
	public var fire : Array<FlxKey>;
	
	public function new( firing:Array<FlxKey> ) {
		this.fire = firing;
	}
}