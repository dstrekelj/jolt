package jolt.algo.narrow;

import jolt.math.Vec2;
import jolt.geom.Circle;

class CheckCircle {
	public static function containsCircle(a : Circle, b : Circle) : Bool {
		if (a.r < b.r) return false;
		return (b.origin.sub(a.origin).length <= (a.r - b.r));
	}

	public static function containsPoint(a : Circle, b : Vec2) : Bool {
		return (b.sub(a.origin).length <= a.r);
	}

	public static function overlapsCircle(a : Circle, b : Circle) : Bool {
		return (b.origin.sub(a.origin).length <= (a.r + b.r));
	}
}