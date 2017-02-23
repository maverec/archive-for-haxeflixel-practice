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
	var numTOsub	: Int;
	var numTOsub2	: Int;
	var numTOmulti	: Int;
	var num3	: Int;
	var numMULTItwo	: Int;
	var numMULTIthree	: Int;

	
	override public function create() {
		super.create();
		
		counter		= 0;
		maxCOUNTER	= 10;
		reps		= 40;
		numOFblocks	= 2;
		dx		= 20;
		dy		= 20;
		rowNUM		= 1;
		numTOsub	= 13;
		numTOsub2	= 3;
		numTOmulti	= 1;
		num3		= 1;
		numMULTItwo	= 7;
		numMULTIthree	= 5;
	} //create

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		if(counter < 0) counter = 0;
		if(counter == 0 && reps > 0) {
			counter = maxCOUNTER;
	                reps--;
			
			if(rowNUM < 5){
				if(numOFblocks == num3) {
					dx = (2 * numMULTItwo) * 20;
					numMULTItwo--;
					num3++;
				}				
			} else if(rowNUM == 6) {
				if(numOFblocks == 3) {
					dx = 200;
				}
			} else if(rowNUM == 7) {
				if(numOFblocks == 2) {
					dx = 240;
				}
			} else if(rowNUM == 8) {
				if(numOFblocks == 1) {
					dx = 280;
				}
			} else {
				null;
			}
			
	                if(numOFblocks == 0) {
				rowNUM++;
				if(rowNUM < 5) {
					numOFblocks = rowNUM * 2;
					dx = 20 * rowNUM;
				}
				if(rowNUM > 4) {
					numOFblocks = numTOsub - rowNUM;
					dx = numOFblocks * 10;
					numTOsub--;
				}
	                        dy += 30;
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
