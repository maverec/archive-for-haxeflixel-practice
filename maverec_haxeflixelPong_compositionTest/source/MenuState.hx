package;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.system.FlxSound;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var paddlePlayer:Paddle;
	private var paddleAI:Paddle;
	private var ball:Ball;
	private var pixelsPerFrame:Int;
	private var scoreDisplay:FlxText;
	private var playerScore:Int;
	private var enemyScore:Int;
	private var destroySound:FlxSound;
	private var heightBounds:Int;
	
		
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		super.create();
		
		pixelsPerFrame = 5;
		
		heightBounds = FlxG.stage.stageHeight - 50;
				
		
		paddlePlayer = new Paddle(20, FlxG.stage.stageHeight / 2.5);
		add(paddlePlayer);
		
		paddleAI = new Paddle(610, FlxG.stage.stageHeight / 2.5);
		add(paddleAI);
		
		ball = new Ball(FlxG.stage.stageWidth / 2, FlxG.stage.stageHeight / 2.25);
		add(ball);
		
		scoreDisplay = new FlxText(FlxG.stage.stageWidth / 2 - 24, 50);
		scoreDisplay.size = 24;
		add(scoreDisplay);
		
		if(!(Reg.scores[0] > 0)) Reg.scores[0] = 0;
		if(!(Reg.scores[1] > 0)) Reg.scores[1] = 0;
		
		enemyScore = Reg.scores[1];
		playerScore = Reg.scores[0];
		
		destroySound = FlxG.sound.load(AssetPaths.kaboom__ogg);
		destroySound.volume = 10;
	}
	
	public function ballHitPaddle(thisBall:Dynamic, thisPaddle:Dynamic):Void {
		thisBall.bounce(thisPaddle);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {
		super.update();
		
		// pretty simple, when the ESC key is pressed, the window is closed
		if ( FlxG.keys.pressed.ESCAPE ) {
			System.exit( 0 );
		}
		
		// making sure the ball bounces when the ball sprite overlaps a paddle sprite
		FlxG.overlap(ball, paddlePlayer, ballHitPaddle);
		FlxG.overlap(ball, paddleAI, ballHitPaddle);

		// keyboard instructions for the player's paddle
		// if(FlxG.keys.anyPressed(["S", "DOWN"])) {
		// 	paddlePlayer.y += pixelsPerFrame;
		// }
		// if(FlxG.keys.anyPressed(["W", "UP"])) {
		// 	paddlePlayer.y -= pixelsPerFrame;
		// }
		
		// TESTED and WORKING
		// keyboard logic for moving the player's paddle around the screen
		// var keyInstruction : KeyboardLogic = new KeyboardLogic();
		InputLogicStructure.keysNode( paddlePlayer, pixelsPerFrame );
		
		// ai paddle movement, depending on the x position of the ball
		if (ball.x > 500 && paddleAI.y < ball.y - 27) { paddleAI.y += 2; }
		if (ball.x > 500 && paddleAI.y > ball.y - 7) { paddleAI.y -= 2; }
			
		// adding a point to the scoreboard and resetting the ball to the center when the ball hits the sides
		if(ball.x < 10) {
			Reg.scores[1]++;
			FlxG.switchState(new MenuState());
			destroySound.play();
		}
		if(ball.x + ball.width > FlxG.stage.stageWidth - 10) {
			Reg.scores[0]++;
			FlxG.switchState(new MenuState());
			destroySound.play();
		}
		// having the ball bounce when it hits the top or bottom
		if(ball.y < 0 || ball.y + ball.height > FlxG.stage.stageHeight) {
			ball.velocity.y *= -1;
			ball.bounceSound.play();
		}
		
		// displaying the scoreboard
		scoreDisplay.text = playerScore + " : " + enemyScore; 

		// // paddle screen boundaries, so they don't go offscreen
		// if(paddlePlayer.y < 0) { paddlePlayer.y = 0; }
		// if(paddleAI.y < 0) { paddleAI.y = 0; }
		// if(paddlePlayer.y > heightBounds) { paddlePlayer.y = heightBounds; } 
		// if(paddleAI.y > heightBounds) { paddleAI.y = heightBounds; }
		
		// TESTED and WORKING
		// setting the screen boundaries for the paddles, to make sure they don't go offscreen
		// var screenBounds : BoundariesLogic = new BoundariesLogic();
		BoundaryLogicStructure.verticalBoundsNode( paddlePlayer, 0, heightBounds );
		BoundaryLogicStructure.verticalBoundsNode( paddleAI, 0, heightBounds );
	}	
}