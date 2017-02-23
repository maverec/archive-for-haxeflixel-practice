package systems;

import components.options.*;
import components.Components;
import nodes.*;

class BoundsSystem extends composure.traits.AbstractTrait
{
	@inject private var graphic( default, set_graphic ) : GraphicNode;
	@inject private var retrieve : Node;
	
	private function set_graphic( bind:GraphicNode ) : GraphicNode {
		this.graphic = bind;
		
		if ( bind.graphic.x < retrieve.data.boundsLX ) {
			bind.graphic.x = retrieve.data.boundsLX;
		}
		if ( bind.graphic.x > retrieve.data.boundsRX - bind.graphic.width ) {
			bind.graphic.x = retrieve.data.boundsRX - bind.graphic.width;
		}
		if ( bind.graphic.y > retrieve.data.boundsBY - bind.graphic.height ) {
			bind.graphic.y = retrieve.data.boundsBY - bind.graphic.height;
		}
		if ( bind.graphic.y < retrieve.data.boundsTY ) {
			bind.graphic.y = retrieve.data.boundsTY;
		}
		
		return bind;
	}
	
	public function new() {
		super();
	}
}