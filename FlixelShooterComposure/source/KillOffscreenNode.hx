package ;

class KillOffscreenNode
{
	public function new( ?left:Bool, ?right:Bool, object:Dynamic, ?numLeft:Int, ?numRight:Int ) {
		if ( right && !left ) {
			if ( object.x > numRight ) {
				object.kill();
			}
		}
		if ( !right && left ) {
			if ( object.x < numLeft ) {
				object.kill();
			}
		}
	}
}