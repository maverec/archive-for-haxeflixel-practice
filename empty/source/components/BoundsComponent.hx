
package components;

class BoundsComponent
{
	public var top : Int;
	public var bottom : Int;
	
	public function new( uTopBounds:Int, uBottomBounds:Int ) {
		this.top = uTopBounds;
		this.bottom = uBottomBounds;
	}
}