package tanuki.collide;

import tanuki.math.Vector2D;

interface Shape {
	/**
		 The origin / centre of the shape.
	*/
	public var position(get, set):Vector2D;

	/**
		 Given a direction in global coordinates, return the vertex (in global coordinates)
			that is the furthest in that direction
			@param direction 
			@return Vec2
	*/
	public function support(direction: Vector2D):Vector2D;
}