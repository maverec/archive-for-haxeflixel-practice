package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var paddleP : Paddle;
	private var paddleE : Paddle;
	private var ball : Ball;
	private var hud : Score;
	
	private var playerScore : Int;
	private var enemyScore : Int;
	
	//
	
	private function bounceContact( object1:Paddle, object2:Ball ) : Void {
		ball.bounce( object1 );
	}
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();

		paddleP = new Paddle( 10, 200 );
		paddleE = new Paddle( 618, 200 );
		ball = new Ball( FlxG.width / 2, FlxG.height / 2 );
		hud = new Score();
		add( paddleP );
		add( paddleE );
		add( ball );
		add( hud );
		
		if ( !( Reg.scores[ 0 ] > 0 ) ) {
			Reg.scores[ 0 ] = 0;
		}
		if ( !( Reg.scores[ 1 ] > 0 ) ) {
			Reg.scores[ 1 ] = 0;
		}
		
		playerScore = Reg.scores[ 0 ];
		enemyScore = Reg.scores[ 1 ];
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		FlxG.mouse.visible = false;
		
		// pressing the escape key closes the window
		if ( FlxG.keys.pressed.ESCAPE ) {
			flash.system.System.exit(0);
		}
		
		FlxG.overlap( paddleP, ball, bounceContact );
		FlxG.overlap( paddleE, ball, bounceContact );
		
		AILogicTree.easyAINode( ball, paddleE, 2 );
		
		hud.displayScore( playerScore, enemyScore );
		
		// keyboard input, for a paddle
		InputLogicTree.keyNode( [ "DOWN", "S" ], [ "UP", "W" ], 5, paddleP );
		
		// setting boundaries to make sure paddles don't go off screen
		BoundsLogicTree.boundsYNode( paddleP, 0, 430 );
		BoundsLogicTree.boundsYNode( paddleE, 0, 430 );
		
		//
		if ( ball.x < 5 ) {
			// TODO : ADD SCORE OPTION HERE
			Reg.scores[ 1 ]++;
			FlxG.resetState();
			// TODO : ADD SOUND EFFECT HERE
		}
		if ( ball.x > 635 ) {
			// TODO : ADD SCORE OPTION HERE
			Reg.scores[ 0 ]++;
			FlxG.resetState();
			// TODO : ADD SOUND EFFECT HERE
		}

	}	
}