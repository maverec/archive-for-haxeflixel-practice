
package graphics;

class BallGraphic extends flixel.FlxSprite
{
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 24, 24, flixel.util.FlxColor.TRANSPARENT );
		flixel.util.FlxSpriteUtil.drawCircle(this, 12, 12, 12, flixel.util.FlxColor.WHITE);
		setSize( 24, 24 );
	}
	
	override public function update() : Void {
		super.update();
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}