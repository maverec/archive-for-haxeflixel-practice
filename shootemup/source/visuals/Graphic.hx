package visuals;

import components.options.*;
import components.Components;

class Graphic extends flixel.FlxSprite
{	
	private var boundsRX : Float;
	private var boundsLX : Float;
	
	public function new( options:Components ) {
		super();
		
		this.x = options.X;
		this.y = options.Y;
		this.boundsRX = options.boundsRX;
		this.boundsLX = options.boundsLX;
		
		if ( options.hp != null ) {
			this.health = options.hp;
		} else {
			this.health = 1;
		}

		if ( options.texture != null ) {
			loadGraphic( options.texture, options.w, options.h );
		} else {
			makeGraphic( options.w, options.h, options.clr );
		}
	}
	
	override public function update() : Void {
		super.update();
		
		if ( boundsRX != null ) {
			if ( this.x > boundsRX ) {
				this.kill();
			}
		}
		
		if ( boundsLX != null ) {
			if ( this.x < boundsLX ) {
				this.kill();
			}
		}
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}