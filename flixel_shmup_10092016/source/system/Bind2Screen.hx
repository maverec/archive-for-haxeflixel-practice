package system;

import trait.Visuals;
import trait.Bounds;

@:build(composure.macro.InjectorMacro.inject( ))
class Bind2Screen
{
        @inject private var entity(default,set_entity)  : Visuals;
        @inject private var bnds                        : Bounds;
        
        private function set_entity(entity:Visuals) : Visuals {
                this.entity = entity;
                
                if(entity.visual.x < bnds.xl) entity.visual.x = bnds.xl;
                if(entity.visual.x > bnds.xr) entity.visual.x = bnds.xr;
                if(entity.visual.y < bnds.yt) entity.visual.y = bnds.yt;
                if(entity.visual.y > bnds.yb) entity.visual.y = bnds.yb;
                
                return entity;
        } //set_entity
        
        public function new() {
        } //new

} //Bind2Screen