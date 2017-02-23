package ;

import flixel.util.FlxColor;

class Spawner
{
        public function new() {
        } //new
        
        public var inactive : Bool = false;
        
        public function bulletBot(_ops:SpawnerOptions) {
                // this.inactive = _ops.inactive;
                
                // if(!inactive) {
                        if(_ops.cd <= 0) _ops.cd = 0;
                        if(_ops.cd > 0) _ops.cd--;
                        if(_ops.cd == 0) {
                                _ops.cd = _ops.maxcd;
                                
                                var _b = new Bullet();
                                _b.makeGraphic(3,7,FlxColor.YELLOW);
                                _b.y = _ops.posy;
                                
                                if(_ops.leftgun) { _b.x = _ops.posx + 16; }
                                else { _b.x = _ops.posx + 32; }
                                
                                _ops.manager.add(_b);
                        }
                        _ops.leftgun = !_ops.leftgun;                        
                // }
        } //bulletBot
        
        // public function enemyBot(_ops:SpawnerOptions) {
        //         if(_ops.cd <= 0) _ops.cd = 0;
        //         if(_ops.cd > 0) _ops.cd--;
        //         if(_ops.cd == 0) {
        //                 _ops.cd = _ops.maxcd;
        //                 
        //                 var _e = new Enemy();
        //                 _e.makeGraphic(3,7,FlxColor.YELLOW);
        //                 _e.y = _ops.posy;
        //                 _e.x = _ops.posx;
        //                 
        //                 _ops.manager.add(_e);
        //         }
        // } //enemyBot

} //Spawner


typedef SpawnerOptions = {
        @:optional var cd       : Float;
        @:optional var maxcd    : Float;
        @:optional var posy     : Float;
        @:optional var posx     : Float;
        @:optional var leftgun  : Bool;
        @:optional var manager  : Dynamic;
        @:optional var elapsed  : Float;
        @:optional var inactive : Bool;
} //SpawnerOptions