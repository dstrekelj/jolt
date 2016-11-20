package jolt.geom;

import jolt.math.Vec2;

/**
	A shape is defined by its vertices.
*/
class Shape {
	/** A collection of vertices making up the shape. */
	public var vertices : Array<Vec2>;

	/**
		Creates a new shape.
	*/
	public function new() : Void {
		vertices = new Array<Vec2>();
	}
}
