package tanuki;

import kha.Canvas;

import tanuki.tool.Group;
import tanuki.math.Vector2D;
import tanuki.tool.Direction;

import tanuki.collide.Shape;

class Object {
	public var position(get, set):Vector2D;
	private var _position:Vector2D;

	public var velocity:Vector2D = new Vector2D();
	public var speed = 2.5;
	public var acceleration = 0.3;
	public var friction = 3.6;

	public var rotation:Float = 0;

	public var active(default, set):Bool = true;

	public var lives = 3;

	public var invincible = false;
	public var invincibleTimerMax = 3.0;
	public var invincibleTimer:Float;
	public var invincibleTimerSpeed = 0.05;

	public var bounce = false;

	public function new(?x:Float, ?y:Float){
		this.position = new Vector2D(x, y);
		
		invincibleTimer = invincibleTimerMax;

		revive();
	}

	public function update(){
		if (!active) return;

		position.x += velocity.x * speed;
		position.y += velocity.y * speed;
		velocity.x *= (1 - Math.min(1 / 60 * friction, 1));
		velocity.y *= (1 - Math.min(1 / 60 * friction, 1));

		if (invincible == true){
			invincibleTimer -= invincibleTimerSpeed;
		}
		if (invincibleTimer <= 0.0){
			invincible = false;
			invincibleTimer = invincibleTimerMax;
		}
	}

	public function render(canvas:Canvas) if (!active) return;

	// public function activate(?x:Float, ?y:Float){ active = true; }

	// public function deactivate(){
	// 	active = false;
	// }

	function set_active(value:Bool):Bool {
		return active = value;
	}

	function get_position():Vector2D {
		return _position;
	}

	function set_position(pos:Vector2D):Vector2D {
		return _position = pos;
	}

	public function revive(){
		active = true;
	}

	public function kill(){
		active = false;
	}
}