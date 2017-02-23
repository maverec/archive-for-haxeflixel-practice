
import composure.core.ComposeGroup;
import flixel.text.FlxText;
import components.*;
import managers.*;
import systems.*;
import flixel.input.keyboard.FlxKey;

class Play extends flixel.FlxState
{
	private var player : Graphic;
	
	private var bullets : Manager;
	private var enemies : Manager;
	private var potions : Manager;
	private var explosions : ParticleManager;
	
	private var delay : Int;
	private var setDelay : Int;
	private var gun1 : Bool;
	private var spawnTimer : Int;
	private var pTimer : Int;

	private var hpDisplay : FlxText;
	private var scoreDisplay : FlxText;

	override public function create() : Void {
		super.create();
		
		delay = 0;
		setDelay = 5;
		gun1 = true;
		spawnTimer = Math.round( Math.random() * 50 ) + 50;
		pTimer = Math.round( Math.random() * 100 ) + 100;
		

		bullets = new Manager();
		enemies = new Manager();
		potions = new Manager();
		explosions = new ParticleManager();
		
		player = new Graphic( {
			x : 80,
			y : 220,
			w : 16,
			h : 32,
			clr : flixel.util.FlxColor.BLUE,
			hp : 5
		} );

		hpDisplay = new FlxText( 20, 10 );
		hpDisplay.size = 20;

		scoreDisplay = new FlxText( 240, 50 );
		scoreDisplay.size = 30;

		add( bullets );
		add( enemies );
		add( potions );
		add( explosions );
		add( player );

		add( hpDisplay );
		add( scoreDisplay );
		
	}

	override public function update(elapsed:Float) : Void {
		super.update(elapsed);
			
		hpDisplay.text = "HP: " + player.health;
		scoreDisplay.text = "SCORE: " + Reg.score;
		
		if ( player.health == 0 ) {
			scoreDisplay.text = "GAME OVER";
		}
		
		var collision_handler : ComposeGroup = new ComposeGroup();
		collision_handler.addTrait( new EmitterComponent( explosions ) );
		collision_handler.addTrait( new CollidingComponent( player, enemies ) );
		collision_handler.addTrait( new ParticleComponent( 3, 3 ) );
		collision_handler.addTrait( new HealthComponent( -1, -3 ) );
		collision_handler.addTrait( new ScoreComponent( 0, 1 ) );
		collision_handler.addTrait( new CollisionSystem() );
		collision_handler.addTrait( new CollidingComponent( player, potions ) );
		collision_handler.addTrait( new ParticleComponent( 3, 1 ) );
		collision_handler.addTrait( new HealthComponent( 1, -1 ) );
		collision_handler.addTrait( new ScoreComponent( 0, 0 ) );
		collision_handler.addTrait( new CollisionSystem() );
		collision_handler.addTrait( new CollidingComponent( bullets, enemies ) );
		collision_handler.addTrait( new ParticleComponent( 1, 3 ) );
		collision_handler.addTrait( new HealthComponent( -1, -1 ) );
		collision_handler.addTrait( new ScoreComponent( 0, 1 ) );
		collision_handler.addTrait( new CollisionSystem() );
		
		var player_entity : ComposeGroup = new ComposeGroup();
		player_entity.addTrait( new ObjectComponent( player ) );
		player_entity.addTrait( new KeyComponent(
			[ LEFT, A ],
			[ RIGHT, D ],
			[ DOWN, S ],
			[ UP, W ]
		));
		player_entity.addTrait( new SpeedComponent( 8, 8 ) );
		player_entity.addTrait( new MotionSystem() );
		player_entity.addTrait( new BoundsComponent( 0, 640, 480 ) );
		player_entity.addTrait( new BoundsSystem() );
		if ( delay == 0 ) {
			delay = setDelay;

			var b : Graphic = new Graphic( {
				w : 7,
				h : 3,
				clr : flixel.util.FlxColor.WHITE,
				boundsRX : 640
			}) ;

			player_entity.addTrait( new BulletComponent( b ) );
			player_entity.addTrait( new ManagerComponent( bullets ) );
			player_entity.addTrait( new FireKeyComponent( [ SPACE ] ) );
			player_entity.addTrait( new SpeedComponent( 500, 0 ) );

			if ( gun1 ) {
				player_entity.addTrait( new PositionComponent(
					player.x + 20,
					player.y + 8
				) );
			} else {
				player_entity.addTrait( new PositionComponent(
					player.x + 20,
					player.y + 30
				) );
			}
		}
		gun1 = !gun1;
		if ( delay > 0 ) {
			delay--;
		}
		player_entity.addTrait( new FiringSystem() );
		
		var enemy_entity : ComposeGroup = new ComposeGroup();
		if ( spawnTimer == 0 ) {
			var e : Graphic = new Graphic( { 
				w : 16,
				h : 32,
				clr : flixel.util.FlxColor.RED,
				boundsLX : -10
			} );

			enemy_entity.addTrait( new ObjectComponent( e ) );
			enemy_entity.addTrait( new ManagerComponent( enemies ) );
			enemy_entity.addTrait( new SpeedComponent(
				-Math.ceil( Math.random() * 250 ),
				0
			) );
			enemy_entity.addTrait( new PositionComponent(
				650,
				Math.round( Math.random() * ( 448 ) )
			) );
			enemy_entity.addTrait( new SpawnSystem() );

			spawnTimer = Math.round( Math.random() * 20 ) + 30;
		}
		if ( spawnTimer > 0 ) {
			spawnTimer--;
		}

		var potion_entity : ComposeGroup = new ComposeGroup();
		if ( pTimer == 0 ) {
			var pUP : Graphic = new Graphic( {
				w : 16,
				h : 16,
				clr : flixel.util.FlxColor.PURPLE,
				boundsLX : -10
			} );

			potion_entity.addTrait( new ObjectComponent( pUP ) );
			potion_entity.addTrait( new ManagerComponent( potions ) );
			potion_entity.addTrait( new SpeedComponent(
				-100,
				Math.ceil( Math.cos( Math.random() * 5 * Math.PI ) * -15 )
			) );
			potion_entity.addTrait( new PositionComponent(
				650,
				Math.round( Math.random() * ( 400 ) )
			) );
			potion_entity.addTrait( new SpawnSystem() );

			pTimer = Math.round( Math.random() * 500 ) + 300;
		}
		if ( pTimer > 0 ) {
			pTimer--;
		}
		
	}

	override public function destroy() : Void {
		super.destroy();
	}
}
