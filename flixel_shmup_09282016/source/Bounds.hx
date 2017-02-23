package ;


class Bounds
{
        public var yt           : Float;
        public var yb           : Float;
        public var xl           : Float;
        public var xr           : Float;
        
        public function new(_opt:BoundOp) {
                this.yt = _opt.top;
                this.yb = _opt.bottom;
                this.xl = _opt.left;
                this.xr = _opt.right;
        } //new

} //Bounds


typedef BoundOp = {
        @:optional var top      : Float;
        @:optional var bottom   : Float;
        @:optional var left     : Float;
        @:optional var right    : Float;
} //BoundOp