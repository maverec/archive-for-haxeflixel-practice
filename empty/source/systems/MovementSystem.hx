
package systems;

import components.GraphicComponent;
import components.AngleComponent;
import components.SpeedComponent;

class MovementSystem extends composure.traits.AbstractTrait
{
	@inject
	private var graphicCall( default, set_graphicCall ) : GraphicComponent;
	@inject
	private var rnm : AngleComponent;
	@inject
	private var spd : SpeedComponent;
	
	private function set_graphicCall( uGraphic:GraphicComponent ) : GraphicComponent {
		this.graphicCall = uGraphic;
		
		uGraphic.graphic.velocity.x = Math.sin( rnm.angle ) * spd.speed;
		uGraphic.graphic.velocity.y = Math.cos( rnm.angle ) * -spd.speed;
		
		return uGraphic;
	}
	
	public function new() {
		super();
	}
}