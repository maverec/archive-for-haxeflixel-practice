
package systems;

import components.GraphicComponent;
import components.BoundsComponent;
import components.DimensionComponent;

class BoundsSystem extends composure.traits.AbstractTrait
{
	@inject
	private var graphicCall( default, set_graphicCall ) : GraphicComponent;
	@inject
	private var bnds : BoundsComponent;
	@inject
	private var dim : DimensionComponent;
	
	private function set_graphicCall( uGraphic:GraphicComponent ) : GraphicComponent {
		this.graphicCall = uGraphic;
		
		if ( uGraphic.graphic.y < bnds.top ) {
			uGraphic.graphic.y = bnds.top;
		}
		if ( uGraphic.graphic.y > bnds.bottom - dim.h ) {
			uGraphic.graphic.y = bnds.bottom - dim.h;
		}
		
		return uGraphic;
	}
	
	public function new() {
		super();
	}
}