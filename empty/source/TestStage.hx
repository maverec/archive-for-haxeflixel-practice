
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxState;

import components.*;
import graphics.*;
import systems.*;

class TestStage extends FlxState
{	
	private var stage : ComposeRoot = new ComposeRoot();
	
	private var playerGPH : PaddleGraphic;
	private var enemyGPH : PaddleGraphic;
	private var ballGPH : BallGraphic;
	
	override public function create() : Void {
		super.create();
		
		playerGPH = new PaddleGraphic( 10, 200 );
		enemyGPH = new PaddleGraphic( 618, 200 );
		ballGPH = new BallGraphic( 300, 220 );
		
		add( playerGPH );
		add( enemyGPH );
		add( ballGPH );
		
		var movement : ComposeGroup = new ComposeGroup();
		movement.addTrait( new GraphicComponent( ballGPH ) );
		movement.addTrait( new AngleComponent( Math.random() * 2 * Math.PI ) );
		movement.addTrait( new SpeedComponent( 200 ) );
		movement.addTrait( new MovementSystem() );
	}
	
	override public function update() : Void {
		super.update();
		
		var motion : ComposeGroup = new ComposeGroup();
		motion.addTrait( new GraphicComponent( playerGPH ) );
		motion.addTrait( new KeyComponent( [ "W", "UP" ], [ "S", "DOWN" ] ) );
		motion.addTrait( new SpeedComponent( 5 ) );
		motion.addTrait( new MotionSystem() );
		motion.addTrait( new DimensionComponent( 12, 50 ) );
		motion.addTrait( new BoundsComponent( 0, 480 ) );
		motion.addTrait( new BoundsSystem() );
		
		var bounce : ComposeGroup = new ComposeGroup();
		bounce.addTrait( new GraphicComponent( ballGPH ) );
		bounce.addTrait( new BoundsComponent( 0, 480 ) );
		bounce.addTrait( new SpeedComponent( -1 ) );
		bounce.addTrait( new DimensionComponent( 24, 24 ) );
		bounce.addTrait( new BounceSystem() );
		
		var resetB : ComposeGroup = new ComposeGroup();
		resetB.addTrait( new GraphicComponent( ballGPH ) );
		resetB.addTrait( new BoundsComponent( 5, 623 ) );
		resetB.addTrait( new PositionComponent( 300, 220 ) );
		resetB.addTrait( new ResetPositionSystem() );
		
		var boundsE : ComposeGroup = new ComposeGroup();
		boundsE.addTrait( new GraphicComponent( enemyGPH ) );
		boundsE.addTrait( new DimensionComponent( 12, 50 ) );
		boundsE.addTrait( new BoundsComponent( 0, 480 ) );
		boundsE.addTrait( new BoundsSystem() );
		
		var ai : ComposeGroup = new ComposeGroup();
		ai.addTrait( new CheckAgainstComponent( ballGPH, enemyGPH ) );
		ai.addTrait( new SpeedComponent( 200 ) );
		ai.addTrait( new AISystem() );
		
		var collision : ComposeGroup = new ComposeGroup();
		collision.addTrait( new GraphicComponent( ballGPH ) );
		collision.addTrait( new CheckAgainstComponent( playerGPH, enemyGPH ) );
		collision.addTrait( new CollisionSystem() );

	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}