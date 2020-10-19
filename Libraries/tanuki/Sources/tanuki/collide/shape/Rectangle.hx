package tanuki.collide.shape;

using tanuki.math.Vector2D;
import tanuki.collide.Shape;

import tanuki.Object;

class Rectangle extends Object implements Shape {
	var vertices:Array<Vector2D>;

	public var width:Float;
	public var height:Float;

	public function new(width:Float, height:Float) {
		super();
		this.width = width;
		this.height = height;

		vertices = [new Vector2D(0, 0), new Vector2D(width, 0), new Vector2D(width, height), new Vector2D(0, height)];
	}

	public function support(direction: Vector2D): Vector2D {
		var furthestDistance: Float = Math.NEGATIVE_INFINITY;
		var furthestVertex: Vector2D = new Vector2D();

		var vo: Vector2D = new Vector2D();
		for(v in vertices) {
			vo = v.addVec(position, vo);
			var distance: Float = Vector2D.dot(vo, direction);
			if(distance > furthestDistance) {
				furthestDistance = distance;
				furthestVertex = vo.copy(furthestVertex);
			}
		}
		return furthestVertex;
	}
}