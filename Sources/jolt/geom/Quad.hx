package jolt.geom;

import jolt.geom.Shape;
import jolt.math.Vec2;

/**
	A quad is a rectangular axis-aligned shape. It provides
	convenience methods for easier access to properties useful for
	determining collision.
*/
class Quad extends Shape {
	/** Minimum X-coordinate of the shape (point furthest left). */
	public var minX(get, set) : Float;

	/** Minimum Y-coordinate of the shape (point furthest top). */
	public var minY(get, set) : Float;

	/** Maximum X-coordinate of the shape (point furthest right). */
	public var maxX(get, set) : Float;

	/** Maximum Y-coordinate of the shape (point furthest bottom). */
	public var maxY(get, set) : Float;

	/**
		Creates new quad at `(x, y)` position, of `(w, h)` size.
		@param	x	X-position (top-left)
		@param	y	Y-position (top-left)
		@param	w	Width
		@param	h	Height
	*/
	public function new(x : Float, y : Float, w : Float, h : Float) : Void {
		super();
		
		vertices = [
			new Vec2(x, y),
			new Vec2(x + w, y),
			new Vec2(x + w, y + h),
			new Vec2(x, y + h)
		];
	}

	@:noCompletion inline function get_maxX() return vertices[2].x;
	@:noCompletion inline function get_maxY() return vertices[2].y;
	@:noCompletion inline function get_minX() return vertices[0].x;
	@:noCompletion inline function get_minY() return vertices[0].y;
	@:noCompletion inline function set_maxX(x) return vertices[2].x = x;
	@:noCompletion inline function set_maxY(y) return vertices[2].y = y;
	@:noCompletion inline function set_minX(x) return vertices[0].x = x;
	@:noCompletion inline function set_minY(y) return vertices[0].y = y;
}
