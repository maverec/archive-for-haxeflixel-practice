package ;

// import calls
	import flixel.FlxSprite;
	import flixel.FlxG;
	import flixel.util.FlxColor;
	

class Snake extends FlxSprite
{	
	public function new( x : Int, y : Int ) {
		super( x, y );
		
		makeGraphic( Variables.BLOCK_SIZE - 2, Variables.BLOCK_SIZE - 2, FlxColor.OLIVE );
	}
	
}