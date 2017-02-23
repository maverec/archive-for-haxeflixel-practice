package node;

import flixel.FlxG;

class BounceContactNode
{
	// private var contactPoint : PaddleOne;
	// 
	// private function bounceFix( object1:Dynamic, object2:Dynamic ) : Void {
	// 	if ( contactPoint != object2 ) {
	// 		object1.velocity.x *= -1;
	// 		contactPoint = object2;
	// 	}
	// }
	// 
	// // private function bounceOff( object1:Dynamic, object2:Dynamic ) : Void {
	// // 	object1.velocity.x *= -1;
	// // }
	// 
	// public function new( object1:Dynamic, object2:Dynamic ) {
	// 	FlxG.overlap( object1, object2, bounceFix );
	// }
	
	public function new( ?object1:Dynamic, object2:Dynamic, ?object3:Dynamic ) {
		if ( object1 != null && object3 == null ) {
			if ( object2.velocity.x < 0 && object2.x < 24 && object2.y >= object1.y && object2.y <= object1.y + 50 ) {
				object2.velocity.x *= -1;
			}
		}
		if ( object3 != null && object1 == null ) {
			if ( object2.velocity.x > 0 && object2.x > 608 && object2.y >= object3.y && object2.y <= object3.y + 50 ) {
				object2.velocity.x *= -1;
			}
		}
	}
}