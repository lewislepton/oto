package tanuki.tmx.display;

import kha.Canvas;

interface Renderer {
	public function setTiledMap(map:TiledMap):Void;
	public function drawLayer(canvas : Canvas, layer:Layer):Void;
	// public function drawImageLayer(graphics : Graphics, imageLayer:ImageLayer):Void;
	public function clear(canvas :Canvas):Void;
}