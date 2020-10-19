package char;

import tanuki.math.Vector2D;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import tanuki.EntityPolygon;

class Polygon extends EntityPolygon {
  public function new(x:Float, y:Float, vertices:Array<Vector2D>){
    super(x, y, vertices);
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    canvas.g2.color = Color.Black;
    canvas.g2.fillPolygon(position.x, position.y, vertices);
  }
}