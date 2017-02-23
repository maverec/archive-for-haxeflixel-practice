package nodes;

import components.options.*;
import components.Components;

class Node
{
	public var data : Components;
	public var data2 : Components;
	
	public function new( data:Components, ?data2:Components ) {
		this.data = data;
		if ( data2 != null ) {
			this.data2 = data2;
		}
	}
}