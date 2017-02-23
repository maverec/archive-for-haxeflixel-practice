package node;

import flixel.FlxSprite;

class BounceNode
{
	public function new( sprite:FlxSprite, num1:Int, num2:Int ) : Void {
		if ( sprite.y < num1 || sprite.y > num2 ) {
			sprite.velocity.y *= -1;
			// TODO : ADD SOUND EFFECT HERE
		}
	}
}