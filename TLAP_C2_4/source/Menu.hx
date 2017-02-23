package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.input.keyboard.FlxKey;
import flixel.group.FlxSpriteGroup;

class Menu extends FlxState
{
	var dx 		: Int;
	var dy		: Int;
	var ddx		: Int;
	var numText	: String;
	var numTextGrp	: FlxSpriteGroup;
	var abcTextGrp	: FlxSpriteGroup;
	var modeUpper	: Bool;
	var modeLower	: Bool;
	var modePunc	: Bool;
	var numModulo	: Int;
	
	var textModeU	: FlxText;
	var textModeL	: FlxText;
	var textModeP	: FlxText;
	
	override public function create() {
		super.create();
		
		dx = 20;
		dy = 20;
		ddx = 20;
		modeUpper = true;
		modeLower = false;
		modePunc = false;
		
		textModeU = new FlxText(20,320);
		textModeU.size = 13;
		textModeU.text = "UPPERCASE MODE";
		textModeU.visible = true;
		
		textModeL = new FlxText(20,320);
		textModeL.size = 13;
		textModeL.text = "LOWERCASE MODE";
		textModeL.visible = false;
		
		textModeP = new FlxText(20,320);
		textModeP.size = 13;
		textModeP.text = "PUNCTUATION MODE";
		textModeP.visible = false;
		
		numTextGrp = new FlxSpriteGroup();
		abcTextGrp = new FlxSpriteGroup();
		numText = "";
		
		add(textModeU);
		add(textModeL);
		add(textModeP);
		add(numTextGrp);
		add(abcTextGrp);
	} //create

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		takeInput(FlxKey.ZERO,0);
		takeInput(FlxKey.ONE,1);
		takeInput(FlxKey.TWO,2);
		takeInput(FlxKey.THREE,3);
		takeInput(FlxKey.FOUR,4);
		takeInput(FlxKey.FIVE,5);
		takeInput(FlxKey.SIX,6);
		takeInput(FlxKey.SEVEN,7);
		takeInput(FlxKey.EIGHT,8);
		takeInput(FlxKey.NINE,9);
		
