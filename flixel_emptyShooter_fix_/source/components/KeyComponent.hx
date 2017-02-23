package components;

import flixel.input.keyboard.FlxKey;

class KeyComponent
{
	public var goLeft : Array<FlxKey>;
	public var goRight : Array<FlxKey>;
	public var goDown : Array<FlxKey>;
	public var goUp : Array<FlxKey>;
	
	public function new( left:Array<FlxKey>, right:Array<FlxKey>, down:Array<FlxKey>, up:Array<FlxKey> ) {
		this.goLeft = left;
		this.goRight = right;
		this.goDown = down;
		this.goUp = up;
	}
}