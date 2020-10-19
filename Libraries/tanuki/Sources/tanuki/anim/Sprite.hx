package tanuki.anim;

import kha.Canvas;
import kha.Color;
import kha.Image;

import tanuki.anim.Animation;
import tanuki.EntityRect;

class Sprite extends EntityRect {
	public var image:Image;
	var _animation:Animation;
	
	var _w:Float;
	var _h:Float;
	
	public function new(image:Image, x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0){
		super(x, y, width, height);
		this.image = image;
		_w = width;
		_h = height;
		if (this.width  == 0 && image != null) this.width  = image.width;
		if (this.height == 0 && image != null) this.height = image.height;
		_animation = Animation.create(0);
	}
	
	override public function update():Void {
		super.update();
		_animation.next();
	}
	
	override public function render(canvas:Canvas):Void {
		super.render(canvas);
		if (image != null && active){
			canvas.g2.color = Color.White;
			canvas.g2.drawScaledSubImage(image, Std.int(_animation.get() * _w) % image.width, Math.floor(_animation.get() * _w / image.width) * _h, _w, _h, Math.round(position.x), Math.round(position.y), width, height);
		}

		#if debug_collision
		canvas.g2.color = Color.Red;
		canvas.g2.drawRect(position.x, position.y, width, height);
		#end
	}

	public function set(animation:Animation):Void {
		this._animation.take(animation);
	}
	
	public function setImage(image:Image):Void {
		this.image = image;
	}

	function get_width():Float {
		return _w;
	}
	
	function set_width(value:Float):Float {
		return _w = value;
	}

		
	function get_height():Float {
		return _h;
	}
	
	function set_height(value:Float):Float {
		return _h = value;
	}
}