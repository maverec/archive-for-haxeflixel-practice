package ;

import flixel.FlxSprite;
import flixel.FlxG;

class Enemy extends FlxSprite
{
	private var speed:Int;
	public var hp:Int;
	
	public function new() {
		super();
		
		speed = Math.ceil(Math.random() * 3);
		
		hp = 5;
				
		loadGraphic("assets/images/enemy.png", false, 64, 48);
		this.angle = 90;
		setGraphicSize(32, 24);
		updateHitbox();
	}
	
	override public function update() {
		super.update();
				
		this.x -= speed;
		
		// removing this when outside the screen
		if (this.x < -50) {
			this.kill();
		}
	}
}