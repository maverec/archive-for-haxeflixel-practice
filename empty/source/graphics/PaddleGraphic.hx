
package graphics;

class PaddleGraphic extends flixel.FlxSprite
{	
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 12, 50, flixel.util.FlxColor.WHITE );
		drag.y = 1600;
	}
	
	override public function update() : Void {
		super.update();
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}