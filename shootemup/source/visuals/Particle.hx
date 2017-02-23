package visuals;

import components.options.*;
import components.Components;

class Particle extends flixel.effects.particles.FlxParticle
{	
	public function new( options:Components ) {
		super();

		if ( options.texture != null ) {
			loadGraphic( options.texture, options.w, options.h );
		} else {
			makeGraphic( options.w, options.h, options.clr );
		}
	}
	
	override public function update() : Void {
		super.update();
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}