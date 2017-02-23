package ;

@:build(composure.macro.InjectorMacro.inject( ))
class Motion
{
        @inject public var ent(default,set_ent) : Entity;
        @inject public var vel                  : Velocity;
        
        private function set_ent(ent:Entity) : Entity {
                this.ent = ent;
                
                ent.sprite.x += vel.vx;
                ent.sprite.y += vel.vy;
                
                return ent;
        } //set_ent
        
        public function new() {
        } //new

} //Motion