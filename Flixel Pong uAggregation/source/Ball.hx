package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;

class Ball extends FlxSprite
{
	private var contactPoint : Paddle;
	
	public function bounce( object1:Dynamic ) : Void {
		if ( contactPoint != object1 ) {
			this.velocity.x *= -1;
			contactPoint = object1;
			// TODO : ADD SOUND EFFECT HERE
		}
	}
	
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 12, 12, FlxColor.TRANSPARENT );
		FlxSpriteUtil.drawCircle( this, 6, 6, 6, FlxColor.WHITE );
		setSize( 12, 12 );
		
		AILogicTree.velocityNode( this );
	}
	
	override public function update() : Void {
		super.update();
		
		// bounce the ball when it hits the top or bottom of the screen
		BoundsLogicTree.bounceYNode( this, 0, 468 );
	}
	
	override public function destroy() : Void { 
		super.destroy();
	}
}