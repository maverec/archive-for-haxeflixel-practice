package systems;

import components.BulletComponent;
import components.ObjectComponent;
import components.FireKeyComponent;
import components.SpeedComponent;
import components.PositionComponent;
import components.ManagerComponent;

class FiringSystem extends composure.traits.AbstractTrait
{
	@inject private var bullet( default, set_bullet ) : BulletComponent;
	@inject private var barrel : ObjectComponent;
	@inject private var key : FireKeyComponent;
	@inject private var spd : SpeedComponent;
	@inject private var pos : PositionComponent;
	@inject private var mgr : ManagerComponent;
	
	private function set_bullet( isFired:BulletComponent ) : BulletComponent {
		this.bullet = isFired;
		
		if ( barrel.obj.exists ) {
			if ( flixel.FlxG.keys.anyPressed( key.fire ) ) {
				isFired.ammo.x = pos.x;
				isFired.ammo.y = pos.y;
				isFired.ammo.velocity.x = spd.speedX;
				
				mgr.manager.add( isFired.ammo );
			}
			
		}
		
		return isFired;
	}
	
	public function new() {
		super();
	}
}