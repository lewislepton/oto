import tanuki.audio.Sounds;
import tanuki.App;
import tanuki.State;

import state.MenuState;
import state.FinishState;

import state.level.*;

class Oto extends App {
  public function new(){
    super();
    Sounds.go('otoloop', 0.25, true);

    State.addState('menu', new MenuState());
    State.addState('finish', new FinishState());

    State.addState('level0', new Level0('level0', 'level1'));
    State.addState('level1', new Level1('level1', 'level2'));
    State.addState('level2', new Level2('level2', 'level3'));
    State.addState('level3', new Level3('level3', 'level4'));
    State.addState('level4', new Level4('level4', 'level5'));
    State.addState('level5', new Level5('level5', 'level6'));
    State.addState('level6', new Level6('level6', 'level7'));
    State.addState('level7', new Level7('level7', 'level8'));
    State.addState('level8', new Level8('level8', 'level9'));
    State.addState('level9', new Level9('level9', 'level10'));
    State.addState('level10', new Level10('level10', 'level11'));
    State.addState('level11', new Level11('level11', 'level12'));
    State.addState('level12', new Level12('level12', 'level13'));
    State.addState('level13', new Level13('level13', 'level14'));
    State.addState('level14', new Level14('level14', 'level15'));
    State.addState('level15', new Level15('level15', 'level16'));
    State.addState('level16', new Level16('level16', 'level17'));
    State.addState('level17', new Level17('level17', 'level18'));
    State.addState('level18', new Level18('level18', 'level19'));
    State.addState('level19', new Level19('level19', 'level20'));
    State.addState('level20', new Level20('level20', 'level21'));
    State.addState('level21', new Level21('level21', 'level22'));
    State.addState('level22', new Level22('level22', 'level23'));
    State.addState('level23', new Level23('level23', 'level24'));
    State.addState('level24', new Level24('level24', 'level25'));
    State.addState('level25', new Level25('level25', 'level26'));
    State.addState('level26', new Level26('level26', 'level27'));
    State.addState('level27', new Level27('level27', 'level28'));
    State.addState('level28', new Level28('level28', 'level29'));
    State.addState('level29', new Level29('level29', 'level30'));
    State.addState('level30', new Level30('level30', 'finish'));

    State.set('menu');
  }
}