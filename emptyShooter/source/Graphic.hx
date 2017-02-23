
typedef GraphicOptions = {
	@:optional var x : Float;
	@:optional var y : Float;
	@:optional var w : Int;
	@:optional var h : Int;
	@:optional var clr : Int;
	@:optional var texture : String;
	@:optional var hp : Int;
	@:optional var boundsRX : Float;
	@:optional var boundsLX : Float;
}

class Graphic extends flixel.FlxSprite
{	
	private var boundsRX : Float;
	private var boundsLX : Float;
	
	public function new( options:GraphicOptions ) {
		super();
		
		this.x = options.x;
		this.y = options.y;
		this.boundsRX = options.boundsRX;
		this.boundsLX = options.boundsLX;
		
		if ( options.hp != null ) {
			this.health = options.hp;
		} else {
			this.health = 1;
		}

		if ( options.texture != null ) {
			loadGraphic( options.texture, options.w, options.h );
		} else {
			makeGraphic( options.w, options.h, options.clr );
		}
	}
	
	override public function update() : Void {
		super.update();
		
		if ( boundsRX != null ) {
			if ( this.x > boundsRX ) {
				this.kill();
			}
		}
		
		if ( boundsLX != null ) {
			if ( this.x < boundsLX ) {
				this.kill();
			}
		}
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}