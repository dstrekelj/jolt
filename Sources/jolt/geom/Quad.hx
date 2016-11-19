package jolt.geom;

import jolt.geom.Shape;
import jolt.math.Vec2;

class Quad extends Shape {
	public var minX(get, set) : Float;
	public var minY(get, set) : Float;
	public var maxX(get, set) : Float;
	public var maxY(get, set) : Float;

	public function new(x : Float, y : Float, w : Float, h : Float) : Void {
		super();
		
		vertices = [
			new Vec2(x, y),
			new Vec2(x + w, y),
			new Vec2(x + w, y + h),
			new Vec2(x, y + h)
		];
	}

	inline function get_maxX() return vertices[2].x;
	inline function get_maxY() return vertices[2].y;
	inline function get_minX() return vertices[0].x;
	inline function get_minY() return vertices[0].y;
	inline function set_maxX(x) return vertices[2].x = x;
	inline function set_maxY(y) return vertices[2].y = y;
	inline function set_minX(x) return vertices[0].x = x;
	inline function set_minY(y) return vertices[0].y = y;
}