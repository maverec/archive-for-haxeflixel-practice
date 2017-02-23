package systems;

import components.options.*;
import components.Components;
import nodes.*;

class SpawnSystem extends composure.traits.AbstractTrait
{
	@inject private var graphic( default, set_graphic ) : GraphicNode;
	@inject private var retrieve : Node;
	
	private function set_graphic( spawn:GraphicNode ) : GraphicNode {
		this.graphic = spawn;
		
		if ( retrieve.data.graphic.exists ) {
			spawn.graphic.x = retrieve.data.X;
			spawn.graphic.y = retrieve.data.Y;
			spawn.graphic.velocity.x = retrieve.data.speedX;
			if ( retrieve.data.speedY != null ) {
				spawn.graphic.velocity.y = retrieve.data.speedY;
			}
			
			retrieve.data.manager.add( spawn.graphic );
		}
		
		return spawn;
	}
	
	public function new() {
		super();
	}
}