package system;

import flixel.FlxG;
import trait.Visuals;
import trait.InputKeys;
import trait.Speed;

@:build(composure.macro.InjectorMacro.inject( ))
class KeyMotion
{
        @inject private var entity(default,set_entity)  : Visuals;
        @inject private var keys                        : InputKeys;
        @inject private var spd                         : Speed;
        
        private function set_entity(entity:Visuals) : Visuals {
                this.entity = entity;
                
                if(FlxG.keys.anyPressed( keys.left )) entity.visual.x -= spd.x;
                if(FlxG.keys.anyPressed( keys.right )) entity.visual.x += spd.x;
                if(FlxG.keys.anyPressed( keys.down )) entity.visual.y += spd.y;
                if(FlxG.keys.anyPressed( keys.up )) entity.visual.y -= spd.y;
                
                return entity;
        } //set_entity

        public function new() {
        } //new

} //KeyMotion