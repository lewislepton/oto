package state;

import tanuki.ui.Text;
import kha.Image;
import tanuki.Tanuki;
import kha.Canvas;
import kha.Assets;
import kha.Color;

import tanuki.State;

import tanuki.ui.ButtonText;
import tanuki.ui.ToggleText;

class MenuState extends State {
	var btnPlay:ButtonText;
	var imgHeader:Image;

	var txtXbox:Text;
	var txtXboxButtons:Text;

	var txtKeyboard:Text;
	var txtKeyboardKeys:Text;

	var txtMaker:Text;

	public static var btnGamepad:ToggleText;

	public function new() {
		super();
		btnGamepad = new ToggleText('Abel', 'GAMEPAD', 32, 32, 32);
		btnGamepad.colorFrame = Color.Black;
		btnGamepad.colorOff = Color.White;
		btnGamepad.colorTextOff = Color.Black;
		btnGamepad.colorOn = Color.Black;
		btnGamepad.colorTextOn = Color.White;

		btnPlay = new ButtonText('Abel', 'PLAY', 0, 0, 64);
		btnPlay.position.x = Tanuki.BUFFERWIDTH / 2 - btnPlay.width / 2;
		btnPlay.position.y = Tanuki.BUFFERHEIGHT - 128;
		btnPlay.onClick = setLevelState;

		imgHeader = Assets.images.otoheader;

		txtKeyboard = new Text('Abel', 'Keyboard Controls:', 32, 92, 32);
		txtKeyboardKeys = new Text('Abel', 'Arrows [Move] / Space [Jump] / E [Enter Unlocked Door] / R [Reset Level]', txtKeyboard.position.x, txtKeyboard.position.y + 32, 32);

		txtXbox = new Text('Abel', 'Xbox One Controls:', 32, 92, 32);
		txtXboxButtons = new Text('Abel', 'Analog [Move] / A [Accept/Jump] / X [Enter Unlocked Door] / Y [Reset Level]', txtKeyboard.position.x, txtXbox.position.y + 32, 32);

		txtMaker = new Text('Abel', 'Lewis Lepton 2019 -/- lewislepton.com', 32, Tanuki.BUFFERHEIGHT - 64, 32);
	}

	override public function update() {
		
	}

	override public function render(canvas:Canvas) {
		canvas.g2.drawImage(imgHeader, Tanuki.BUFFERWIDTH / 2 - imgHeader.width / 2, Tanuki.BUFFERHEIGHT / 2 - imgHeader.height / 2);

		btnGamepad.render(canvas);

		txtMaker.render(canvas);

		if (btnGamepad.isOn){
			txtXbox.render(canvas);
			txtXboxButtons.render(canvas);
		} else {
			btnPlay.render(canvas);
			txtKeyboard.render(canvas);
			txtKeyboardKeys.render(canvas);
		}
	}

	override public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if (!btnGamepad.isOn){
			btnPlay.onButtonDown(x ,y);
		}
		btnGamepad.onButtonDown(x, y);
	}

	override public function onGamepadButton(button:Int, value:Float):Void {
		if (btnGamepad.isOn){
			if (button == 0){
				if (value >= 0.1){
					setLevelState();
				}
			}
		}
	}

	function setLevelState(){
		State.set('level0');
	}
}