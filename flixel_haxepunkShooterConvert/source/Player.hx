package ;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class Player extends FlxSprite
{
	private var moveSpeed:Int;
	public var hp:Int;
	
	public function new() {
		super();
		
		moveSpeed = 8;
		
		hp = 3;
		
		// assigning a graphic to this class
		loadGraphic("assets/images/player.png", false, 64, 48);
		this.angle = 90;
		setGraphicSize(32, 24);
		updateHitbox();
		
		// starting position
		this.x = MenuState.STAGE_WIDTH / 2 - 32;
		this.y = MenuState.STAGE_HEIGHT - 80;
	}
	
	override public function update():Void {
		super.update();
		
		// keyboard input
		if (FlxG.keys.pressed.UP) {
			this.y -= moveSpeed;
		}
		if (FlxG.keys.pressed.DOWN) {
			this.y += moveSpeed;
		}
		if (FlxG.keys.pressed.LEFT) {
			this.x -= moveSpeed;
		}
		if (FlxG.keys.pressed.RIGHT) {
			this.x += moveSpeed;
		}
	}
}