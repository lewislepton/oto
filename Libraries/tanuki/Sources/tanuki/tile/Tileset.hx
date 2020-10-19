package tanuki.tile;

import kha.Canvas;
import kha.graphics2.Graphics;
import kha.Image;
import kha.Color;

import tanuki.geom.Rect;
import tanuki.tile.Tile;

class Tileset {
	public var width : Int;
	public var height : Int;
	var xmax : Int;
	var ymax : Int;
	var image : Image;
	var tiles : Array<Tile>;

	public var tileNumber:Int;

	public var color:Color;	

	public var rect:Rect;

	public var debug = false;

	public function new(image: Image, width: Int, height: Int, tiles: Array<Tile> = null){		
		this.image = image;
		this.width = width;
		this.height = height;
		xmax = Std.int(image.width / width);
		ymax = Std.int(image.height / height);
		if (tiles == null) {
			this.tiles = new Array<Tile>();
			for (i in 0...getLength()) this.tiles.push(new Tile(i, false));
		}
		else this.tiles = tiles;

		rect = new Rect(this.xmax - xmax, this.ymax - ymax, this.width, this.height);
	}
	
	public function render(canvas:Canvas, tile: Int, x: Int, y: Int): Void {
		if (tile < 0) return;
		var index = tiles[tile].imageIndex;
		var ytile : Int = Std.int(index / xmax);
		var xtile : Int = index - ytile * xmax;
		if (debug){
			canvas.g2.color = Color.fromBytes(251, 41, 7);
			canvas.g2.drawRect(rect.x, rect.y, rect.width, rect.height);
			canvas.g2.drawRect(xtile * width, ytile * height, width, height);
		} else {
			canvas.g2.color = Color.White;
		}
		canvas.g2.drawScaledSubImage(image, xtile * width, ytile * height, width, height, x, y, width, height);

	}
	
	public function tile(index: Int): Tile {
		return tiles[index];
	}

	public function getLength(): Int {
		return xmax * ymax;
	}
}
