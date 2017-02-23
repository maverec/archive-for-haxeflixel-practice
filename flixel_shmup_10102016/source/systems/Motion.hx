package systems;

import components.ObjectComponent;
import components.KeyComponent;
import components.SpeedComponent;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

// @:build( composure.macro.InjectorMacro.inject() )
class MotionSystem extends composure.traits.AbstractTrait
{
	@inject private var object( default, set_object ) : ObjectComponent;
	@inject private var keys : KeyComponent;
	@inject private var spd : SpeedComponent;
	
	private function set_object( moving:ObjectComponent ) : ObjectComponent {
		this.object = moving;
		
		if ( FlxG.keys.anyPressed( keys.goLeft ) ) {
			moving.obj.x -= spd.speedX;
		}
		if ( FlxG.keys.anyPressed( keys.goRight ) ) {
			moving.obj.x += spd.speedX;
		}
		if ( FlxG.keys.anyPressed( keys.goDown ) ) {
			moving.obj.y += spd.speedY;
		}
		if ( FlxG.keys.anyPressed( keys.goUp ) ) {
			moving.obj.y -= spd.speedY;
		}
		
		return moving;
	}
	
	public function new() {
		super();
	}
}