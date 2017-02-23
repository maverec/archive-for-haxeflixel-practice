package ;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayerShip extends FlxSprite
{
	private var entity : ComposeRoot = new ComposeRoot();
	
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		loadGraphic( "assets/images/player.png", false, 64, 48 );
		this.angle = 90;
		setGraphicSize( 32, 24 );
		updateHitbox();
		
		var draw : ComposeGroup = new ComposeGroup();
		draw.addTrait( new HealthNode( 3 ) );
		
		entity.addChild( draw );
	}
	
	override public function update() : Void {
		super.update();
		
		var render : ComposeGroup = new ComposeGroup();
		render.addTrait( new KeyboardNode( [ "W", "UP" ], [ "S", "DOWN" ], [ "A", "LEFT" ], [ "D", "RIGHT" ], this, 8 ) );
		render.addTrait( new BoundsNode( this, 0, 608, 8, 448 ) );
				
		entity.addChild( render );
	}
}