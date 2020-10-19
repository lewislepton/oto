package state.level;

import tanuki.particle.Emitter;
import kha.input.KeyCode;
import kha.Canvas;
import kha.Color;
import tanuki.collide.Collide;
import tanuki.math.Vector2D;

import tanuki.State;
import tanuki.audio.Sounds;

import char.Player;

class Level23 extends State {
  var player:Player;
  var deathEmitter:Emitter;
  var level:Level;
  var setLevel:String;
  var nextLevel:String;

  public function new(setLevel:String, nextLevel:String){
    super();
    this.setLevel = setLevel;
    this.nextLevel = nextLevel;

    level = new Level(setLevel);

    for (players in level.players.entities){
      player = new Player(players.position.x, players.position.y, players.radius);
    }

    deathEmitter = new Emitter(9, 3);
    deathEmitter.color = Color.Black;
  }

  override public function update(){
    level.update();
    player.update();
    deathEmitter.update();

    // PLATFORM
    for (platforms in level.platforms.entities){
			var intersection:Vector2D = Collide.collide(platforms, player);
			if(intersection != null) {
				Vector2D.addVec(player.position, intersection, player.position);
			}

			if (Collide.overlap(player.ground, platforms)){
				player.velocity.y = 0;
				player.onGround = true;
				if (player.onGround && player.jump){
          Sounds.go('jump');
					player.velocity.y = player.jumpValue;
					player.onGround = false;
				}
			}
		}

    // PLAYER STOMP SQUARE
		for (squares in level.squares.entities){
			if(Collide.overlap(player.stomp, squares)){
        if (player.jump){
          deathEmitter.spawn(squares.position.x, squares.position.y);
          player.velocity.y = player.jumpValue - 3.5;
          Sounds.go('square');
          level.squares.remove(squares);
        } else {
          deathEmitter.spawn(squares.position.x, squares.position.y);
          player.velocity.y = - 3.5;
          Sounds.go('square');
          level.squares.remove(squares);
        }
			}
      if (Collide.overlap(squares, player)){
        deathEmitter.spawn(player.position.x, player.position.y);
        Sounds.go('death');
        level.init();
        reset();
      }
		}

    // POLYGON
		for (polygons in level.polygons.entities){
      if (Collide.overlap(polygons, player)){
        deathEmitter.spawn(player.position.x, player.position.y);
        Sounds.go('death');
        level.init();
        reset();
      }
		}

    // TRIANGLE PATH
		for (path in level.trianglespath.entities){
      path.update();
      if (Collide.overlap(path.triangle, player)){
        deathEmitter.spawn(player.position.x, player.position.y);
        Sounds.go('death');
        level.init();
        reset();
      }
    }

    // BOUNCE
		for (bounces in level.bounces.entities){
			if(Collide.overlap(player, bounces)){
        if (player.jump){
				  player.velocity.y = player.jumpValue + player.jumpValue / 2;
          Sounds.go('bounce');
          bounces.lives -= 1;
        } else {
          player.velocity.y = player.jumpValue;
          Sounds.go('bounce');
          bounces.lives -= 1;
        }
			}
      if (bounces.lives <= 0){
        deathEmitter.spawn(bounces.position.x + bounces.width / 2, bounces.position.y + bounces.height / 2);
				level.bounces.remove(bounces);
      }
		}

    // SPIKE
		for (spikes in level.spikes.entities){
			if (Collide.overlap(spikes, player)){
        deathEmitter.spawn(player.position.x, player.position.y);
        Sounds.go('death');
        level.init();
        reset();
      }
		}

    // EXIT
		for (exits in level.exits.entities){
			if (level.enemyCount <= 0){
				exits.unlocked = true;
				if (Collide.overlap(player, exits) && player.open && player.onGround){
          Sounds.go('door');
					changeState();
				}
			}
		}

    if (player.reset){
      Sounds.go('reset');
      level.init();
      reset();
    }
  }

  override public function render(canvas:Canvas){
    level.render(canvas);
    player.render(canvas);
    deathEmitter.render(canvas);
  }

  override public function onKeyDown(keyCode:KeyCode):Void {
    if (!MenuState.btnGamepad.isOn){
      player.onKeyDown(keyCode);
    }
  }

  override public function onKeyUp(keyCode:KeyCode):Void {
    if (!MenuState.btnGamepad.isOn){
      player.onKeyUp(keyCode);
    }
  }

  override public function onGamepadAxis(axis:Int, value:Float):Void {
    if (MenuState.btnGamepad.isOn){
      player.onGamepadAxis(axis, value);
    }
  }

  override public function onGamepadButton(button:Int, value:Float):Void {
    if (MenuState.btnGamepad.isOn){
      player.onGamepadButton(button, value);
    }
  }

  function changeState(){
    State.set(nextLevel);
    reset();
  }

  function reset(){
		for (players in level.players.entities){
			player = new Player(players.position.x, players.position.y, players.radius);
		}
	}
}