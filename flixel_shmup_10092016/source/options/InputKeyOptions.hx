package options;

import flixel.input.keyboard.FlxKey;

typedef InputKeyOptions = {
        @:optional var left     : Array<FlxKey>;
        @:optional var right    : Array<FlxKey>;
        @:optional var down     : Array<FlxKey>;
        @:optional var up       : Array<FlxKey>;
        @:optional var shoot    : Array<FlxKey>;
} //InputKeyOptions