package components;

class BoundsComponent
{
	public var edge : Int;
	public var edgeRight : Int;
	public var edgeBottom : Int;
	
	public function new( edgeZero:Int, right:Int, bottom:Int ) {
		this.edge = edgeZero;
		this.edgeRight = right;
		this.edgeBottom = bottom;
	}
}