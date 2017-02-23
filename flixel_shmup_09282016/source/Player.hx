package ;

import composure.core.ComposeGroup;
import composure.core.ComposeRoot;
import flixel.input.keyboard.FlxKey;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.FlxG;

class Player extends FlxSprite
{
        var _root : ComposeRoot = new ComposeRoot();
        
        public function new() {
                super();
        } //new
        
        override public function update(elapsed:Float) {
                super.update(elapsed);
                
                var _keymotion = new ComposeGroup();
                _keymotion.addTrait(new Entity( this ));
                _keymotion.addTrait(new KeyInput({
                        up      : [UP,W],
                        down    : [DOWN,S],
                        left    : [LEFT,A],
                        right   : [RIGHT,D],
                        shoot   : [SPACE]
                }));
                _keymotion.addTrait(new Velocity( 6,6 ));
                _keymotion.addTrait(new InputMotionSys( ));
                
                var _bindings = new ComposeGroup();
                _bindings.addTrait(new Entity( this ));
                _bindings.addTrait(new Bounds({
                        top     : 0,
                        bottom  : FlxG.height - this.height,
                        left    : 0,
                        right   : FlxG.width - this.width
                }));
                _bindings.addTrait(new BindToScreen( ));
                
                _root.addChild(_keymotion);
                _root.addChild(_bindings);                
        } //update

        override public function destroy() {
                super.destroy();
        } //destroy

} //Player