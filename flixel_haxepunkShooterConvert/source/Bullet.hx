package ;

import flixel.FlxSprite;

class Bullet extends FlxSprite
{
	public function new() {
		super();
		
		loadGraphic("assets/images/bullet.png", false, 14, 24);
		this.angle = 90;
		setGraphicSize(7, 12);
		updateHitbox();
	}
	
	override public function update() {
		super.update();
		
		this.x += 10;
		
		// remove this sprite when off screen
		if (this.x > 680) {
			this.kill();
		}
	}
}