package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Paddle extends FlxSprite
{
	public function new(x:Float, y:Float) {
		super(x, y);
		
		// generating a rectangle that's the color white
		makeGraphic(12, 50, FlxColor.WHITE);
		drag.y = 1280;
	}
}