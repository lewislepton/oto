package tanuki;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import tanuki.collide.shape.Polygon;
import tanuki.math.Vector2D;

class EntityPolygon extends Polygon {
	public var fill:Bool = false;
	public var thick:Float = 1.0;

	public function new(x:Float, y:Float, ?vertices:Array<Vector2D>){
		super(vertices);
		position.x = x;
		position.y = y;
	}

	override public function update(){
		super.update();
	}
}