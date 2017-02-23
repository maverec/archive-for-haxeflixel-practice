package system;

import flixel.effects.particles.FlxParticle;
import flixel.FlxG;
import flixel.util.FlxColor;
import trait.Colliders;
import trait.Particles;
import trait.Emitter;
import trait.HpModifier;
import trait.ScoreModifier;

@:build(composure.macro.InjectorMacro.inject( ))
class Collisions
{
	@inject private var collider(default, set_collider)	: Colliders;
	@inject private var particles 				: Particles;
	@inject private var emitter 				: Emitter;
	@inject private var hp 					: HpModifier;
	@inject private var score 				: ScoreModifier;
	
	private function particleSubSystem(spawnpoint:Dynamic,particleContainer:Dynamic,num:Dynamic) : Void {
		for (i in 0...num) {
			particleContainer.x = spawnpoint.x;
			particleContainer.y = spawnpoint.y;
			var particle : FlxParticle = new FlxParticle();
			particle.makeGraphic(5,5,FlxColor.YELLOW);
			particleContainer.add(particle);
		}
		particleContainer.start(true,1,num);
	} //particleSubSystem
	
	private function collision(entity1:Dynamic,entity2:Dynamic) : Void {
		if(entity1.exists && entity2.exists) {
			entity1.health += hp.mod1;
			entity2.health += hp.mod2;
			
			if(entity1.health <= 0) {
				entity1.destroy();
				Reg.score += score.mod1;
				particleSubSystem(entity1, emitter.emitter, particles.numof1);
			}
			
			if(entity2.health <= 0) {
				entity2.destroy();
				Reg.score += score.mod2;
				particleSubSystem(entity2, emitter.emitter, particles.numof2);
			}
		}
	} //collision
	
	private function set_collider(colliders:Colliders) : Colliders {
		this.collider = colliders;
		
		FlxG.overlap(colliders.a, colliders.a, collision);

		return colliders;
	} //set_collider
	
	public function new() {
	} //new

} //Collisions