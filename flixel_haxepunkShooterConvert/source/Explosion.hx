package ;

import flixel.FlxSprite;
import flixel.effects.particles.FlxParticle;

class Explosion extends FlxParticle
{	
	public function new() {
		super();
		
		loadGraphic("assets/images/explosion.png", false, 11, 11);
	}
}