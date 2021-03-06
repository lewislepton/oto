package tanuki;

import kha.Canvas;
import kha.input.KeyCode;

import tanuki.Scene;

class State extends Scene {
	public static var activeState:State;
	static var states:Map<String, State>;
	
	public function new(){
		super();
	}

	override public function update(){
		super.update();
		Scene.the.update();
	}

	override public function render(canvas:Canvas){
		super.render(canvas);
		Scene.the.render(canvas);
	}

	public function onKeyDown(keyCode:KeyCode){}

	public function onKeyUp(keyCode:KeyCode){}

	public function onMouseDown(button:Int, x:Int, y:Int){}

	public function onMouseUp(button:Int, x:Int, y:Int){}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int){}

	public function onTouchDown(id:Int, x:Int, y:Int){}
	
	public function onTouchUp(id:Int, x:Int, y:Int){}

	public function onTouchMove(id:Int, x:Int, y:Int){}

	public function onGamepadAxis(axis:Int, value:Float){}

	public function onGamepadButton(button:Int, value:Float){}

	public static function setup(){
		states = new Map<String, State>();
	}

	public static function addState(name:String, state:State):State {
		states.set(name, state);
		return state;
	}

	// override public function addEntity(object:Group){
	// 	super.addEntity(object);
	// }

	// override public function removeComponent(object:Group){
	// 	super.removeComponent(object);
	// }

	public static function removeState(name:String){
		states.remove(name);
	}

	public static function set(name:String){
		activeState = states.get(name);
	}
}