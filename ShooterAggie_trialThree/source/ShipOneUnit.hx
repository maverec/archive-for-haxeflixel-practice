package ;	// entity

import flixel.FlxSprite;
import flixel.util.FlxColor;

class ShipOneUnit extends FlxSprite
{
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 16, 32, FlxColor.WHITE );
	}
	
	override public function update() : Void {
		super.update();
		
		var input : InputCluster = new InputCluster();
		input.keyUnit( [ "UP", "W" ], true, this, -8 );
		input.keyUnit( [ "DOWN", "S" ], true, this, 8 );
		input.keyUnit( [ "RIGHT", "D" ], false, this, 8 );
		input.keyUnit( [ "LEFT", "A" ], false, this, -8 );
		input.shootUnit( [ "SPACE" ] );
		
		var bounds : BoundsCluster = new BoundsCluster();
		bounds.boundsUnit( true, this );
		bounds.boundsUnit( false, this );
		
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}