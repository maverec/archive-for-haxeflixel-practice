
package systems;

import components.GraphicComponent;
import components.BoundsComponent;
import components.SpeedComponent;
import components.DimensionComponent;

class BounceSystem extends composure.traits.AbstractTrait
{
	@inject
	private var graphicCall( default, set_graphicCall ) : GraphicComponent;
	@inject
	private var bnds : BoundsComponent;
	@inject
	private var spd : SpeedComponent;
	@inject
	private var dim : DimensionComponent;
	
	private function set_graphicCall( uGraphic:GraphicComponent ) : GraphicComponent {
		this.graphicCall = uGraphic;
		
		if ( uGraphic.graphic.y < bnds.top || uGraphic.graphic.y + dim.h > bnds.bottom ) {
			uGraphic.graphic.velocity.y *= spd.speed;
		}
		
		return uGraphic;
	}
	
	public function new() {
		super();
	}
}