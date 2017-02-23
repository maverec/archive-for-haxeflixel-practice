package ;	// TODO : will add this class to Utility later

class ScreenEdgeUtility
{
	public function new( vertical:Bool, object:Dynamic, num1:Float, num2:Float ) {
		if ( vertical ) {
			if ( object.y < num1 ) {
				object.y = num1;
			}
			if ( object.y > num2 ) {
				object.y = num2;
			}
		} else {
			if ( object.x < num1 ) {
				object.x = num1;
			}
			if ( object.x > num2 ) {
				object.x = num2;
			}
		}
	}
}