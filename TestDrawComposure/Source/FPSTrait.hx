import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import composure.traits.AbstractTrait;

class FPSTrait extends AbstractTrait implements IUpdateOnFrameTrait
{
	@inject({sibl:false,asc:true})
	private var frameUpdater:FrameUpdater;
	private var textDisplay:TextField;

	public function new(parent:MovieClip) 
	{
		super();

		textDisplay = new TextField();
		parent.addChild(textDisplay);
	}
	
	public function update():Void{
		textDisplay.text = "FPS: "+frameUpdater.getFPS();
	}
}
