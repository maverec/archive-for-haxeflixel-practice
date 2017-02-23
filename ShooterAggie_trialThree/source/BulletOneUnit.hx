package ;

import flixel.FlxSprite;

class BulletOneUnit extends FlxSprite
{
	public function new( ) {
		super();
		
		makeGraphic( 7, 12, flixel.util.FlxColor.GOLDEN );
	}
	
	override public function update() : Void {
		super.update();
		
		if ( this.x > 650 ) {
			this.kill();
		}
		
		this.x += 10;
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}