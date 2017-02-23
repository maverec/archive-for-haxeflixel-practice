package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxTypedEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var playerShip:Player;
	
	private var bulletDelay:Int;
	private var currentDelay:Int;
	private var alternateCannon:Bool;
	
	private var spawnInterval:Int;
	
	private var bulletsLayer:FlxTypedGroup<Bullet>;
	private var enemiesLayer:FlxTypedGroup<Enemy>;
	
	private var explodeEmit:FlxTypedEmitter<Explosion>;
	
	private var sfx_explosion:FlxSound;
	private var sfx_shoot:FlxSound;
	private var sfx_hit:FlxSound;
		
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		super.create();
		
		// setting background color
		FlxG.camera.bgColor = FlxColor.CHARCOAL;
		
		bulletDelay = 5;
		currentDelay = 0;
		alternateCannon = true;
		
		spawnInterval = Math.round(Math.random() * 50) + 50;
		
		// adding playerShip sprite to screen
		playerShip = new Player();
		add(playerShip);
		
		// bullet group
		bulletsLayer = new FlxTypedGroup<Bullet>();
		add(bulletsLayer);
		
		// enemy group
		enemiesLayer = new FlxTypedGroup<Enemy>();
		add(enemiesLayer);
		
		// particles
		explodeEmit = new FlxTypedEmitter<Explosion>();
		// explodeEmit.setXSpeed(-15, 15);
		// explodeEmit.setYSpeed(-15, 15);
		add(explodeEmit);
		
		// sound effects
		sfx_explosion = FlxG.sound.load("assets/sounds/explosion.wav");
		sfx_shoot = FlxG.sound.load("assets/sounds/shoot.wav");
		sfx_hit = FlxG.sound.load("assets/sounds/hit.wav");
	}
	
	// for when a bullet collides with an enemy, used as a callback function for collision function (FlxG.overlap)
	private function enemyBulletCollision(bullet:Bullet, enemy:Enemy):Void {
		if (bullet.exists && enemy.exists) {
			bullet.kill();
			enemy.hp -= 1;
			
			// adding particle effects upon enemy death
			if (enemy.hp == 0) {
				enemy.kill();
				var i:Int;
				for (i in 0...3) {
					explodeEmit.at(enemy);
					var eB2:Explosion = new Explosion();
					explodeEmit.add(eB2);						explodeEmit.add(eB2);
				}
				explodeEmit.start(true, 1, 0, 3, 1);
				sfx_explosion.play();
			}
			
			// adding a particle effect when a bullet hits an enemy
			for (i in 0...1) {
				explodeEmit.at(bullet);	
				var eB:Explosion = new Explosion();
				explodeEmit.add(eB);
			}
			explodeEmit.start(true, 1, 0, 1, 1);
			sfx_hit.play();
		}
	}
	
	// for when a player collides with an enemy, callback function
	private function playerEnemyCollision(player:Player, enemy:Enemy):Void {
		enemy.kill();
		
		for (i in 0...3) {
			explodeEmit.at(enemy);
			var eB3:Explosion = new Explosion();
			explodeEmit.add(eB3);
		}
		explodeEmit.start(true, 1, 0, 3, 1);
		
		// player health control and what to do when the player dies
		playerShip.hp -= 1;
		if (playerShip.hp == 0) {
			playerShip.kill();
			
			for (i in 0...3) {
				explodeEmit.at(playerShip);
				var eB4:Explosion = new Explosion();
				explodeEmit.add(eB4);
			}
			explodeEmit.start(true, 1, 0, 3, 1);
			
			// text to pop up on the screen when player dies
			var deathText:FlxText = new FlxText(MenuState.STAGE_WIDTH / 2 - 32, MenuState.STAGE_HEIGHT / 2 - 32, "YOU DIED", 16);
			deathText.alignment = "center";
			add(deathText);
			
			// adding a restart button to the screen so that the player can continue playing
			var restartButton:FlxButton = new FlxButton(deathText.x + 8, deathText.y + 32, "RESTART?", onRestart);
			add(restartButton);
		}
	}
	
	// restarting this state (PlayState)
	private function onRestart():Void {
		FlxG.resetState();
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
		
		// collision handling
		FlxG.overlap(bulletsLayer, enemiesLayer, enemyBulletCollision);
		FlxG.overlap(playerShip, enemiesLayer, playerEnemyCollision);
		
		// screen boundaries for player ship
		if(playerShip.x < 0) {
			playerShip.x = 0;
		}
		if(playerShip.x > MenuState.STAGE_WIDTH - 32) {
			playerShip.x = MenuState.STAGE_WIDTH - 32;
		}
		if(playerShip.y < 8) {
			playerShip.y = 8;
		}
		if(playerShip.y > MenuState.STAGE_HEIGHT - 32) {
			playerShip.y = MenuState.STAGE_HEIGHT - 32;
		}
		
		// enemy spawn interval, which performs only if the playerShip is active on screen
		if (playerShip.exists) {
			if (spawnInterval == 0) {
			 	var enemyShip:Enemy = new Enemy();
				
				enemiesLayer.add(enemyShip);
				
				enemyShip.y = Math.round(Math.random() * (MenuState.STAGE_HEIGHT - 32));
				enemyShip.x = 680;
				
				spawnInterval = Math.round(Math.random() * 20) + 30;
			}
			if(spawnInterval > 0) {
				spawnInterval--;
			}
		}
		
		// firing bullets input
		if(FlxG.keys.pressed.SPACE) {
			if(currentDelay == 0) {
				currentDelay = bulletDelay;
				
				var b:Bullet = new Bullet();
				// var b2:Bullet = new Bullet();
				
				bulletsLayer.add(b);
				// bulletsLayer.add(b2);
				if (alternateCannon) {
					b.y = playerShip.y - 6;
				} else {
					b.y = playerShip.y + 18;
				}
				b.x = playerShip.x + 20;
			}
			alternateCannon = !alternateCannon;
			sfx_shoot.play();
		}
		if(currentDelay > 0) {
			currentDelay--;
		}
	}
}