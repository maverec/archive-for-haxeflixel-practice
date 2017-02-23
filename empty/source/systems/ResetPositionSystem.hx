
package systems;

import components.GraphicComponent;
import components.PositionComponent;
import components.BoundsComponent;

class ResetPositionSystem extends composure.traits.AbstractTrait
{
	@inject
	private var resetB( default, set_resetB ) : GraphicComponent;
	@inject
	private var pos : PositionComponent;
	@inject
	private var side : BoundsComponent;
	
	private function set_resetB( ball:GraphicComponent ) : GraphicComponent {
		this.resetB = ball;
		
		if ( ball.graphic.x <= side.top || ball.graphic.x >= side.bottom ) {
			ball.graphic.x = pos.x;
			ball.graphic.y = pos.y;
		}
		
		return ball;
	}
	
	public function new() {
		super();
	}
}