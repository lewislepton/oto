package tanuki.collide.shape;

using tanuki.math.Vector2D;
import tanuki.collide.Shape;
import tanuki.Object;

class Circle extends Object implements Shape {
	public var radius: Float;
	
	public function new(radius: Float){
		super();
		this.radius = radius;
	}

	public function support(direction: Vector2D): Vector2D {
		var c: Vector2D = position.copy(new Vector2D());
		var d: Vector2D = direction.normalize(new Vector2D());
		d.multiplyScalar(radius, d);
		c.addVec(d, c);
		return c;
	}
}