package char;

import tanuki.tween.Ease.Sine;
import tanuki.tween.Tween;
import tanuki.math.Vector2D;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import tanuki.EntityPolygon;
import tanuki.tool.Util;
import tanuki.tool.Pool;
import char.Triangle;

class TrianglePath extends EntityPolygon {
  public var triangle:Triangle;
  var tween:Tween;
  var random:Float;

  public function new(x:Float, y:Float, vertices:Array<Vector2D>){
    super(x, y, vertices);
    triangle = new Triangle(vertices[0].x, vertices[0].y, [new Vector2D(0, 64), new Vector2D(40, 0), new Vector2D(80, 64), new Vector2D(0, 64)]);

    random = Util.randomRangeFloat(2.6, 4.6);

    tweenLeft();
  }

  override public function update(){
    super.update();
    tween.update();
    triangle.update();
  }

  override public function render(canvas:Canvas){
    canvas.g2.color = Color.Black;
    triangle.render(canvas);
  }

  function tweenLeft(){
    tween = new Tween(vertices[1].x, vertices[0].x, random, Sine.easeInOut, function(yy, xx){
      triangle.position.x = position.x + xx;
      triangle.position.y = position.y;
    }).onComplete(tweenRight);  
  }

  function tweenRight(){
    tween = new Tween(vertices[0].x, vertices[1].x, random, Sine.easeInOut, function(yy, xx){
      triangle.position.x = position.x + xx;
      triangle.position.y = position.y;
    }).onComplete(tweenLeft);  
  }
}