package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Paddle extends FlxSprite
{
	private var ball : Ball;
	
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 12, 50, FlxColor.WHITE );
		drag.y = 1800;
	}
	
	override public function destroy() : Void {
		super.destroy();
		
	}
}