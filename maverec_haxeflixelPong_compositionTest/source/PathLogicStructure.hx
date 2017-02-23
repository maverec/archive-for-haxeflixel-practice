package ;

import flixel.FlxSprite;
import flixel.system.FlxSound;

class PathLogicStructure
{
	public static function bounceNode( object1 : FlxSprite, ?object2 : FlxSprite, objectToBounce : FlxSprite, ?sfx : FlxSound ) {
		if ( object1 != object2 ) {
			objectToBounce.velocity.x *= -1;
			object1 = object2;
			sfx.play();
		}
	}
	
	public static function bounceOnContactNode( object1 : FlxSprite, object2 : FlxSprite ) {
		bounceNode( object1, object2 );
	}
	
	public static function aiNode( object1 : FlxSprite, object2 : FlxSprite, numXCoord : Float, numYCoord_1 : Float, numYCoord_2 : Float, numPixels : Int ) {
		if ( object1.x > numXCoord && object2.y < object1.y - numYCoord_1 ) {
			object2.y += numPixels;
		}
		if ( object1.x > numXCoord && object2.y > object1.y - numYCoord_2 ) {
			object2.y -= numPixels;
		}
	}
	
	public function new( ) { }
}