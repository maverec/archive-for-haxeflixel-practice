package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.input.keyboard.FlxKey;
import flixel.group.FlxSpriteGroup;

class MenuState extends FlxState
{
	var checksumTEXT	: FlxSpriteGroup;
	var checksumVALUE	: Int;
	var pos			: Int;
	var dx			: Int;
	
	override public function create() {
		super.create();
		
		checksumTEXT	= new FlxSpriteGroup();
		checksumVALUE	= 0;
		pos		= 0;
		dx		= 20;
		
		add(checksumTEXT);
	} //create

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		csLogic(0,[FlxKey.ZERO]);
		csLogic(1,[FlxKey.ONE]);
		csLogic(2,[FlxKey.TWO]);
		csLogic(3,[FlxKey.THREE]);
		csLogic(4,[FlxKey.FOUR]);
		csLogic(5,[FlxKey.FIVE]);
		csLogic(6,[FlxKey.SIX]);
		csLogic(7,[FlxKey.SEVEN]);
		csLogic(8,[FlxKey.EIGHT]);
		csLogic(9,[FlxKey.NINE]);
		
		if(FlxG.keys.anyJustPressed( [FlxKey.ENTER] )) {
			if(checksumVALUE > 0) {
				if(checksumVALUE % 10 == 0) {
					var approve = new FlxText(20,40);
					approve.text = "Valid. \nPress R to reset.";
					approve.size = 12;
					add(approve);
				} else {
					var disapprove = new FlxText(20,40);
					disapprove.text = "Invalid. \nPress R to reset.";
					disapprove.size = 12;
					add(disapprove);
				}				
			}
		}
		
		if(FlxG.keys.anyJustPressed( [FlxKey.R] )) {
			FlxG.resetState();
		}
	} //update
	
	public function csLogic(n:Int,key:Array<FlxKey>) {
		if(FlxG.keys.anyJustPressed( key )) {
			var textP = new FlxText(dx,20);
			textP.text = "" + n;
			textP.size = 12;
			checksumTEXT.add(textP);
			
			if(pos % 2 == 0) checksumVALUE += n;
			if(pos % 2 != 0) {
				var doubleN = n * 2;
				if(doubleN >= 10) {
					checksumVALUE += 1 + (doubleN % 10);
				} else {
					checksumVALUE += doubleN;
				}
			}
			pos++;
			dx += 20;
		}
	} //csLogic

} //MenuState