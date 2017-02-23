
package systems;

import components.CheckAgainstComponent;
import components.SpeedComponent;

class AISystem extends composure.traits.AbstractTrait
{
	@inject
	private var testCall( default, set_testCall ) : CheckAgainstComponent;
	@inject
	private var spd : SpeedComponent;
	
	private function set_testCall( uTest:CheckAgainstComponent ) : CheckAgainstComponent {
		this.testCall = uTest;
		
		if ( uTest.object1.x > 500 && uTest.object2.y < uTest.object1.y - 27 ) {
			uTest.object2.velocity.y = spd.speed;
		}
		if ( uTest.object1.x > 500 && uTest.object2.y > uTest.object1.y - 7 ) {
			uTest.object2.velocity.y = -spd.speed;
		}
		
		return uTest;
	}
	
	public function new() {
		super();
	}
}