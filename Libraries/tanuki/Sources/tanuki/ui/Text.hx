package tanuki.ui;

import kha.Canvas;
import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Font;

import tanuki.EntityRect;

class Text extends EntityRect {
	public var font:Font;
	public var string:String;
	public var color:Color = Color.Black;
	public var fontname:String;

	public var size:Int;

	public function new(fontname:String, string:String, x:Float, y:Float, ?size:Int = 16){
		this.font = Reflect.field(Assets.fonts, fontname);
		this.string = string;
		this.size = size;

		super(x, y, font.width(size, string), font.height(size));
	}

	override public function update(){
		super.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		canvas.g2.color = color;
		canvas.g2.font = font;
		canvas.g2.fontSize = size;
		canvas.g2.drawString(string, position.x, position.y);
	}
}