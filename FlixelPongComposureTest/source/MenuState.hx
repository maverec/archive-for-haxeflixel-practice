package ;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

// import entity.PaddleOne;
// import entity.BallOne;
// import node.ScoreNode;
// import node.BounceContactNode;
// import node.SimpleAINode;
// import node.PointNode;

import entity.*;
import node.*;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var paddle : PaddleOne;	
	private var paddleE : PaddleOne;
	private var ball : BallOne;
	private var hud : ScoreNode;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		paddle = new PaddleOne( 10, FlxG.height / 2 - 25 );
		paddleE = new PaddleOne( 618, FlxG.height / 2 - 25 );
		ball = new BallOne( FlxG.width / 2, FlxG.height / 2 );
		hud = new ScoreNode();
		add( paddle );
		add( paddleE );
		add( ball );
		add( hud );
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
		
		if ( FlxG.keys.pressed.ESCAPE ) {
			flash.system.System.exit( 0 );
		}
		
		//
		if ( ball.x < 10 ) {
			hud.updateScore( false, 1 );
		}
		if ( ball.x > 624 ) {
			hud.updateScore( true, 1 );
		}
		
		//
		paddle.inputActive( true );
		paddleE.inputActive( false );
		
		var rootMeh = new ComposeRoot();
		
		var groupMeh = new ComposeGroup();
		groupMeh.addTrait( new BounceContactNode( paddle, ball, null ) );
		groupMeh.addTrait( new BounceContactNode( null, ball, paddleE ) );
		groupMeh.addTrait( new SimpleAINode( ball, paddleE, 500, 27, 7, 2 ) );
		// groupMeh.addTrait( new KeyboardNode( [ "DOWN", "S" ], [ "UP", "W" ], 5, paddle ) );
		groupMeh.addTrait( new PointNode( ball ) );

		
		rootMeh.addChild( groupMeh );
	}	
}