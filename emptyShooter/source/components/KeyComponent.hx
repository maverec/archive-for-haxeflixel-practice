package components;

class KeyComponent
{
	public var goLeft : Array<String>;
	public var goRight : Array<String>;
	public var goDown : Array<String>;
	public var goUp : Array<String>;
	
	public function new( left:Array<String>, right:Array<String>, down:Array<String>, up:Array<String> ) {
		this.goLeft = left;
		this.goRight = right;
		this.goDown = down;
		this.goUp = up;
	}
}