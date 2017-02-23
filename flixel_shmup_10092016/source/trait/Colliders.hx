package trait;

import options.ColliderOptions;

class Colliders
{
        public var a    : Dynamic;
        public var b    : Dynamic;
        
        public function new(hitbox1:Dynamic,hitbox2:Dynamic) {
                this.a = hitbox1;
                this.b = hitbox2;
        } //new

} //Colliders