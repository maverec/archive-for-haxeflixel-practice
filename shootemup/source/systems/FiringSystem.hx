package systems;

import components.options.*;
import components.Components;
import nodes.*;

class FiringSystem extends composure.traits.AbstractTrait
{
	@inject private var graphic( default, set_graphic ) : GraphicNode;
	@inject private var retrieve : Node;
	
	private function set_graphic( fire:GraphicNode ) : GraphicNode {
		this.graphic = fire;
		
		if ( retrieve.data.graphic.exists ) {
			if ( flixel.FlxG.keys.anyPressed( retrieve.data.keyShoot ) ) {
				fire.graphic.velocity.x = retrieve.data.speedX;
				if ( retrieve.data.alternatingPos ) {
					fire.graphic.x = retrieve.data.graphic.x + 20;
					fire.graphic.y = retrieve.data.graphic.y + 8;
				} else {
					fire.graphic.x = retrieve.data.graphic.x + 20;
					fire.graphic.y = retrieve.data.graphic.y + 30;
				}
				retrieve.data.manager.add( fire.graphic );
			}
		}
		
		return fire;
	}
	
	public function new() {
		super();
	}
}