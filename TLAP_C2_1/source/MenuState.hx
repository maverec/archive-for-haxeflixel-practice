package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var counter 	: Int;
	var maxCOUNTER	: Int;
	var reps	: Int;
	var numOFblocks	: Int;
	var dx		: Int;
	var dy		: Int;
	var rowNUM	: Int;
	
	override public function create() {
		super.create();
		
		counter		= 0;
		maxCOUNTER	= 10;
		reps		= 15;
		numOFblocks	= 5;
		dx		= 20;
		dy		= 20;
		rowNUM		= 1;
		
	} //create

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		if(counter < 0) counter = 0;
		if(counter == 0 && reps > 0) {
			counter = maxCOUNTER;
	                reps--;
			
	                if(numOFblocks == 0) {
	                        numOFblocks = 5 - rowNUM++;
	                        dy += 30;
	                        dx = 20;
	                }
	                numOFblocks--;
			
			var block = new FlxSprite(dx,dy);
			block.makeGraphic(8,8,FlxColor.WHITE);
			add(block);
				
			if(block.x == dx + 20) block.x += 20;
	                dx += 20;

		}
		if(counter > 0) counter--;
		
	} //update
	
} //MenuState
