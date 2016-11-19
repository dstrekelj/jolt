package jolt.geom;

import jolt.geom.Shape;
import jolt.math.Vec2;

class Circle extends Shape {
	public var origin(get, null) : Vec2;
	public var r(default, set) : Float;
	public var d(default, null) : Float;

	public function new(x : Float, y : Float, r : Float) : Void {
		super();

		this.r = r;

		vertices = [
			new Vec2(x, y)
		];
	}

	inline function get_origin() return vertices[0];
	inline function set_r(r) {
		d = 2 * r;
		return this.r = r;
	}
}
