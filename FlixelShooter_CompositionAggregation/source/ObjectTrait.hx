package ;	// TODO : will be put into Trait later

class ObjectTrait
{
	public var obj : Dynamic;
	
	public function new( obj : Dynamic ) {
		this.obj = obj;
		obj.exists = true;
	}
}