package ;	// TODO : will be put into Trait later

class RemoveNotVisibleTrait
{
	public function new( rightEdge:Bool, object:Dynamic, num:Int ) {
		if ( rightEdge ) {
			if ( object.x > num ) {
				object.kill();
			}
		} else {
			if ( object.x < num ) {
				object.kill();
			}
		}
	}
}