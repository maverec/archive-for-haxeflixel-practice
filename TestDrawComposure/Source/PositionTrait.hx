import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import composure.traits.AbstractTrait;

class PositionTrait
{
	public var x:Float;
	public var y:Float;

	public function new(x:Float=0, y:Float=0) 
	{
		this.x = x;
		this.y = y;
	}
}
