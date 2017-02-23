package system;

import trait.Visuals;
import trait.Speed;

@:build(composure.macro.InjectorMacro.inject( ))
class Motion
{
        @inject private var entity(default,set_entity)  : Visuals;
        @inject private var spd                         : Speed;
        
        private function set_entity(entity:Visuals) : Visuals {
                this.entity = entity;
                
                entity.visual.velocity.x = spd.x;
                entity.visual.velocity.y = spd.y;
                
                return entity;
        } //set_entity
        
        public function new() {
        } //new

} //Motion