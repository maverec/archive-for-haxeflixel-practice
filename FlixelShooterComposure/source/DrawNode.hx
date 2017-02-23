package ;

import flixel.FlxSprite;
import flixel.FlxState;

class DrawNode
{
	private var sprite : FlxSprite;
	
	public function new( path:String, width:Int, height:Int, angle:Float, newW:Int, newH:Int, numSpeed:Int, state:FlxState ) {
		sprite = new FlxSprite();
		sprite.loadGraphic( path, false, width, height );
		sprite.angle = angle;
		sprite.setGraphicSize( newW, newH );
		sprite.updateHitbox();
		sprite.velocity.x = numSpeed;
		
		state.add( sprite );
	}
}