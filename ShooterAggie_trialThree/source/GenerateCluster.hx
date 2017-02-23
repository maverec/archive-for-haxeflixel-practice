package ;

import flixel.FlxSprite;
import flixel.FlxState;

class GenerateCluster
{
	public var entity : FlxSprite;
	
	public function drawUnit( X:Float, Y:Float, imageExists:Bool, ?stringPath:String, ?animBool:Bool, eWidth:Int, eHeight:Int, ?eColor:Int ) {
		entity = new FlxSprite( X, Y );
		if ( imageExists ) {
			entity.loadGraphic( stringPath, animBool, eWidth, eHeight );
		} else {
			entity.makeGraphic( eWidth, eHeight, eColor );
		}
	}
	
	public function addUnit( state:FlxState ) {
		state.add( entity );
	}
	
	public function new() { }
}