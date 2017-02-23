package ;

import flixel.input.keyboard.FlxKey;

class KeyInput
{
        public var down         : Array<FlxKey>;
        public var up           : Array<FlxKey>;
        public var left         : Array<FlxKey>;
        public var right        : Array<FlxKey>;
        public var shoot        : Array<FlxKey>;
        
        public function new(_opt:KeyOp) {
                this.down       = _opt.down;
                this.up         = _opt.up;
                this.left       = _opt.left;
                this.right      = _opt.right;
                this.shoot      = _opt.shoot;
        } //new

} //KeyInput

typedef KeyOp = {
        @:optional var down     : Array<FlxKey>;
        @:optional var up       : Array<FlxKey>;
        @:optional var left     : Array<FlxKey>;
        @:optional var right    : Array<FlxKey>;
        @:optional var shoot    : Array<FlxKey>;
} //KeyOp