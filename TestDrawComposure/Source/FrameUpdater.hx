import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import composure.traits.AbstractTrait;

class FrameUpdater extends AbstractTrait
{
	private var timer:Timer;
	private var interval_ms:Int;
	private var updateTraits:Array<IUpdateOnFrameTrait>;

	public function new(interval_ms:Int) 
	{
		super();
		
		this.interval_ms = interval_ms;
		updateTraits = [];
		
		timer = new Timer(interval_ms);
		timer.addEventListener(TimerEvent.TIMER, update);
		timer.start();
	}
	
	@injectAdd({desc:true,sibl:false})
	public function addUpdateTrait(trait:IUpdateOnFrameTrait):Void{
		updateTraits.push(trait);
	}
	
	@injectRemove
	public function removeUpdateTrait(trait:IUpdateOnFrameTrait):Void{
		updateTraits.remove(trait);
	}
	
	private function update(e:TimerEvent):Void{
		for(trait in updateTraits){
			trait.update();
		}
	}
	
	public function getFPS():Int {
		return Std.int(1000/interval_ms);
	}
}
