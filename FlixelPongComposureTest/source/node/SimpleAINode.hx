package node;

class SimpleAINode
{
	public function new( object1:Dynamic, object2:Dynamic, num1:Int, num2:Int, ?num3:Int, pixels:Int ) {
		if ( object1.x > num1 && object2.y < object1.y - num2 ) { 
			object2.y += 2; 
		}
		if ( object1.x > num1 && object2.y > object1.y - num2 ) {
			object2.y -= 2;
		}
	}
}