package ;

import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.utils.Timer;
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import composure.traits.AbstractTrait;


class DependencyInjectionMetadata extends Sprite
{

    static function main() {
        var root:ComposeRoot = new ComposeRoot();
	
        var stage:ComposeGroup = new ComposeGroup();
        stage.addTrait(new FrameUpdater(200)); // 5fps
        root.addChild(stage);
	
        var circle:ComposeGroup = new ComposeGroup();
        circle.addTrait(new CircleTrait(flash.Lib.current));
        circle.addTrait(new PositionTrait(100,100));
        stage.addChild(circle);
	
        var fpsDisplay:ComposeGroup = new ComposeGroup();
        fpsDisplay.addTrait(new FPSTrait(flash.Lib.current));
        stage.addChild(fpsDisplay);
    }
	
}
