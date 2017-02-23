package ;	// TODO : will put this in Utility later

import flixel.FlxSprite;

class SpawnUtility
{	
	// TESTING
	public function spawnEnemy( layer:Dynamic ) : Void {
		// if ( spawnTimer == 0 ) {
			var e : Enemy = MenuState.enemyLayer.recycle();

			// spawnTimer = Math.round( Math.random() * 20 ) + 30;
		// }
	}
	
	public function new() { }
}