package entity;

import flixel.FlxSprite;
import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import trait.Visuals;
import trait.InputKeys;
import trait.Speed;
import trait.Bounds;
import system.KeyMotion;
import system.Bind2Screen;
import flixel.FlxG;

class Player extends FlxSprite
{
        var player_entity : ComposeRoot = new ComposeRoot();
        
        public function new(x:Float,y:Float) {
                super();
                
                this.x = x;
                this.y = y;
        } //new
        
        override public function update(elapsed:Float) {
                super.update(elapsed);
                
                var _movement = new ComposeGroup();
		_movement.addTrait(new Visuals( this ));
		_movement.addTrait(new InputKeys({
			left 	: [LEFT,A],
			right	: [RIGHT,D],
			down	: [DOWN,S],
			up	: [UP,W]
		}));
		_movement.addTrait(new Speed( 8,8 ));
		_movement.addTrait(new KeyMotion( ));
		_movement.addTrait(new Bounds({
			xl	: 0,
			xr	: FlxG.width - this.width,
			yt	: 0,
			yb	: FlxG.height - this.height
		}));
		_movement.addTrait(new Bind2Screen( ));
                
                player_entity.addChild(_movement);
        } //update

        override public function destroy() {
                super.destroy();
        } //destroy

} //Player