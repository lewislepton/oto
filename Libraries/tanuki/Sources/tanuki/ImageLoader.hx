package tanuki;

import kha.Canvas;
import kha.graphics2.Graphics;
import kha.Color;
import kha.Image;
import kha.math.FastMatrix3;

import tanuki.Entity;
import tanuki.tool.Util;

class ImageLoader extends Entity {
	var image:Image;
	public var scaleWidth:Float = 0;
	public var scaleHeight:Float = 0;
	
	public function new(image:Image, x:Float, y:Float){
		this.image = image;
		super(x, y, image.width, image.height);
		scaleWidth = width;
		scaleHeight = height;
	}

	override public function update(){
		super.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		canvas.g2.drawScaledImage(image, position.x, position.y, scaleWidth, scaleHeight);

	}
}