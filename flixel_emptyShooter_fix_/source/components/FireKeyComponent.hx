package components;

import flixel.input.keyboard.FlxKey;

class FireKeyComponent
{
	public var fire : Array<FlxKey>;
	
	public function new( firing:Array<FlxKey> ) {
		this.fire = firing;
	}
}