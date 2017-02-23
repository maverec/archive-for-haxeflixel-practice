package trait;

import options.BoundOptions;

class Bounds
{
        public var xr   : Float;
        public var xl   : Float;
        public var yt   : Float;
        public var yb   : Float;
        
        public function new(ops:BoundOptions) {
                this.xr = ops.xr;
                this.xl = ops.xl;
                this.yt = ops.yt;
                this.yb = ops.yb;
        } //new

} //Bounds