package char;

import tanuki.EntityRect;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

class Square extends EntityRect {
  public function new(x:Float, y:Float, width:Float, height:Float){
    super(x, y, width, height);
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
    canvas.g2.color = Color.Black;
    canvas.g2.fillRect(position.x, position.y, width, height);
  }
}