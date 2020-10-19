package char;

import tanuki.Tanuki;
import kha.Canvas;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;

import tanuki.EntityCircle;
import tanuki.EntityLine;

class Player extends EntityCircle {
  public var left:Bool;
  public var right:Bool;
  public var open:Bool;
  public var jump:Bool;
  public var jumpValue = -7.8;

  public var reset:Bool;

  public var onGround = false;
  public var ground:EntityLine;
  public var stomp:EntityCircle;

  public function new(x:Float, y:Float, radius:Float){
    super(x, y, radius);

    speed = 3.6;
    acceleration = 0.38;

    ground = new EntityLine(x - radius / 2, y + radius / 2, 0, 0);
    ground.end.x = ground.start.x;
    ground.end.y = ground.start.y + 2;

    stomp = new EntityCircle(x, y + radius + 6, 12);
  }

  override public function update(){
    super.update();

    if (position.x + radius <= 0){
			position.x = Tanuki.BUFFERWIDTH;
		} else if (position.x >= Tanuki.BUFFERWIDTH){
			position.x = 0 - radius;
		}

		if (position.y + radius <= 0){
			position.y = Tanuki.BUFFERHEIGHT;
		} else if (position.y >= Tanuki.BUFFERHEIGHT){
			position.y = 0 - radius;
		}

    ground.start.x = position.x - radius / 2;
    ground.start.y = position.y + radius / 2;
    ground.end.x = ground.start.x + radius - 4;
    ground.end.y = position.y + radius;

    stomp.position.x = position.x;
    stomp.position.y = position.y + radius + 6;

    if (left){
      position.x -= Math.round(speed);
    } else if (right){
      position.x += Math.round(speed);
    }
    velocity.y += acceleration;
  }

  override public function render(canvas:Canvas){
    super.render(canvas);
    canvas.g2.color = Color.Black;
    canvas.g2.fillCircle(position.x, position.y, radius);

    #if debug_collision
    canvas.g2.drawLine(ground.start.x, ground.start.y, ground.end.x, ground.end.y);
    canvas.g2.fillCircle(stomp.position.x, stomp.position.y, stomp.radius);
    #end
  }

  public function onKeyDown(keyCode:KeyCode):Void {
    switch (keyCode){
      case Left: left = true;
      case Right: right = true;
      case E: open = true;
      case R: reset = true;
      case Space: jump = true;
    default: return;
    }
  }

  public function onKeyUp(keyCode:KeyCode):Void {
    switch (keyCode){
      case Left: left = false;
      case Right: right = false;
      case E: open = false;
      case R: reset = false;
      case Space: jump = false;
    default: return;
    }
  }

  public function onGamepadAxis(axis:Int, value:Float){
		if (axis == 0){
			if (value <= -0.5){
				left = true;
			} else if (value >= 0.5){
				right = true;
			} else {
				left = false;
				right = false;
			}
		}
	}

  public function onGamepadButton(button:Int, value:Float):Void {
    if (button == 0){ /*A*/
      if (value >= 0.1){
        jump = true;
      } else {
        jump = false;
      }
    } else if (button == 2){ /*X*/
      if (value >= 0.1){
        open = true;
      } else {
        open = false;
      }
    }
    if (button == 3){ /*A*/
      if (value >= 0.1){
        reset = true;
      } else {
        reset = false;
      }
    }
  }
}