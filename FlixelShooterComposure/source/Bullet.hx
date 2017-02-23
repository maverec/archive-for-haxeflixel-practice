package ;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxSprite;

class Bullet extends FlxSprite
{
	private var entity : ComposeRoot = new ComposeRoot();
	
	public function new() {
		super();
		
		loadGraphic( "assets/images/bullet.png", false, 14, 24 );
		this.angle = 90;
		setGraphicSize( 7, 12 );
		updateHitbox();
		
		velocity.x = 500;
	}
	
	override public function update() : Void {
		super.update();
		
		var render : ComposeGroup = new ComposeGroup();
		render.addTrait( new KillOffscreenNode( false, true, this, null, 680 ) );
		
		entity.addChild( render );
	}
}