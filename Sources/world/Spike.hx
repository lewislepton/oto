package world;

import tanuki.EntityPolygon;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import tanuki.math.Vector2D;

class Spike extends EntityPolygon {
  public function new(x:Float, y:Float, vertices:Array<Vector2D>){
    super(x, y, vertices);
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
    canvas.g2.color = Color.Black;
    canvas.g2.drawPolygon(position.x, position.y, vertices, 2);
  }
}