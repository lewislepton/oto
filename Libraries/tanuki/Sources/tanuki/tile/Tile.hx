package tanuki.tile;

import tanuki.geom.Rect;

class Tile {
	public var index: Int;
	public var visible: Bool;
	public var collides: Bool;
	
	public function new(index:Int, collides:Bool){
		this.index = index;
		this.collides = collides;
		visible = true;
	}
	
	public function collision(rect:Rect):Bool {
		return collides;
	}
}