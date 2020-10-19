package tanuki.audio;

import kha.Assets;
import kha.audio1.Audio;

class Sounds {
  public static function go(string:String, ?volume:Float = 0.6, ?loop:Bool = false){
    var choiceSnd:Int = Math.floor(Math.random() * 3);
		if (choiceSnd == 0){
			var snd01 = Audio.play(Reflect.field(Assets.sounds, string+'01'), loop);
			snd01.volume = volume;
		} else if (choiceSnd == 1){
			var snd02 = Audio.play(Reflect.field(Assets.sounds, string+'02'), loop);
			snd02.volume = volume;
		} else if (choiceSnd == 2){
			var snd03 = Audio.play(Reflect.field(Assets.sounds, string+'03'), loop);
			snd03.volume = volume;
		}
  }
}