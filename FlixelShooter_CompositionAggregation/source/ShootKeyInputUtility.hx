package ;	// TODO : will add this class to Utility later

import flixel.FlxG;

class ShootKeyInputUtility
{
	public function new( key:Array<String>, object:Dynamic ) {
		// TESTING :
		var b1 : Bullet = MenuState.bulletsLayer.recycle();
		var b2 : Bullet = MenuState.bulletsLayer.recycle();
		
		if ( FlxG.keys.anyJustPressed( key ) ) {
			b1.reset( object.x + 20, object.y - 1 );
			b2.reset( object.x + 20, object.y + 23 );
		}
	}
}