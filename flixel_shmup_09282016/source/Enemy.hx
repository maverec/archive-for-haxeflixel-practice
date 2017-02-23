package ;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.FlxSprite;
import flixel.FlxG;

class Enemy extends FlxSprite
{
        var _root               : ComposeRoot = new ComposeRoot();
        
        public var velx         : Float = 0;
        public var vely         : Float = 0;
        
        public function new() {
                super();
        } //new
        
        override public function update(elapsed:Float) {
                super.update(elapsed);
                
                var _offlimits = new ComposeGroup();
                _offlimits.addTrait(new Entity( this ));
                _offlimits.addTrait(new Bounds({
                        top     : -100,
                        bottom  : FlxG.height -50,
                        left    : -10,
                        right   : FlxG.width + 50
                }));
                _offlimits.addTrait(new CleanLeftovers( ));
                
                var _motion = new ComposeGroup();
                _motion.addTrait(new Entity( this ));
                _motion.addTrait(new Velocity( velx,vely ));
                _motion.addTrait(new Motion( ));
                
                _root.addChild(_offlimits);
                _root.addChild(_motion);
        } //update

        override public function destroy() {
                super.destroy();
        } //destroy

} //Bullet