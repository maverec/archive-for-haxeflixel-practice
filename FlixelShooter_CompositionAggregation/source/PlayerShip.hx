package ;	// TODO : will put this into Entity later

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxSprite;

class PlayerShip extends FlxSprite
{	
	public function new( X, Y ) {
		super( X, Y );
		
		loadGraphic( "assets/images/player.png", false, 64, 48 );
		setGraphicSize( 32, 24 );
		this.angle = 90;
		updateHitbox();
		drag.x = drag.y = 1800;
		
		// TODO: health traits and logic here
		// ?TODO : death trait and logic here	
	}
	
	override public function update() : Void {
		super.update();
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}