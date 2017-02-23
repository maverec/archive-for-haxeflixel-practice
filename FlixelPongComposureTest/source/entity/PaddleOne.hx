package entity;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import node.KeyboardNode;
import node.BoundaryNode;

class PaddleOne extends FlxSprite
{		
	private var entity : ComposeRoot = new ComposeRoot();
	private var render : ComposeGroup;
	
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 12, 50, FlxColor.WHITE );
		drag.y = 1800;		
	}
	
	public function inputActive( on:Bool ) : Void {
		if ( on ) {
			render.addTrait( new KeyboardNode( [ "DOWN", "S" ], [ "UP", "W" ], 5, this ) );
		}
	}
	
	override public function update() : Void {
		super.update();
		
		render = new ComposeGroup();
		render.addTrait( new BoundaryNode( this, 0, 430 ) );

		entity.addChild( render );
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}