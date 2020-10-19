package tanuki.collide.shape;

using tanuki.math.Vector2D;
import tanuki.collide.Shape;

class Polygon extends Object implements Shape {
	public var vertices:Array<Vector2D>;
	
	public function new(?vertices: Array<Vector2D>) {
		super();
		this.vertices = vertices;
	}

	public function support(direction: Vector2D): Vector2D {
		var furthestDistance: Float = Math.NEGATIVE_INFINITY;
		var furthestVertex: Vector2D = new Vector2D(0, 0);

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