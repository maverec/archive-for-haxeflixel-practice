package systems;

import components.ObjectComponent;
import components.BoundsComponent;

class Bind2Screen extends composure.traits.AbstractTrait
{
	@inject private var object( default, set_object ) : ObjectComponent;
	@inject private var bnds : BoundsComponent;
	
	private function set_object( bind:ObjectComponent ) : ObjectComponent {
		this.object = bind;
		
		if ( bind.obj.x < bnds.edge ) {
			bind.obj.x = bnds.edge;
		}
		if ( bind.obj.x > bnds.edgeRight - 16 ) {
			bind.obj.x = bnds.edgeRight - 16;
		}
		if ( bind.obj.y > bnds.edgeBottom - 32 ) {
			bind.obj.y = bnds.edgeBottom - 32;
		}
		if ( bind.obj.y < bnds.edge ) {
			bind.obj.y = bnds.edge;
		}
		
		return bind;
	}
	
	public function new() {
		super();
	}
}