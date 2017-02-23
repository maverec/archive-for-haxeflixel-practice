package node;

class VelocityNode
{
	public function new( object:Dynamic ) {
		var randomAngle = Math.random( ) * 2 * Math.PI;
		
		object.velocity.x = Math.sin( randomAngle ) * 200;
		object.velocity.y = Math.cos( randomAngle ) * -200;
	}
}