package entity;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;

import node.VelocityNode;
import node.BounceNode;

class BallOne extends FlxSprite
{
	private var entity : ComposeRoot = new ComposeRoot();
	private var paddleAny : PaddleOne;
	
	public function new( X:Float, Y:Float ) {
		super( X, Y );
		
		makeGraphic( 12, 12, FlxColor.TRANSPARENT );
		FlxSpriteUtil.drawCircle( this, 6, 6, 6, FlxColor.WHITE );
		setSize( 12, 12 );
		
		var draw = new ComposeGroup();
		draw.addTrait( new VelocityNode( this ) );
		
		entity.addChild( draw );
	}
	
	override public function update() : Void {
		super.update();
		
		var render = new ComposeGroup();
		render.addTrait( new BounceNode( this, 0, 468 ) );
		
		entity.addChild( render );
	}
	
	override public function destroy() : Void {
		super.destroy();
	}
}