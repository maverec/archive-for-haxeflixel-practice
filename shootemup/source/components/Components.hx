package components;

import components.options.*;

typedef Components = {
	> KeyboardOptions,
	> VisualOptions,
	> AssetOptions,
	> EffectOptions,
	// ? @:optional var asset : Dynamic;
	@:optional var alternatingPos : Bool;
	@:optional var manager : Dynamic;
	@:optional var scorePoints : Int;
}