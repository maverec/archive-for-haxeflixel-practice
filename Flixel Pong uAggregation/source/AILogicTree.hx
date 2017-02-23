package ;

import flixel.FlxSprite;

class AILogicTree
{	
	public static function easyAINode( object1:Dynamic, object2:Dynamic, pixels:Int ) : Void {
		if (object1.x > 500 && object2.y < object1.y - 27) { object2.y += 2; }
		if (object1.x > 500 && object2.y > object1.y - 7) { object2.y -= 2; }
	}
	
	public static function velocityNode( sprite:FlxSprite ) : Void {
		var randomAngle = Math.random() * 2 * Math.PI;
		
		sprite.velocity.x = Math.sin( randomAngle ) * 200;
		sprite.velocity.y = Math.cos( randomAngle ) * -200;
	}
	
	public function new() { }
}