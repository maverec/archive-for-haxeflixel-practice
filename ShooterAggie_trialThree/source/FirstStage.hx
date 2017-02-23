package ;

import flixel.FlxState;

class FirstStage extends FlxState
{
	public static var bullets : FlxTypedGroup<BulletOneUnit>;
	private var player : ShipOneUnit;
	
	override public function create() : Void {
		super.create();
		
		var rngX : Float = Math.random() * 200;
		var rngY : Float = Math.random() * 400;
		
		player = new ShipOneUnit( rngX, rngY );
		add( player );
		
	}
	
	override public function update() : Void {
		super.update();
		
		
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}