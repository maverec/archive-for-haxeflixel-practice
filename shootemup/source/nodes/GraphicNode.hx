package nodes;

import components.options.*;
import components.Components;

class GraphicNode
{
	public var graphic : Dynamic;
	
	public function new( options:Components ) {
		this.graphic = options.graphic;
	}
}