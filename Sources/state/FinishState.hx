package state;

import kha.System;
import tanuki.Tanuki;
import tanuki.ui.ButtonText;
import kha.Canvas;
import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.Assets;

import tanuki.State;
import tanuki.ui.Text;

class FinishState extends State {
	var txtThankYou:Text;
	var txtInfo:Text;
	var txtTheme:Text;
	var txtTech:Text;
	var txtExtra:Text;

	var txtLewisLepton:Text;

	var btnWebsite:ButtonText;
	var btnPatreon:ButtonText;
	var btnYoutube:ButtonText;
	var btnTwitter:ButtonText;
	var btnKha:ButtonText;
	var btnHaxe:ButtonText;

	var btnMenu:ButtonText;

	public function new() {
		super();
		txtThankYou = new Text('Abel', 'Thank you for playing OTO', 0, 128, 92);
		txtThankYou.position.x = Tanuki.BUFFERWIDTH / 2 - txtThankYou.width / 2;
		txtInfo = new Text('Abel', 'OTO was made during the notGDC jam 2019', 0, txtThankYou.position.y + 128, 92);
		txtInfo.position.x = Tanuki.BUFFERWIDTH / 2 - txtInfo.width / 2;
		txtTheme = new Text('Abel', 'The theme was minimalism', 0, txtInfo.position.y + 128, 92);
		txtTheme.position.x = Tanuki.BUFFERWIDTH / 2 - txtTheme.width / 2;
		txtTech = new Text('Abel', 'Built using a bespoke framework made from Kha & Haxe', 0, txtTheme.position.y + 128, 92);
		txtTech.position.x = Tanuki.BUFFERWIDTH / 2 - txtTech.width / 2;
		txtExtra = new Text('Abel', 'All code, sound, music were created by myself', 0, txtTech.position.y + 128, 92);
		txtExtra.position.x = Tanuki.BUFFERWIDTH / 2 - txtExtra.width / 2;

		txtLewisLepton = new Text('Abel', 'Lewis Lepton 2019', 32, Tanuki.BUFFERHEIGHT - 64, 32);

		btnWebsite = new ButtonText('Abel', 'WEBSITE', 256, 850, 64);
		btnWebsite.onClick = goToWebsite;
		btnPatreon = new ButtonText('Abel', 'PATREON', btnWebsite.position.x + 256, 850, 64);
		btnPatreon.onClick = goToPatreon;
		btnYoutube = new ButtonText('Abel', 'YOUTUBE', btnPatreon.position.x + 256, 850, 64);
		btnYoutube.onClick = goToYoutube;
		btnTwitter = new ButtonText('Abel', 'TWITTER', btnYoutube.position.x + 256, 850, 64);
		btnTwitter.onClick = goToTwitter;

		btnMenu = new ButtonText('Abel', 'MENU', 32, 32, 64);
		btnMenu.onClick = setMenuState;

		btnKha = new ButtonText('Abel', 'KHA', btnTwitter.position.x + 256, 850, 64);
		btnKha.onClick = goToKha;
		btnHaxe = new ButtonText('Abel', 'HAXE', btnKha.position.x + 256, 850, 64);
		btnHaxe.onClick = goToHaxe;
	}

	override public function update() {
		
	}

	override public function render(canvas:Canvas) {
		txtThankYou.render(canvas);
		txtInfo.render(canvas);
		txtTheme.render(canvas);
		txtTech.render(canvas);
		txtExtra.render(canvas);

		txtLewisLepton.render(canvas);

		btnWebsite.render(canvas);
		btnPatreon.render(canvas);
		btnYoutube.render(canvas);
		btnTwitter.render(canvas);

		btnKha.render(canvas);
		btnHaxe.render(canvas);

		btnMenu.render(canvas);
	}

	override public function onMouseDown(button:Int, x:Int, y:Int):Void {
		btnWebsite.onButtonDown(x, y);
		btnPatreon.onButtonDown(x, y);
		btnYoutube.onButtonDown(x, y);
		btnTwitter.onButtonDown(x, y);

		btnKha.onButtonDown(x, y);
		btnHaxe.onButtonDown(x, y);

		btnMenu.onButtonDown(x, y);
	}

	public function setMenuState(){
		State.set('menu');
	}

	public function goToWebsite(){
		System.loadUrl('https://lewislepton.com');
	}

	public function goToPatreon(){
		System.loadUrl('https://patreon.com/lewislepton');
	}

	public function goToYoutube(){
		System.loadUrl('https://youtube.com/lewislepton');
	}

	public function goToTwitter(){
		System.loadUrl('https://twitter.com/lewislepton');
	}

	public function goToKha(){
		System.loadUrl('http://kha.tech');
	}

	public function goToHaxe(){
		System.loadUrl('https://haxe.org');
	}
}