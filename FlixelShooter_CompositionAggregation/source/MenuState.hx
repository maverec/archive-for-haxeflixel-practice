package;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var stage : ComposeRoot = new ComposeRoot();
	
	// entity instances
	private var player : PlayerShip;
	
	// TESTING :
	public static var bulletsLayer : FlxTypedGroup<Bullet>;
	private var numBullets : Int = 64;
	private var bullet : Bullet;
	
	// TESTING : 
	public static var enemyLayer : FlxTypedGroup<Enemy>;
	private var numEnemy : Int = 20;
	private var spawnInterval : Int;
	private var e : Enemy;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		player = new PlayerShip( 288, 400 );
		add( player );
		
		// TESTNG
		spawnInterval = Math.round( Math.random() * 50 ) + 50;
		
		// TESTING :
		bulletsLayer = new FlxTypedGroup<Bullet>( numBullets );
		for ( i in 0 ... numBullets ) {
			bullet = new Bullet( -100, -100 );
			bullet.exists = false;
			
			bulletsLayer.add( bullet );
		}
		
		// TESTING :
		enemyLayer = new FlxTypedGroup<Enemy>();
		
		add( bulletsLayer );
		add( enemyLayer );
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
		
		
		// TODO : keyboard input movement logic here
		// TESTING :
		var input : ComposeGroup = new ComposeGroup();
		input.addTrait( new KeyInputUtility( [ "DOWN", "S" ], player, 8, true ) );
		input.addTrait( new KeyInputUtility( [ "UP", "W" ], player, -8, true ) );
		input.addTrait( new KeyInputUtility( [ "RIGHT", "D" ], player, 8, false ) );
		input.addTrait( new KeyInputUtility( [ "LEFT", "A" ], player, -8, false ) );
		input.addTrait( new ShootKeyInputUtility ( [ "SPACE" ], player ) );
		
		// TODO : bounds logic here
		// TESTING :
		var bounds : ComposeGroup = new ComposeGroup();
		bounds.addTrait( new ScreenEdgeUtility( true, player, 8, 448 ) );
		bounds.addTrait( new ScreenEdgeUtility( false, player, 0, 608 ) );
		
		// TODO : spawn logic here
		// TESTING :
		// var spawn : ComposeGroup = new ComposeGroup();
		// spawn.addTrait( new ObjectTrait( player ) );
		// spawn.addTrait( new RandomNumberTrait( spawnInterval ) );
		// spawn.addTrait( new EnemyTrait( e ) );
		// spawn.addTrait( new SpawnUtility( ) );
		
		// TESTING
		var spawn : SpawnUtility = new SpawnUtility();
			if ( spawnInterval == 0 ) {
				var en : Enemy = new Enemy();
				enemyLayer.add( en );
				
				en.x = 680;
				en.y = Math.round( Math.random() * 438 );
				
				spawnInterval = Math.round( Math.random() * 20 ) + 30;
			}
			if ( spawnInterval > 0 ) {
				spawnInterval--;
			}
		
		// TESTING :
		// stage.addChild( input );
		// stage.addChild( bounds );
		// stage.addChild( spawn );
	}	
}