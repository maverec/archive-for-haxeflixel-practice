import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import composure.traits.AbstractTrait;

class CircleTrait extends AbstractTrait implements IUpdateOnFrameTrait
{
	@inject
	public var position:PositionTrait;

	private var circle:Shape;

	public function new(parent:MovieClip) 
	{
		super();
		
		circle = new Shape();
		circle.graphics.beginFill(0xff0000);
		circle.graphics.drawCircle(0, 0, 20);
		parent.addChild(circle);
	}
	
	public function update():Void {
		circle.x = position.x;
		circle.y = position.y;
	}
}
