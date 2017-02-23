package ;


@:build(composure.macro.InjectorMacro.inject( ))
class CleanLeftovers
{
        @inject public var ent(default,set_ent) : Entity;
        @inject public var bnds                 : Bounds;
        
        private function set_ent(ent:Entity) : Entity {
                this.ent = ent;
                
                if(ent.sprite.x <= bnds.xl) ent.sprite.destroy();
                if(ent.sprite.x >= bnds.xr) ent.sprite.destroy();
                if(ent.sprite.y <= bnds.yt) ent.sprite.destroy();
                if(ent.sprite.y >= bnds.yb) ent.sprite.destroy();
                
                return ent;
        } //set_ent
        
        public function new() {
        } //new

} //CleanLeftovers