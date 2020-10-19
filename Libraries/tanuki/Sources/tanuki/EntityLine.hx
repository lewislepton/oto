package tanuki;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import tanuki.collide.shape.Line;
import tanuki.math.Vector2D;

class EntityLine extends Line {
	public var fill:Bool = false;
	public var thick:Float = 1.0;

	public function new(x1:Float, y1:Float, x2:Float, y2:Float){
		super(new Vector2D(x1, y1), new Vector2D(x2, y2));
		position.x = x1;
		position.y = y1;
	}

	override public function update(){
		super.update();
	}
}