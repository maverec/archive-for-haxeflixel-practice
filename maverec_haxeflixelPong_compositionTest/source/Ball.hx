package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;

class Ball extends FlxSprite
{
	private var contactPaddle:Paddle;
	public var bounceSound:FlxSound;
	
	public function new(x:Float, y:Float) {
		super(x, y);
		
		// creating the circle graphic for the ball
		makeGraphic(24, 24, FlxColor.TRANSPARENT);
		FlxSpriteUtil.drawCircle(this, 12, 12, 12, FlxColor.WHITE);
		setSize(24, 24);
		
		// variable for generating a random angle for when the ball starts moving
		var randomAngle = Math.random() * 2 * Math.PI;
		
		// determining the direction and speed of the movement for the ball
		this.velocity.x = Math.sin(randomAngle) * 200;
		this.velocity.y = Math.cos(randomAngle) * -200;
		
		// calling and assigning the volume for the sound when the ball bounces off of the paddle, the top or the bottom
		bounceSound = FlxG.sound.load(AssetPaths.plip__ogg);
		bounceSound.volume = 10;
	}
	
	// to change the direction of the ball when it bounces off of a paddle
	public function bounce(paddle:Paddle):Void {
		if(contactPaddle != paddle) {
			this.velocity.x *= -1;
			contactPaddle = paddle;
			bounceSound.play();
		}
	}
}