package node;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

class ScoreNode extends FlxSpriteGroup
{
	private var scoreDisplay : FlxText;
	private var leftScore : Int;
	private var rightScore : Int;
	
	public function new() {
		super();
		
		scoreDisplay = new FlxText( FlxG.width / 2 - 24, 50 );
		scoreDisplay.size = 24;
		
		leftScore = 0;
		rightScore = 0;
		
		add( scoreDisplay );
	}
	
	public function updateScore( test:Bool, num1:Int ) : Void {
		if ( test ) {
			leftScore += num1;
		}
		if ( !test ) {
			rightScore += num1;
		}
	}
	
	override public function update() : Void {
		super.update();
		
		scoreDisplay.text = leftScore + " : " + rightScore;
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}