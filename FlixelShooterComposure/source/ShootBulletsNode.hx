package ;

import composure.core.ComposeGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class ShootBulletsNode
{	
	private var sprite : FlxSprite;
	
	public function new( key:Array<String>, delay:Int, maxDelay:Int, state:FlxState, firedFrom:Dynamic, firstCannon:Bool ) {
		// var test : ComposeGroup = new ComposeGroup();
		
		if ( FlxG.keys.anyPressed( key ) ) {
			if ( delay == 0 ) {
				delay = maxDelay;
				
				// test.addTrait( new DrawNode( "assets/images/bullet.png", 14, 24, 90, 7, 12, 500, state ) );
				sprite = new FlxSprite();
				sprite.loadGraphic( "assets/images/bullet.png", false, 14, 24 );
				sprite.angle = 90;
				sprite.setGraphicSize( 7, 12 );
				sprite.updateHitbox();
				sprite.velocity.x = 500;
				
				state.add( sprite );
				
				// TESTING AGAIN
				if ( firstCannon ) {
					sprite.y = firedFrom.y - 6;
				} else {
					sprite.y = firedFrom.y + 18;
				}
				sprite.x = firedFrom.x + 20;
			}
			firstCannon = !firstCannon;
		}
		
		if ( delay > 0 ) {
			delay--;
		}
	}
}