package tanuki.particle;

import kha.Canvas;
import kha.Color;

import tanuki.Object;

class Particle extends Object {
	public var life:Bool;
	public var lifespan:Float = 1.0;
	public var color:Color;

	public var width:Float;
	public var height:Float;

	public function new(?x:Float, ?y:Float, ?width:Float = 1, ?height:Float = 1, ?life:Bool = false, ?lifespan:Float = 1.0){
		super(x, y);
		this.width = width;
		this.height = height;
		this.life = life;
		this.lifespan = lifespan;
	}

	override public function update(){
		super.update();
		lifespan -= 0.01;
		velocity.y -= acceleration;
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		canvas.g2.color = color;
		canvas.g2.drawRect(position.x, position.y, width, height);
	}
}