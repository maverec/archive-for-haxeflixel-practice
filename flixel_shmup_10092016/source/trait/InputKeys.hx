package trait;

import flixel.input.keyboard.FlxKey;
import options.InputKeyOptions;

class InputKeys
{
        public var left         : Array<FlxKey>;
        public var right        : Array<FlxKey>;
        public var down         : Array<FlxKey>;
        public var up           : Array<FlxKey>;
        public var shoot        : Array<FlxKey>;
        
        public function new(ops:InputKeyOptions) {
                this.left       = ops.left;
                this.right      = ops.right;
                this.down       = ops.down;
                this.up         = ops.up;
                this.shoot      = ops.shoot;
        } //new

} //InputKeys