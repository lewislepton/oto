package asset;

import kha.Shaders;
import tanuki.EntityRect;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Bounce extends EntityRect {
  public function new(x:Float, y:Float, width:Float, height:Float){
    super(x, y, width, height);
    lives = 2;
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
    canvas.g2.color = Color.Black;
    for (k in 0 ... Std.int(height / 2)){
      canvas.g2.drawLine(position.x, position.y + k * 2, position.x + width, position.y + k * 2, 1);
    }
  }
}