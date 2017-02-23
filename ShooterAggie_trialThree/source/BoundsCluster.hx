package ;	// util

class BoundsCluster
{
	public function boundsUnit( vert:Bool, entity:Dynamic ) {
		if ( vert ) {
			if ( entity.y < 0 ) {
				entity.y = 0;
			}
			if ( entity.y > 448 ) {
				entity.y = 448;
			}
		} else {
			if ( entity.x < 0 ) {
				entity.x = 0;
			}
			if ( entity.x > 624 ) {
				entity.x = 624;
			}
		}
	}
	
	public function new() {}
}