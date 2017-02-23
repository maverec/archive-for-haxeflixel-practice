
import visuals.*;
import systems.*;
import nodes.*;
import managers.*;
import components.options.*;
import components.Components;
import composure.core.ComposeGroup;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class Play extends flixel.FlxState
{	
	private var blueShip : Graphic;
	private var bullets : Manager;
	private var enemies : Manager;
	private var potions : Manager;
	private var explosions : ParticleManager;
	private var bTimer : Int;
	private var sTimer : Int;
	private var pTimer : Int;
	private var alternateGun : Bool;
	private var hpDisplay : FlxText;
	private var scoreDisplay : FlxText;
	
	override public function create() : Void {
		super.create();
		
		hpDisplay = new FlxText( 20, 10 );
		hpDisplay.size = 20;
		scoreDisplay = new FlxText( 230, 50 );
		scoreDisplay.size = 30;
		
		bTimer = 0;
		sTimer = Math.round( Math.random() * 50 ) + 50;
		pTimer = Math.round( Math.random() * 100 ) + 150;
		alternateGun = true;
		
		blueShip = new Graphic({
			X : 80,
			Y : 220,
			w : 16,
			h : 32,
			clr : FlxColor.BLUE,
			hp : 5
		});
		bullets = new Manager();
		enemies = new Manager();
		potions = new Manager();
		explosions = new ParticleManager();
		
		add( blueShip );
		add( bullets );
		add( enemies );
		add( potions );
		add( explosions );
		add( hpDisplay );
		add( scoreDisplay );
	}
	
	override public function update() : Void {
		super.update();
		
		if ( flixel.FlxG.keys.pressed.ESCAPE ) {
			flash.system.System.exit( 0 );
		}
		
		hpDisplay.text = "HP: " + blueShip.health;
		scoreDisplay.text = "SCORE: " + Reg.score;
		
		if ( blueShip.health == 0 ) {
			scoreDisplay.text = "GAME OVER";
		}
		
		// ENEMY COLLISIONS
		var enemy_collision : ComposeGroup = new ComposeGroup();
		enemy_collision.addTrait( new GraphicNode({
			graphic : enemies
		}) );
		enemy_collision.addTrait( new Node({
			graphic : bullets,
			damage : -1,
			scorePoints : 1,
			emitter : explosions,
			particlesToEmit : 3
		}) );
		enemy_collision.addTrait( new CollisionSystem() );
		enemy_collision.addTrait( new Node({
			graphic : blueShip,
			damage : -3,
			scorePoints : 1,
			emitter : explosions,
			particlesToEmit : 3
		}, {
			damage : -1,
			scorePoints : 0,
			particlesToEmit : 3
		}) );
		enemy_collision.addTrait( new CollisionSystem() );

		// PLAYER MOTION AND BOUNDS
		var player_entity : ComposeGroup = new ComposeGroup();
		player_entity.addTrait( new GraphicNode({
			graphic : blueShip
		}) );
		player_entity.addTrait( new Node({
			keyUp : [ "UP", "W" ],
			keyDown : [ "DOWN", "S" ],
			keyLeft : [ "LEFT", "A" ],
			keyRight : [ "RIGHT", "D" ],
			speedX : 8,
			speedY : 8,
		}) );
		player_entity.addTrait( new MotionSystem() );
		player_entity.addTrait( new Node({
			boundsRX : 640,
			boundsLX : 0,
			boundsTY : 0,
			boundsBY : 480
		}) );
		player_entity.addTrait( new BoundsSystem() );
		player_entity.addTrait( new Node({
			graphic : potions,
			damage : 1,
			scorePoints : 0,
			emitter : explosions,
			particlesToEmit : 3
		}) );
		player_entity.addTrait( new CollisionSystem() );
		
		// BULLETS SPAWN AND FIRE TRIGGER
		var bullet_entity : ComposeGroup = new ComposeGroup();
		if ( bTimer == 0 ) {
			bTimer = 5;
			var b : Graphic = new Graphic({
				w : 7,
				h : 3,
				clr : FlxColor.WHITE,
				boundsRX : 640
			});
			bullet_entity.addTrait( new GraphicNode({
				graphic : b
			}) );
			bullet_entity.addTrait( new Node({
				graphic : blueShip,
				keyShoot : [ "SPACE" ],
				speedX : 500,
				alternatingPos : alternateGun,
				manager : bullets
			}) );
		}
		alternateGun = !alternateGun;
		if ( bTimer > 0 ) {
			bTimer--;
		}
		bullet_entity.addTrait( new FiringSystem() );
		
		// ENEMIES SPAWN
		var enemy_entity : ComposeGroup = new ComposeGroup();
		if ( sTimer == 0 ) {
			sTimer = Math.round( Math.random() * 30 ) + 20;
			var e : Graphic = new Graphic({
				w : 16,
				h : 32,
				clr : FlxColor.RED,
				boundsLX : -16,
				hp : 3
			});
			enemy_entity.addTrait( new GraphicNode({
				graphic : e
			}) );
			enemy_entity.addTrait( new Node({
				graphic : blueShip,
				X : 650,
				Y : Math.round( Math.random() * 448 ),
				speedX : -Math.ceil( Math.random() * 250 ),
				manager : enemies
			}) );
		}
		if ( sTimer > 0 ) {
			sTimer--;
		}
		enemy_entity.addTrait( new SpawnSystem() );
		
		// POTIONS SPAWN
		var potion_entity : ComposeGroup = new ComposeGroup();
		if ( pTimer == 0 ) {
			pTimer = Math.round( Math.random() * 500 ) + 640;
			var p : Graphic = new Graphic({
				w : 16,
				h : 16,
				clr : FlxColor.PURPLE,
				boundsLX : -16,
			});
			potion_entity.addTrait( new GraphicNode({
				graphic : p
			}) );
			potion_entity.addTrait( new Node({
				graphic : blueShip,
				X : 650,
				Y : Math.round( Math.random() * 424 ),
				speedX : -100,
				speedY : -Math.ceil( Math.cos( Math.random() * 5 * Math.PI ) * -15 ),
				manager : potions
			}) );
		}
		if ( pTimer > 0 ) {
			pTimer--;
		}
		potion_entity.addTrait( new SpawnSystem() );
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}