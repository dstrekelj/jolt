package jolt.algo.narrow;

import jolt.geom.Circle;

class CircleCircle {
	public static function contains(a : Circle, b : Circle) : Bool {
		if (a.r < b.r) return false;
		return (b.origin.sub(a.origin).length <= (a.r - b.r));
	}

	public static function overlaps(a : Circle, b : Circle) : Bool {
		return (b.origin.sub(a.origin).length <= (a.r + b.r));
	}
}