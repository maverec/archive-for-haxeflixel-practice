package systems;

import components.CollidingComponent;
import components.ParticleComponent;
import components.EmitterComponent;
import components.HealthComponent;
import components.ScoreComponent;
import flixel.effects.particles.FlxParticle;

class CollisionSystem extends composure.traits.AbstractTrait
{
	@inject private var colliding( default, set_colliding ) : CollidingComponent;
	@inject private var particles : ParticleComponent;
	@inject private var emitter : EmitterComponent;
	@inject private var hp : HealthComponent;
	@inject private var score : ScoreComponent;
	
	private function particleSubSystem( origin:Dynamic, particleContainer:Dynamic, num:Dynamic ) : Void {
		for ( i in 0...num ) {
			particleContainer.at( origin );
			var particle : FlxParticle = new FlxParticle();
			particle.makeGraphic( 5, 5, flixel.util.FlxColor.YELLOW );
			particleContainer.add( particle );
		}
		particleContainer.start( true, 1, 0, num, 1 );
	}
	
	private function collision( objA:Dynamic, objB:Dynamic ) : Void {
		if ( objA.exists && objB.exists ) {
			objA.health += hp.minus;
			objB.health += hp.minus2;
			
			if ( objA.health <= 0 ) {
				objA.kill();
				Reg.score += score.addPts;
				particleSubSystem( objA, emitter.emitter, particles.num );
			}
			
			if ( objB.health <= 0 ) {
				objB.kill();
				Reg.score += score.addPts2;
				particleSubSystem( objB, emitter.emitter, particles.num2 );
			}
		}
	}
	
	private function set_colliding( colliders:CollidingComponent ) : CollidingComponent {
		this.colliding = colliders;
		
		flixel.FlxG.overlap( colliders.contactA, colliders.contactB, collision );

		return colliders;
	}
	
	public function new() {
		super();
	}
}