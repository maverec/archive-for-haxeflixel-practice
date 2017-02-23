package ;	// TODO : will add this to Entity later

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxSprite;

class Enemy extends FlxSprite
{
	private var entity : ComposeRoot = new ComposeRoot();
	private var speed : Int;
	private var spawnInt : Int;
	
	public function new() {
		super();
		
		speed = Math.ceil( Math.random() * 3 );
		spawnInt = Math.round( Math.random() * 50 ) + 50;
		
		loadGraphic( "assets/images/enemy.png", false, 64, 48 );
		setGraphicSize( 32, 24 );
		this.angle = 90;
		updateHitbox();
		
		// TODO : health traits and logic here
		// ?TODO : death trait and logic here
	}
	
	override public function update() : Void {
		super.update();
		
		this.x -= speed;
		
		// TODO : removing this entity when it goes off screen
		// TESTING :
		var offscreen : ComposeGroup = new ComposeGroup();
		offscreen.addTrait( new RemoveNotVisibleTrait( false, this, -10 ) );
		
		entity.addChild( offscreen );
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}