		if(FlxG.keys.anyJustPressed( [FlxKey.ENTER,FlxKey.COMMA] )) {
			var commaTxt = new FlxText(dx,dy);
			commaTxt.text += ",";
			commaTxt.size = 13;
			dx += 12;
			numTextGrp.add(commaTxt);
			var numConvert = Std.parseInt(numText);
			
			// if(modeUpper) numModulo = 27;
			// if(modeLower) numModulo = 27;
			// if(modePunc) numModulo = 9;
			// 
			// if(modeUpper || modeLower) numModulo = 27;
			// else numModulo = 9;
			// 
			// if(numConvert % numModulo == 0) {
			// 	if(modeUpper) {
			// 		textModeU.visible = false;
			// 		textModeL.visible = true;
			// 		
			// 		modePunc = false;
			// 		modeUpper = false;
			// 		modeLower = true;
			// 	} else if(modeLower) {
			// 		textModeL.visible = false;
			// 		textModeP.visible = true;
			// 		
			// 		modeLower = false;
			// 		modeUpper = false;
			// 		modePunc = true;
			// 	} else {
			// 		textModeP.visible = false;
			// 		textModeU.visible = true;
			// 		
			// 		modePunc = false;
			// 		modeLower = false;
			// 		modeUpper = true;
			// 	}
			// }
			
			if(numConvert >= 0) {
				var testValue = new FlxText(ddx,400);
				
				if(modeUpper) {
					if(numConvert % 27 == 0) {
						textModeU.visible = false;
						textModeL.visible = true;
						
						modePunc = false;
						modeUpper = false;
						modeLower = true;
					}
					if(numConvert % 27 == 1) testValue.text += "A";
					if(numConvert % 27 == 2) testValue.text += "B";
					if(numConvert % 27 == 3) testValue.text += "C";
					if(numConvert % 27 == 4) testValue.text += "D";
					if(numConvert % 27 == 5) testValue.text += "E";
					if(numConvert % 27 == 6) testValue.text += "F";
					if(numConvert % 27 == 7) testValue.text += "G";
					if(numConvert % 27 == 8) testValue.text += "H";
					if(numConvert % 27 == 9) testValue.text += "I";
					if(numConvert % 27 == 10) testValue.text += "J";
					if(numConvert % 27 == 11) testValue.text += "K";
					if(numConvert % 27 == 12) testValue.text += "L";
					if(numConvert % 27 == 13) testValue.text += "M";
					if(numConvert % 27 == 14) testValue.text += "N";
					if(numConvert % 27 == 15) testValue.text += "O";
					if(numConvert % 27 == 16) testValue.text += "P";
					if(numConvert % 27 == 17) testValue.text += "Q";
					if(numConvert % 27 == 18) testValue.text += "R";
					if(numConvert % 27 == 19) testValue.text += "S";
					if(numConvert % 27 == 20) testValue.text += "T";
					if(numConvert % 27 == 21) testValue.text += "U";
					if(numConvert % 27 == 22) testValue.text += "V";
					if(numConvert % 27 == 23) testValue.text += "W";
					if(numConvert % 27 == 24) testValue.text += "X";
					if(numConvert % 27 == 25) testValue.text += "Y";
					if(numConvert % 27 == 26) testValue.text += "Z";
				} else if(modeLower) {
					if(numConvert % 27 == 0) {
						textModeL.visible = false;
						textModeP.visible = true;
						
						modeLower = false;
						modeUpper = false;
						modePunc = true;
					}
					if(numConvert % 27 == 1) testValue.text += "a";
					if(numConvert % 27 == 2) testValue.text += "b";
					if(numConvert % 27 == 3) testValue.text += "c";
					if(numConvert % 27 == 4) testValue.text += "d";
					if(numConvert % 27 == 5) testValue.text += "e";
					if(numConvert % 27 == 6) testValue.text += "f";
					if(numConvert % 27 == 7) testValue.text += "g";
					if(numConvert % 27 == 8) testValue.text += "h";
					if(numConvert % 27 == 9) testValue.text += "i";
					if(numConvert % 27 == 10) testValue.text += "j";
					if(numConvert % 27 == 11) testValue.text += "k";
					if(numConvert % 27 == 12) testValue.text += "l";
					if(numConvert % 27 == 13) testValue.text += "m";
					if(numConvert % 27 == 14) testValue.text += "n";
					if(numConvert % 27 == 15) testValue.text += "o";
					if(numConvert % 27 == 16) testValue.text += "p";
					if(numConvert % 27 == 17) testValue.text += "q";
					if(numConvert % 27 == 18) testValue.text += "r";
					if(numConvert % 27 == 19) testValue.text += "s";
					if(numConvert % 27 == 20) testValue.text += "t";
					if(numConvert % 27 == 21) testValue.text += "u";
					if(numConvert % 27 == 22) testValue.text += "v";
					if(numConvert % 27 == 23) testValue.text += "w";
					if(numConvert % 27 == 24) testValue.text += "x";
					if(numConvert % 27 == 25) testValue.text += "y";
					if(numConvert % 27 == 26) testValue.text += "z";
				} else {
					if(numConvert % 9 == 0) {
						textModeP.visible = false;
						textModeU.visible = true;
						
						modePunc = false;
						modeLower = false;
						modeUpper = true;
					}
					if(numConvert % 9 == 1) testValue.text += "!";
					if(numConvert % 9 == 2) testValue.text += "?";
					if(numConvert % 9 == 3) testValue.text += ",";
					if(numConvert % 9 == 4) testValue.text += ".";
					if(numConvert % 9 == 5) testValue.text += " ";
					if(numConvert % 9 == 6) testValue.text += ";";
					if(numConvert % 9 == 7) testValue.text += "\"";
					if(numConvert % 9 == 8) testValue.text += "'";
				}
				testValue.size = 12;
				add(testValue);
				numText = "";
				numConvert = 0;
			}
			ddx += 12;				
		}
	} //update

	function takeInput(pickedKey:Int, num:Int) {
		if(FlxG.keys.anyJustPressed( [pickedKey] )) {			
			var inputTxt = new FlxText(dx,dy);
			inputTxt.text += num;
			inputTxt.size = 13;
			dx += 12;
			
			if(inputTxt.x >= FlxG.width - 20) {
				dy += 12;
				dx = 20;
			}
			
			numTextGrp.add(inputTxt);
			numText += num;
		}
	} //getInput

} //Menu
