package ;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

class Score extends FlxSpriteGroup
{
	private var scoreDisplay : FlxText;
		
	public function new() {
		super();
		
		scoreDisplay = new FlxText( FlxG.width / 2 - 24, 50 );
		scoreDisplay.size = 24;
		add( scoreDisplay );		
	}
	
	public function displayScore( score1:Int, score2:Int ) : Void {
		scoreDisplay.text = score1 + " : " + score2;
	}
}