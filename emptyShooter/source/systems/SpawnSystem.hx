package systems;

import components.ObjectComponent;
import components.ManagerComponent;
import components.SpeedComponent;
import components.PositionComponent;

class SpawnSystem extends composure.traits.AbstractTrait
{
	@inject private var object( default, set_object ) : ObjectComponent;
	@inject private var mgr : ManagerComponent;
	@inject private var spd : SpeedComponent;
	@inject private var pos : PositionComponent;
	
	private function set_object( obj:ObjectComponent ) : ObjectComponent {
		this.object = obj;
		
		obj.obj.x = pos.x;
		obj.obj.y = pos.y;
		obj.obj.velocity.x = spd.speedX;
		obj.obj.velocity.y = spd.speedY;
		
		mgr.manager.add( obj.obj );
	
		return obj;
	}
	
	public function new() {
		super();
	}
}