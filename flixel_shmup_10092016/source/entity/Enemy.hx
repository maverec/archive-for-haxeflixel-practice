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

class Enemy extends FlxSprite
{
        var enemy_entity : ComposeRoot = new ComposeRoot();
        
        public function new() {
                super();
        } //new

        override public function update(elapsed:Float) {
                super.update(elapsed);
                
                var _cleanup = new ComposeGroup();
                _cleanup.addTrait(new Visuals( this ));
                _cleanup.addTrait(new Bounds({
                        xl      : -50,
                        xr      : FlxG.width + 50,
                        yt      : -100,
                        yb      : FlxG.height + this.height 
                }));
                _cleanup.addTrait(new Leftovers( ));
                
                enemy_entity.addChild(_cleanup);
        } //update

        override public function destroy() {
                super.destroy();
        } //destroy

} //Bullet