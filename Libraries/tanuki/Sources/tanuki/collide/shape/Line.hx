package tanuki.collide.shape;

using tanuki.math.Vector2D;
import tanuki.collide.Shape;

class Line extends Object implements Shape {
	public var start: Vector2D;
	public var end: Vector2D;

	public function new(start: Vector2D, end: Vector2D){
		super();
		this.start = start;
		this.end = end;
	}

	public function support(direction:Vector2D):Vector2D {
		if(Vector2D.dot(start, direction) > Vector2D.dot(end, direction)){
			return start;
		} else {
			return end;
		}
	}
}