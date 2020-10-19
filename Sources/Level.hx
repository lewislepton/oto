package;

import tanuki.math.Vector2D;
import kha.Canvas;

import tanuki.tool.Pool;
import tanuki.asset.Resources;

import char.Player;
import char.Square;
import char.Polygon;
import char.TrianglePath;
import world.Platform;
import world.Spike;
import asset.Bounce;
import world.Exit;

typedef LevelData ={layers:Array<{color:String,draworder:String,id:Int,name:String,objects:Array<{ellipse:Bool,height:Int,id:Int,name:String,text:Array<{text:String,valign:String}>,polygon:Array<{x:Float,y:Float}>,rotation:Int,type:String,visible:Bool,width:Int,x:Int,y:Int}>,opacity:Int,type:String,visible:Bool,x:Int,y:Int}>}

class Level {
	public var map:LevelData;
	public var players:Pool<Player>;
	public var platforms:Pool<Platform>;

	public var squares:Pool<Square>;
	public var polygons:Pool<Polygon>;
	public var trianglespath:Pool<TrianglePath>;

	public var exits:Pool<Exit>;
	public var bounces:Pool<Bounce>;
	public var spikes:Pool<Spike>;

	public var levelNumber:Int = 0;
	public var enemyCount:Int;

	public function new(string:String){
		map = Resources.jsonData(string);
		init();
	}

	public function init(){
		setupPlayer();
		setupPlatform();
		setupExit();
		setupSquare();
		setupPolygon();
		setupTrianglePath();
		setupBounce();
		setupSpike();

		enemyCount = squares.entities.length;
	}

	public function update(){
		enemyCount = squares.entities.length;
	}

	public function render(canvas:Canvas){
		for (exits in exits.entities){
			exits.render(canvas);
		}

		for (platforms in platforms.entities){
			platforms.render(canvas);
		}

		for (squares in squares.entities){
			squares.render(canvas);
		}

		for (polygons in polygons.entities){
			polygons.render(canvas);
		}

		for (trianglespath in trianglespath.entities){
			trianglespath.render(canvas);
		}

		for (bounces in bounces.entities){
			bounces.render(canvas);
		}

		for (spikes in spikes.entities){
			spikes.render(canvas);
		}
	}

	public function clear(){
		players.entities = [];
		platforms.entities = [];
		squares.entities = [];
		polygons.entities = [];
		exits.entities = [];
		spikes.entities = [];
		// enemies.entities = [];
		// spikes.entities = [];
		// clouds.entities = [];
	}

	private function setupPlayer(){
		players = new Pool<Player>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'player'){
					players.add(new Player(object.x + object.width / 2, object.y + object.height / 2, object.height / 2));
				}
			}
		}
	}

	private function setupPlatform(){
		platforms = new Pool<Platform>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'platform'){
					platforms.add(new Platform(object.x, object.y, object.width, object.height));
				}
			}
		}
	}

	private function setupSquare(){
		squares = new Pool<Square>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'square'){
					squares.add(new Square(object.x, object.y, object.width, object.height));
				}
			}
		}
	}

	private function setupPolygon(){
		polygons = new Pool<Polygon>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'polygon'){
					var vec = object.polygon.map(function(coord) return new Vector2D(coord.x, coord.y));
					polygons.add(new Polygon(object.x, object.y, vec));
				}
			}
		}
	}

	private function setupTrianglePath(){
		trianglespath = new Pool<TrianglePath>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'trianglepath'){
					var vec = object.polygon.map(function(coord) return new Vector2D(coord.x, coord.y));
					trianglespath.add(new TrianglePath(object.x, object.y, vec));
				}
			}
		}
	}

	private function setupExit(){
		exits = new Pool<Exit>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'exit'){
					exits.add(new Exit(object.x, object.y, object.width, object.height));
				}
			}
		}
	}

	private function setupBounce(){
		bounces = new Pool<Bounce>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'bounce'){
					bounces.add(new Bounce(object.x, object.y, object.width, object.height));
				}
			}
		}
	}

	private function setupSpike(){
		spikes = new Pool<Spike>();
		for (layer in map.layers){
			for (object in layer.objects){
				if (object.name == 'spike'){
					var vec = object.polygon.map(function(coord) return new Vector2D(coord.x, coord.y));
					spikes.add(new Spike(object.x, object.y, vec));
				}
			}
		}
	}

}