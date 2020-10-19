package tanuki.tool;

import tanuki.Object;

class AI extends Object {
	public var range = 200.00;
	var rate = 1.0;
	var x:Float = 0;
	var y:Float = 0;

	var ease = 0.01;

	public function new(){
		super();
	}

	public function follow(entity01:Entity, entity02:Entity){
		var dx:Float = entity01.position.x - entity02.position.x;
		var dy:Float = entity01.position.y - entity02.position.y;
		var distance = Math.sqrt(dx * dx + dy * dy);

		// var xDistance = entity01.position.x - entity02.position.x;
		// var yDistance = entity01.position.y - entity02.position.y;
		// var distance = Math.sqrt(xDistance * xDistance + yDistance * yDistance);
		if (distance <= range) {
			entity02.position.x += dx * ease;
			entity02.position.y += dy * ease;
		}
		// var distanceX:Float = entity01.position.x - entity02.position.x;
		// var distanceY:Float = entity01.position.y - entity02.position.y;
		// var total = Math.sqrt(distanceX * distanceX + distanceY * distanceY);

		// if (total <= range){
		// 	distanceX = rate * distanceX / total;
		// 	distanceY = rate * distanceY / total;

		// 	x += distanceX;
		// 	y += distanceY;

		// 	var totalDistance = Math.sqrt(x * x + y * y);
		// 	x = speed * x / totalDistance;
		// 	y = speed * y / totalDistance;

		// 	entity02.position.x += x;
		// 	entity02.position.y += y;
		// }
	}

	public function runner(entity01:Entity, entity02:Entity){
		var dx:Float = entity01.position.x - entity02.position.x;
		var dy:Float = entity01.position.y - entity02.position.y;
		var distance = Math.sqrt(dx * dx + dy * dy);

		// var xDistance = entity01.position.x - entity02.position.x;
		// var yDistance = entity01.position.y - entity02.position.y;
		// var distance = Math.sqrt(xDistance * xDistance + yDistance * yDistance);
		if (distance <= range) {
			entity02.position.x -= dx * ease;
			entity02.position.y -= dy * ease;
		}
		// var distanceX:Float = entity01.position.x - entity02.position.x;
		// var distanceY:Float = entity01.position.y - entity02.position.y;
		// var total = Math.sqrt(distanceX * distanceX + distanceY * distanceY);

		// if (total <= range){
		// 	distanceX = rate * distanceX / total;
		// 	distanceY = rate * distanceY / total;

		// 	x -= distanceX;
		// 	y -= distanceY;

		// 	var totalDistance = Math.sqrt(x * x + y * y);
		// 	x = speed * x / totalDistance;
		// 	y = speed * y / totalDistance;

		// 	entity02.position.x += x;
		// 	entity02.position.y += y;
		// }
	}
}