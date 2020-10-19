package tanuki.geom;

class Ray {
	public var x:Float;
	public var y:Float;
	public var direction:Float;

	public function new(x:Float, y:Float, direction:Float){
		this.x = x;
		this.y = y;
		this.direction = direction;
	}
}