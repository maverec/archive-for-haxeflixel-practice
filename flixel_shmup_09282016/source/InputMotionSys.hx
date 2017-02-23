package ;

import flixel.FlxG;

@:build(composure.macro.InjectorMacro.inject( ))
class InputMotionSys
{
        @inject public var ent(default,set_ent) : Entity;
        @inject public var vel                  : Velocity;
        @inject public var keys                 : KeyInput;
        
        private function set_ent(ent:Entity) : Entity {
                this.ent = ent;
                
                if ( FlxG.keys.anyPressed( keys.left ) ) {
                        ent.sprite.x -= vel.vx;
                }
                if ( FlxG.keys.anyPressed( keys.right ) ) {
                        ent.sprite.x += vel.vx;
                }
                if ( FlxG.keys.anyPressed( keys.down ) ) {
                        ent.sprite.y += vel.vy;
                }
                if ( FlxG.keys.anyPressed( keys.up ) ) {
                        ent.sprite.y -= vel.vy;
                }
                
                return ent;
        } //set_ent
        
        public function new() {
        } //new

} //InputMotionSys