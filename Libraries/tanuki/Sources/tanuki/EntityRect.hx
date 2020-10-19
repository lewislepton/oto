package tanuki;

import tanuki.collide.shape.Rectangle;

class EntityRect extends Rectangle {
	// public var stomp:Rectangle;

	public function new(x:Float, y:Float, width:Float, height:Float){
		super(width, height);
		position.x = x;
		position.y = y;
		// stomp = new Rectangle( width - 4, 22);
		// stomp.position.x = position.x + 2;
		// stomp.position.y = position.y + height;
	}

	override public function update(){
		super.update();

		// stomp.position.x = position.x + 2;
    // stomp.position.y = position.y + height;
	}
}