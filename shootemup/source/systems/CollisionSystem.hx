package systems;

import components.options.*;
import components.Components;
import nodes.*;
import visuals.*;

class CollisionSystem extends composure.traits.AbstractTrait
{
	@inject private var collide( default, set_collide ) : GraphicNode;
	@inject private var retrieve : Node;
	
	private function particleSub( graphic:Dynamic, particleEmitter:Dynamic, num:Dynamic ) : Void {
		for ( i in 0...num ) {
			particleEmitter.at( graphic );
			var particle : Particle = new Particle({
				w : 5,
				h : 5,
				clr : flixel.util.FlxColor.YELLOW
			});
			particleEmitter.add( particle );
		}
		particleEmitter.start( true, 1, 0, num, 1 );
	}
	
	private function collisionSub( a:Dynamic, b:Dynamic ) : Void {
		if ( a.exists && b.exists ) {
			a.health += retrieve.data.damage;
			if ( retrieve.data2 != null ) {
				b.health += retrieve.data2.damage;
				if ( b.health <= 0 ) {
					b.kill();
					Reg.score += retrieve.data2.scorePoints;
					particleSub( b, retrieve.data.emitter, retrieve.data2.particlesToEmit );
				}
			} else {
				b.kill();
				particleSub( b, retrieve.data.emitter, 1 );
			}
			
			if ( a.health <= 0 ) {
				a.kill();
				Reg.score += retrieve.data.scorePoints;
				particleSub( a, retrieve.data.emitter, retrieve.data.particlesToEmit );
			}
		}
	}
	
	private function set_collide( collide:GraphicNode ) : GraphicNode {
		this.collide = collide;
		
		flixel.FlxG.overlap( collide.graphic, retrieve.data.graphic, collisionSub );
		
		return collide;
	}
	
	public function new() {
		super();
	}
}