
import composure.core.ComposeGroup;
import visuals.*;
import systems.*;
import nodes.*;
import managers.*;
import components.options.*;
import components.Components;
import flixel.util.FlxColor;

class StupidShit
{
	public var blu : Dynamic;
	public var en : Dynamic;
	public var sT : Dynamic;
	
	public function MotherFucker() : Void {
		var enemy_entity : ComposeGroup = new ComposeGroup();
		if ( sT == 0 ) {
			sT = Math.round( Math.random() * 30 ) + 20;
			var e : Graphic = new Graphic({
				w : 16,
				h : 32,
				clr : FlxColor.RED,
				boundsLX : -16,
				hp : 3
			});
			enemy_entity.addTrait( new GraphicNode({
				graphic : e
			}) );
			enemy_entity.addTrait( new Node({
				graphic : blu,
				X : 650,
				Y : Math.round( Math.random() * 448 ),
				speedX : -Math.ceil( Math.random() * 250 ),
				manager : en
			}) );
		}
		if ( sT > 0 ) {
			sT--;
		}
		enemy_entity.addTrait( new SpawnSystem() );
	}
	
	public function new( blueShip:Dynamic, enemies:Dynamic, sTimer:Dynamic ) {
		this.blu = blueShip;
		this.en = enemies;
		this.sT = sTimer;
		// var enemy_entity : ComposeGroup = new ComposeGroup();
		// if ( sTimer == 0 ) {
		// 	sTimer = Math.round( Math.random() * 30 ) + 20;
		// 	var e : Graphic = new Graphic({
		// 		w : 16,
		// 		h : 32,
		// 		clr : FlxColor.RED,
		// 		boundsLX : -16,
		// 		hp : 3
		// 	});
		// 	enemy_entity.addTrait( new GraphicNode({
		// 		graphic : e
		// 	}) );
		// 	enemy_entity.addTrait( new Node({
		// 		graphic : blueShip,
		// 		X : 650,
		// 		Y : Math.round( Math.random() * 448 ),
		// 		speedX : -Math.ceil( Math.random() * 250 ),
		// 		manager : enemies
		// 	}) );
		// }
		// if ( sTimer > 0 ) {
		// 	sTimer--;
		// }
		// enemy_entity.addTrait( new SpawnSystem() );
	}
}