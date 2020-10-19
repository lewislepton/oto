package tanuki.ui;

import kha.Canvas;
import tanuki.ui.Text;

class Score {
  public var score(get, null):Int = 0;
  var txtScore:Text;

  public function new(fontname:String, x:Float, y:Float, size:Int){
    txtScore = new Text(fontname, '' + score, x, y, size);
  }

  public function update(){
    txtScore.string = '' + score;
  }

  public function render(canvas:Canvas){
    txtScore.render(canvas);
  }

  public function up(value:Int){
    score += value;
  }

  public function down(value:Int){
    score -= value;
  }

  public function reset(){
    score = 0;
  }

  public function get_score():Int {
    return score;
  }
}