package tanuki.particle;

import kha.Canvas;
import kha.Color;
import kha.graphics2.Graphics;

import tanuki.Object;
import tanuki.tool.Util;

class Emitter extends Object {
	public var arParticle:Array<Particle>;

	public var amount:Int = 6;
	public var color:Color = Color.White;

	public var lifeSpan = 1.0;
	public var power = 3.0;

	public function new(?amount:Int = 6, ?power:Float = 3.0){
		super();
		this.amount = amount;
		this.power = power;

		arParticle = new Array<Particle>();
	}

	override public function update(){
		super.update();
		var p = arParticle.length;
		while (p --> 0){
			lifeSpan = arParticle[p].lifespan;
			arParticle[p].update();
			if (arParticle[p].position.x <= 0 || arParticle[p].position.x >= Tanuki.backbuffer.width || arParticle[p].position.y <= 0 || arParticle[p].position.y >= Tanuki.backbuffer.height || lifeSpan <= 0){
				arParticle.splice(p, 1);
			}
		}
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		for (particle in arParticle){
			particle.color = color;
			particle.render(canvas);
		}
	}

	public function spawn(?x:Float = 0, ?y:Float = 0, ?amount:Int = 6, ?power:Float = 3, ?life:Bool = true, ?lifespan:Float = 1.0){
		for (i in 0 ... amount){
			var particle = new Particle(x, y, life, lifespan);
			particle.acceleration = -0.5;
			this.amount = amount;
			particle.velocity.x = Util.randomRangeFloat(-power, power);
			particle.velocity.y = Util.randomRangeFloat(-power, power);
			arParticle.push(particle);
		}
	}
}