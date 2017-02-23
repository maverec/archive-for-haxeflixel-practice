package node;

import flixel.FlxSprite;

class BoundaryNode
{
	public function new( sprite:FlxSprite, num1:Int, num2:Int ) : Void {
		if ( sprite.y < num1 ) {
			sprite.y = num1;
		}
		if ( sprite.y > num2 ) {
			sprite.y = num2;
		}
	}
}