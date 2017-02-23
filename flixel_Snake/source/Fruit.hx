package ;

// import calls
	import flixel.FlxSprite;
	import flixel.util.FlxColor;

class Fruit extends FlxSprite
{
	public function new() {
		super();
		
		makeGraphic( Variables.BLOCK_SIZE - 2, Variables.BLOCK_SIZE - 2, FlxColor.RED );
	}
}