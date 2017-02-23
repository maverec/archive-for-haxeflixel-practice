package ;


@:build(composure.macro.InjectorMacro.inject( ))
class BindToScreen
{
        @inject public var ent(default,set_ent) : Entity;
        @inject public var bnds                 : Bounds;
        
        private function set_ent(ent:Entity) : Entity {
                this.ent = ent;
                
                if(ent.sprite.x < bnds.xl) ent.sprite.x = bnds.xl;
                if(ent.sprite.x > bnds.xr) ent.sprite.x = bnds.xr;
                if(ent.sprite.y < bnds.yt) ent.sprite.y = bnds.yt;
                if(ent.sprite.y > bnds.yb) ent.sprite.y = bnds.yb;
                
                return ent;
        } //set_ent

        public function new() {
        } //new

} //BindToScreen