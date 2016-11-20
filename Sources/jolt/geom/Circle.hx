package jolt.geom;

import jolt.geom.Shape;
import jolt.math.Vec2;

/**
	A circle is a shape defined by a vertex (origin point) and radius.
	It provides convenience methods for easier access to properties
	useful for determining collision.
*/
class Circle extends Shape {
	/** Circle origin point. Read-only. */
	public var origin(get, null) : Vec2;

	/** Circle radius. */
	public var r(default, set) : Float;

	/** Circle diameter. Read-only. Updated when radius changes. */
	public var d(default, null) : Float;

	/**
		Creates new circle with origin at `(x, y)` and radius `r`.
		@param	x	X-position
		@param	y	Y-position
		@param	r	Radius
	*/
	public function new(x : Float, y : Float, r : Float) : Void {
		super();

		this.r = r;

		vertices = [
			new Vec2(x, y)
		];
	}

	@:noCompletion inline function get_origin() return vertices[0];
	@:noCompletion inline function set_r(r : Float) : Float {
		d = 2 * r;
		return this.r = r;
	}
}
