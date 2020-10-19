package tanuki;

import kha.Canvas;
import haxe.ds.ArraySort;
import kha.Color;
import kha.graphics2.Graphics;
import kha.math.FastMatrix3;
import kha.math.Matrix3;
import kha.math.Vector2;

import tanuki.Object;

class Scene {
	private static var instance:Scene;
	var entities:Array<Object>;
	private var dirtySprites:Bool = false;

	public static var the(get, null):Scene;
	private static function get_the():Scene {
		if (instance == null) instance = new Scene();
		return instance;
	}

	public var countEntities(get, null):Int;

	public function get_countEntities(): Int {
		return entities.length;
	}

	function new(){
		entities = new Array<Object>();
	}

	public function update(): Void {
		clean();
		for (entity in entities) entity.update();
		clean();
	}

	public function render(canvas:Canvas){
		sort(entities);

		for (entity in entities) entity.render(canvas);
	}
	
	public function clear(){
		entities = new Array<Object>();
	}
	
	public function add(entity:Object){
		entity.active = true;
		entities.push(entity);
	}

	public function remove(entity:Object){
		entity.active = false;
		entities.remove(entity);
		entity = null;
	}
	
	function sort(entities : Array<Object>) {
		if (entities.length == 0) return;
		ArraySort.sort(entities, function(arg0: Object, arg1: Object) {
			if (arg0.position.x < arg1.position.x) return -1;
			else if (arg0.position.x == arg1.position.x) return 0;
			else return 1;
		});
	}
	
	private function clean(): Void {
		if (!dirtySprites) return;
		var found = true;
		while (found) {
			found = false;
			for (entity in entities) {
				if (!entity.active) {
					entities.remove(entity);
					found = true;
				}
			}
		}
	}
}