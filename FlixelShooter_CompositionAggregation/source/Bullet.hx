package ;	// TODO : will put this into Entity later

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Bullet extends FlxSprite
{
	private var entity : ComposeRoot = new ComposeRoot();
	
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 8, 3, FlxColor.GOLDENROD );
		
		// TODO : health traits and logic here
		// ?TODO : death trait and logic here
	}
	
	override public function update() : Void {
		super.update();

		// TESTING :
		this.x += 10;
		
		// TODO : removing this entity when it goes off screen
		// TESTING :
		var offscreen : ComposeGroup = new ComposeGroup();
		offscreen.addTrait( new RemoveNotVisibleTrait( true, this, 650 ) );
		
		entity.addChild( offscreen );
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}