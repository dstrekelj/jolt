package jolt.math;

class Vec2 {
	public var x : Float;
	public var y : Float;
	public var length(get, never) : Float;

	public inline function new(x : Float, y : Float) : Void {
		this.x = x;
		this.y = y;
	}

	public inline function toString() : String {
		return '{ x : $x, y : $y }';
	}

	public inline function neg() : Vec2 {
		return new Vec2(-x, -y);
	}

	public inline function add(B : Vec2) : Vec2 {
		return new Vec2(x + B.x, y + B.y);
	}

	public inline function sub(B : Vec2) : Vec2 {
		return new Vec2(x - B.x, y - B.y);
	}

	public inline function mul(B : Float) : Vec2 {
		return new Vec2(x * B, y * B);
	}

	public inline function div(B : Float) : Vec2 {
		return new Vec2(x / B, y / B);
	}

	public inline function dot(B : Vec2) : Float {
		return x * B.x + y * B.y;
	}

	public inline function cross(B : Vec2) : Float {
		return x * B.y - y * B.x;
	}

	public inline function normalize() : Vec2 {
		return new Vec2(x / length, y / length);
	}

	public inline function lerp(to : Vec2, factor : Float) : Vec2 {
		return new Vec2(x + (to.x - x) * factor, y + (to.y - y) * factor);
	}

	inline function get_length() return Math.sqrt(dot(new Vec2(x, y)));
}