package ;

class BoundsNode
{
	public function new( object:Dynamic, numLeft:Int, numRight:Int, numTop:Int, numBottom:Int ) {
		if ( object.x < numLeft ) {
			object.x = numLeft;
		}
		if ( object.x > numRight ) {
			object.x = numRight;
		}
		if ( object.y < numTop ) {
			object.y = numTop;
		}
		if ( object.y > numBottom ) {
			object.y = numBottom;
		}
	}
}