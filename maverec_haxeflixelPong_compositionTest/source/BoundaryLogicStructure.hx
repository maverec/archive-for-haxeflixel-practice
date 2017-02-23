package ;

import flixel.FlxSprite;
import flixel.system.FlxSound;

class BoundaryLogicStructure
{
	public static function verticalBoundsNode( object : FlxSprite, numLow : Int, numHigh : Int ) {
		if ( object.y < numLow ) {
			object.y = numLow;
		}
		if ( object.y > numHigh ) {
			object.y = numHigh;
		}
	}
	
	public static function verticalBounceNode( object : FlxSprite, sfxObject : FlxSound ) {
		object.velocity.y *= -1;
		sfxObject.play();
	}
	
	public function new( ){ }
}