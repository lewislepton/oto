package world;

import tanuki.glsl.Shader;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.Shaders;

import tanuki.EntityRect;

class Exit extends EntityRect {
  public var unlocked:Bool = false;
  var shader:Shader;
  public function new(x:Float, y:Float, width:Float, height:Float){
    super(x, y, width, height);
    shader = new Shader(Shaders.meta_frag, null, 0, width, height);
  }

  override public function update(){
    super.update();
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
    canvas.g2.color = Color.Black;
    if (unlocked){
      shader.begin(canvas);

      canvas.g2.color = Color.fromFloats(0.0, 0.6, 0.0);
      canvas.g2.fillRect(position.x, position.y, width, height);
      canvas.g2.drawRect(position.x, position.y, width, height, 2);
      shader.end(canvas);
      canvas.g2.drawRect(position.x, position.y, width, height, 2);
    } else {
      canvas.g2.fillRect(position.x, position.y, width, height);
      canvas.g2.color = Color.fromFloats(0.6, 0.0, 0.0);
      canvas.g2.drawRect(position.x, position.y, width, height, 2);
    }
  }
}