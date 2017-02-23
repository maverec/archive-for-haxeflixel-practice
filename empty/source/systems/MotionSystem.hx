
package systems;

import components.GraphicComponent;
import components.KeyComponent;
import components.SpeedComponent;

class MotionSystem extends composure.traits.AbstractTrait
{
	@inject
	private var graphicCall( default, set_graphicCall ) : GraphicComponent;
	@inject
	private var keys : KeyComponent;
	@inject
	private var spd : SpeedComponent;
	
	private function set_graphicCall( uGraphic:GraphicComponent ) : GraphicComponent {
		this.graphicCall = uGraphic;
		
		if ( flixel.FlxG.keys.anyPressed( keys.up ) ) {
			uGraphic.graphic.y -= spd.speed;
		}
		if ( flixel.FlxG.keys.anyPressed( keys.down ) ) {
			uGraphic.graphic.y += spd.speed;
		}
		
		return uGraphic;
	}
	
	public function new() {
		super();
	}
}