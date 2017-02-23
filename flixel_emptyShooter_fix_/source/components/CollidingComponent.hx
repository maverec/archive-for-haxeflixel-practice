package components;

class CollidingComponent
{
	public var contactA : Dynamic;
	public var contactB : Dynamic;
	
	public function new( collider:Dynamic, collidee:Dynamic ) {
		this.contactA = collider;
		this.contactB = collidee;
	}
}