package ;

import flixel.group.FlxSpriteGroup;

class BulletGenerator extends FlxSpriteGroup
{
        public var cd           : Int;
        public var maxcd        : Int;
        public var leftgun      : Bool;
        public var tx           : Float = 0;
        public var ty           : Float = 0;
        public var trigger      : Bool = false;
        
        public function new() {
                super();
                
                cd = 0;
                maxcd = 10;
                leftgun = true;
        } //new
        
        public function position(_x,_y) {
                this.tx = _x;
                this.ty = _y;
        } //position
        
        override public function update(elapsed:Float) {
                super.update(elapsed);
                
                if(trigger) {
                        if(cd <= 0) cd = 0;
                        if(cd == 0) {
                                cd = maxcd;
                                var _b = new Bullet();
                                _b.makeGraphic(3,7,flixel.util.FlxColor.WHITE);
                                _b.y = this.ty;
                                
                                if(leftgun) _b.x = this.tx + 8;
                                else _b.x = this.tx + 40;
                                
                                add(_b);
                        }
                        if(cd > 0) cd--;                        
                }
        } //update

        override public function destroy() {
                super.destroy();
        } //destroy

} //BulletGenerator