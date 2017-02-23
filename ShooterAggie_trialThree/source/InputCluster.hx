package ;	// util

class InputCluster
{
	public function keyUnit( keyArray:Array<String>, vert:Bool, entity:Dynamic, pixels:Int ) {
		if ( flixel.FlxG.keys.anyPressed( keyArray ) ) {
			if ( vert ) {
				entity.y += pixels;
			} else {
				entity.x += pixels;
			}
		}
	}
	
	public function shootUnit( keyArray:Array<String> ) {
		if ( flixel.FlxG.keys.anyJustPressed( keyArray ) ) {
			var b : BulletOneUnit = new BulletOneUnit();
		}
	}
	
	public function new() {}
}