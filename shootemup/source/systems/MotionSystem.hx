package systems;

import components.options.*;
import components.Components;
import nodes.*;
import flixel.FlxG;

class MotionSystem extends composure.traits.AbstractTrait
{
	@inject private var graphic( default, set_graphic ) : GraphicNode;
	@inject private var retrieve : Node;
	
	private function set_graphic( motion:GraphicNode ) : GraphicNode {
		this.graphic = motion;
		
		if ( FlxG.keys.anyPressed( retrieve.data.keyLeft ) ) {
			motion.graphic.x -= retrieve.data.speedX;
		}
		if ( FlxG.keys.anyPressed( retrieve.data.keyRight ) ) {
			motion.graphic.x += retrieve.data.speedX;
		}
		if ( FlxG.keys.anyPressed( retrieve.data.keyDown ) ) {
			motion.graphic.y += retrieve.data.speedY;
		}
		if ( FlxG.keys.anyPressed( retrieve.data.keyUp ) ) {
			motion.graphic.y -= retrieve.data.speedY;
		}
		
		return motion;
	}
	
	public function new() {
		super();
	}
}