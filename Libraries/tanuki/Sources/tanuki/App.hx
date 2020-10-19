package tanuki;

import kha.Framebuffer;
import kha.Canvas;
import kha.graphics2.ImageScaleQuality;
import kha.Color;
import kha.Assets;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;
import kha.input.Gamepad;
import kha.input.Surface;
import kha.Image;
import kha.System;
import kha.Scaler;
import kha.ScreenCanvas;

import tanuki.State;

class App {
	public static var mouseX = 0;
	public static var mouseY = 0;

	var state:State;

	var imageQuality:ImageScaleQuality;

	public function new(){
		Tanuki.backbuffer = Image.createRenderTarget(Tanuki.BUFFERWIDTH, Tanuki.BUFFERHEIGHT);

		imageQuality = Tanuki.smooth ? ImageScaleQuality.High:ImageScaleQuality.Low;
		
		State.setup();

		Keyboard.get().notify(onKeyDown, onKeyUp);
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
		Gamepad.get().notify(onGamepadAxis, onGamepadButton);
		Surface.get().notify(onTouchDown, onTouchUp, onTouchMove);
	}

	public function update():Void {
		if (State.activeState != null){
			State.activeState.update();
		}	
	}

	public function render(framebuffer:Canvas):Void {
		Tanuki.backbuffer.g2.begin(true, Tanuki.color);
		framebuffer.g2.fillRect(0, 0, Tanuki.backbuffer.width, Tanuki.backbuffer.height);
		if (State.activeState != null){
			State.activeState.render(Tanuki.backbuffer);
		}
		Tanuki.backbuffer.g2.end();

		framebuffer.g2.begin();
    framebuffer.g2.imageScaleQuality = imageQuality;
		Scaler.scale(Tanuki.backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}

	public function onKeyDown(keyCode:KeyCode){
		if (State.activeState != null){
			State.activeState.onKeyDown(keyCode);
		}
	}

	public function onKeyUp(keyCode:KeyCode){
		if (State.activeState != null){
			State.activeState.onKeyUp(keyCode);
		}
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		mouseX = Scaler.transformX(x, y, Tanuki.backbuffer, ScreenCanvas.the, System.screenRotation);
		mouseY = Scaler.transformY(x, y, Tanuki.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseDown(button, mouseX, mouseY);
		}
	}

	public function onMouseUp(button:Int, x:Int, y:Int) {
		mouseX = Scaler.transformX(x, y, Tanuki.backbuffer, ScreenCanvas.the, System.screenRotation);
		mouseY = Scaler.transformY(x, y, Tanuki.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseUp(button, mouseX, mouseY);
		}
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int) {
		mouseX = Scaler.transformX(x, y, Tanuki.backbuffer, ScreenCanvas.the, System.screenRotation);
		mouseY = Scaler.transformY(x, y, Tanuki.backbuffer, ScreenCanvas.the, System.screenRotation);
		if (State.activeState != null){
			State.activeState.onMouseMove(mouseX, mouseY, cx, cy);
		}
	}

	public function onTouchDown(id:Int, x:Int, y:Int){
		if (State.activeState != null){
			State.activeState.onTouchDown(id, x, y);
		}
	}
	
	public function onTouchUp(id:Int, x:Int, y:Int){
		if (State.activeState != null){
			State.activeState.onTouchUp(id, x, y);
		}
	}

	public function onTouchMove(id:Int, x:Int, y:Int){
		if (State.activeState != null){
			State.activeState.onTouchMove(id, x, y);
		}
	}

	public function onGamepadAxis(axis:Int, value:Float){
		if (State.activeState != null){
			State.activeState.onGamepadAxis(axis, value);
		}
	}

	public function onGamepadButton(button:Int, value:Float){
		if (State.activeState != null){
			State.activeState.onGamepadButton(button, value);
		}
	}
}