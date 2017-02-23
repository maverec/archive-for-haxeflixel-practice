
package components;

class KeyComponent
{
	public var up : Array<String>;
	public var down : Array<String>;
	
	public function new( uKeyUp:Array<String>, uKeyDown:Array<String> ) {
		this.up = uKeyUp;
		this.down = uKeyDown;
	}
}