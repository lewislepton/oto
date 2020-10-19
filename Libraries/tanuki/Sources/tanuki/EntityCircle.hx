package tanuki;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import tanuki.collide.shape.Circle;

class EntityCircle extends Circle {
	public function new(x:Float, y:Float, radius:Float){
		super(radius);
		position.x = x;
		position.y = y;
	}

	override public function update(){
		super.update();
		// position.x += velocity.x * speed;
		// position.y += velocity.y * speed;
		// velocity.x *= (1 - Math.min(1 / 60 * friction, 1));
		// velocity.y *= (1 - Math.min(1 / 60 * friction, 1));
	}
}