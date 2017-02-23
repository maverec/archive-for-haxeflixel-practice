
package systems;

import components.GraphicComponent;
import components.CheckAgainstComponent;

class CollisionSystem extends composure.traits.AbstractTrait
{
	@inject
	private var ball( default, set_ball ) : GraphicComponent;
	@inject
	private var checker : CheckAgainstComponent;
	
	private function set_ball( ball:GraphicComponent ) : GraphicComponent {
		this.ball = ball;
		
		if ( ball.graphic.velocity.x < 0 && ball.graphic.x < 22 && ball.graphic.y >= checker.object1.y && ball.graphic.y <= checker.object1.y + 50 ) {
			ball.graphic.velocity.x *= -1;
			ball.graphic.x = 22;
		}
		
		if ( ball.graphic.velocity.x > 0 && ball.graphic.x > 594 && ball.graphic.y >= checker.object2.y && ball.graphic.y <= checker.object2.y + 50 ) {
			ball.graphic.velocity.x *= -1;
			ball.graphic.x = 594;
		}
		
		return ball;
	}
	
	public function new() {
		super();
	}
}