package tanuki;

import kha.Canvas;
import kha.graphics2.Graphics;
import kha.math.Vector2;
import kha.math.FastMatrix3;

class Camera {

	public var position : Vector2;
	public var matrix : FastMatrix3;

	public var angle : Float = 0;

	public var shaking = false;
	public var shakeTimerMax = 3.0;
	public var shakeTimer:Float;
	public var shakeTimerSpeed = 0.05;

	private var shakePeriod : Float;

	public function new() {
		this.position = new Vector2();
		this.matrix = FastMatrix3.identity();

		shakeTimer = shakeTimerMax;

		this.shakePeriod = Math.PI * 2;
	}

	public function begin(canvas:Canvas){
		canvas.g2.transformation = matrix;
		canvas.g2.pushRotation(angle, App.backbuffer.width / 2, App.backbuffer.height / 2);
	}

	public function end(canvas:Canvas){
		canvas.g2.popTransformation();
	}

	public function moveBy(x : Float, y : Float) {
		this.position.x += x;
		this.position.y += y;

		this.matrix = FastMatrix3.translation(this.position.x, this.position.y);
	}

	public function moveTo(x : Float, y : Float) {
		this.position.x = x;
		this.position.y = y;

		this.matrix = FastMatrix3.translation(this.position.x, this.position.y);
	}

	public function rotateBy(angle : Float) {
		this.angle += angle;
	}

	public function rotateTo(angle : Float) {
		this.angle = angle;
	}

	public function shake(amplitude:Float){
		// shakeTimer = shakeTimerMax;
		shakeTimer -= shakeTimerSpeed;
		if (shakeTimer >= 0){
			moveTo(amplitude * Math.sin(shakePeriod * Math.random()), amplitude * Math.sin(shakePeriod * Math.random()));
		}
		// if (shakeTimer <= 0){
		// 	shakeTimer = shakeTimerMax;
		// }
		// moveTo(amplitude * Math.sin(shakePeriod * Math.random()), amplitude * Math.sin(shakePeriod * Math.random()));
		// if (shakeTimer <= 0.0){
		// 	shaking = false;
		// 	shakeTimer = shakeTimerMax;
		// }
		// if (shaking){
		// 	moveTo(amplitude * Math.sin(shakePeriod * Math.random()), amplitude * Math.sin(shakePeriod * Math.random()));
		// } else {
			// shake(3.0);
		// }
		// shaking = true;
	}
}

// import kha.Canvas;
// import kha.graphics2.Graphics;
// import kha.math.FastMatrix3;

// import tanuki.geom.Rect;
// import tanuki.Entity;
// import tanuki.Object;

// class Camera extends Object {
// 	public var deadzone:Rect;
// 	public var viewport:Rect;
// 	public var transformation:FastMatrix3;
// 	public var target:Entity;
// 	public var followType:FollowType;

// 	var x : Float;
// 	var y : Float;
// 	public var halfWidth:Float;
// 	public var halfHeight:Float;

// 	public function new(x, y, width:Float, height:Float):Void {
// 		super(x, y, width, height);

// 		deadzone = new Rect(0, 0, 64, 120);
// 		viewport = new Rect(0, 0, Main.WIDTH, Main.HEIGHT);
// 		transformation = FastMatrix3.identity();
// 		target = null;
// 		followType = null;

// 		this.width = width;
// 		this.height = height;
// 		halfWidth = Std.int(width / 2);
// 		halfHeight = Std.int(height / 2);
// 	}

// 	override public function update():Void {
// 		super.update();

// 		follow();
// 	}

// 	override public function render(canvas:Canvas):Void {
// 		super.render(canvas);

// 		canvas.g2.transformation = transformation;
// 	}

// 	override public function destroy() : Void {
// 		super.destroy();

// 		viewport = null;
// 		transformation = null;
// 	}

// 	function follow():Void {
// 		if (target != null || followType != null){
// 			switch (followType) {
// 				case FollowType.Lock:
// 					transformation = FastMatrix3.translation(-target.position.x + viewport.width / 2, -target.position.y + viewport.height / 2);
// 				case FollowType.Trap:
// 					if (target.position.x + x > deadzone.width) {
// 						transformation = transformation.multmat(FastMatrix3.translation(-viewport.width / 2, 0));
// 						// x += -viewport.width;
// 					}

// 					if (target.position.x + x < deadzone.x) {
// 						transformation = transformation.multmat(FastMatrix3.translation(viewport.width / 2, 0));
// 						// x += viewport.width;
// 					}

// 					if (target.position.y + y > deadzone.height) {
// 						transformation = transformation.multmat(FastMatrix3.translation(0, -viewport.height / 2));
// 						// y += -viewport.height;
// 					}

// 					if (target.position.y + y < deadzone.y) {
// 						transformation = transformation.multmat(FastMatrix3.translation(0, viewport.height / 2));
// 						// y += viewport.height;
// 					}
// 					// if (target.position.x + x > viewport.width / 2){
// 					// 	transformation = FastMatrix3.translation(-target.position.x + viewport.width / 2, null);
// 					// }
// 				case FollowType.TrapX:
// 					if (target.position.x + x > viewport.width / 2){
// 						transformation = FastMatrix3.translation(-target.position.x + viewport.width / 2, null);
// 					}
// 				case FollowType.TrapY:
// 					if (target.position.y + y > viewport.height / 2){
// 						transformation = FastMatrix3.translation(null, -target.position.y + viewport.height / 2);
// 					}
// 				case FollowType.Screen:
// 					if (target.position.x + x > viewport.width) {
// 						transformation = transformation.multmat(FastMatrix3.translation(-viewport.width, 0));
// 						x += -viewport.width;
// 					}

// 					if (target.position.x + x < viewport.x) {
// 						transformation = transformation.multmat(FastMatrix3.translation(viewport.width, 0));
// 						x += viewport.width;
// 					}

// 					if (target.position.y + y > viewport.height) {
// 						transformation = transformation.multmat(FastMatrix3.translation(0, -viewport.height));
// 						y += -viewport.height;
// 					}

// 					if (target.position.y + y < viewport.y) {
// 						transformation = transformation.multmat(FastMatrix3.translation(0, viewport.height));
// 						y += viewport.height;
// 					}
// 				default: return;
// 			}
// 		}
// 	}
// }

// enum FollowType {
// 	Lock;
// 	Screen;
// 	Trap;
// 	TrapX;
// 	TrapY;
// }