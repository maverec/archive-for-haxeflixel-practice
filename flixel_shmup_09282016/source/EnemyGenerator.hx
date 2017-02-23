package ;

import flixel.group.FlxSpriteGroup;

class EnemyGenerator extends FlxSpriteGroup
{
        public var cd           : Int;
        public var maxcd        : Int;
        public var tx           : Float = 0;
        public var ty           : Float = 0;
        public var velx         : Float;
        public var vely         : Float;
        
        public function new() {
                super();
                
                cd = 0;
                maxcd = 12;
        } //new
        
        public function position(_x,_y) {
                this.tx = _x;
                this.ty = _y;
        } //position
        
        override public function update(elapsed:Float) {
                super.update(elapsed);
                
                if(cd <= 0) cd = 0;
                if(cd == 0) {
                        cd = maxcd;
                        var _e = new Enemy();
                        _e.makeGraphic(48,24,flixel.util.FlxColor.RED);
                        _e.y = this.ty;
                        _e.x = this.tx;
                        _e.velx = this.velx;
                        _e.vely = this.vely;                   
                        
                        add(_e);
                }
                if(cd > 0) cd--;
        } //update

        override public function destroy() {
                super.destroy();
        } //destroy
}