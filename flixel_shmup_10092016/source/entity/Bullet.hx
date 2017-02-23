package entity;

import flixel.FlxSprite;
import flixel.FlxG;
import composure.core.ComposeRoot;
import composure.core.ComposeGroup;
import trait.Visuals;
import trait.Speed;
import trait.Bounds;
import system.Motion;
import system.Leftovers;

class Bullet extends FlxSprite
{
        var bullet_entity : ComposeRoot = new ComposeRoot();
        
        public function new() {
                super();
        } //new

        override public function update(elapsed:Float) {
                super.update(elapsed);
                
                var _movement = new ComposeGroup();
                _movement.addTrait(new Visuals( this ));
                _movement.addTrait(new Speed( 0,-500 ));
                _movement.addTrait(new Motion( ));
                
                var _cleanup = new ComposeGroup();
                _cleanup.addTrait(new Visuals( this ));
                _cleanup.addTrait(new Bounds({
                        xl      : -50,
                        xr      : FlxG.width + 50,
                        yt      : -this.height,
                        yb      : FlxG.height + 50 
                }));
                _cleanup.addTrait(new Leftovers( ));
                
                bullet_entity.addChild(_movement);
                bullet_entity.addChild(_cleanup);
        } //update

        override public function destroy() {
                super.destroy();
        } //destroy

} //Bullet