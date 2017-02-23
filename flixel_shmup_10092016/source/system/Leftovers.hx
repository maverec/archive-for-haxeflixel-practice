package system;

import trait.Visuals;
import trait.Bounds;

@:build(composure.macro.InjectorMacro.inject( ))
class Leftovers
{
        @inject private var entity(default,set_entity)  : Visuals;
        @inject private var bnds                        : Bounds;
        
        private function set_entity(entity:Visuals) : Visuals {
                this.entity = entity;
                
                if(entity.visual.x < bnds.xl) entity.visual.destroy();
                if(entity.visual.x > bnds.xr) entity.visual.destroy();
                if(entity.visual.y < bnds.yt) entity.visual.destroy();
                if(entity.visual.y > bnds.yb) entity.visual.destroy();
                
                return entity;
        } //set_entity

        public function new() {
        } //new

} //Leftovers