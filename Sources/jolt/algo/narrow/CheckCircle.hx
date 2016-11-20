package jolt.algo.narrow;

import jolt.math.Vec2;
import jolt.geom.Circle;

/**
	A collection of static functions for checking circle collisions
	against different shapes. Can be used as static extension.
*/
class CheckCircle {
	/**
		Checks if circle contains circle.
		@param	a	Circle
		@param	b	Circle
		@return	`true` if circle contains circle
	*/
	public static function containsCircle(a : Circle, b : Circle) : Bool {
		if (a.r < b.r) return false;
		return (b.origin.sub(a.origin).len() <= (a.r - b.r));
	}

	/**
		Checks if circle contains point.
		@param	a	Circle
		@param	b	Point
		@return `true` if circle contains point
	*/
	public static function containsPoint(a : Circle, b : Vec2) : Bool {
		return (b.sub(a.origin).len() <= a.r);
	}

	/**
		Checks if circle overlaps circle.
		@param	a	Circle
		@param	b	Circle
		@return `true` if circle overlaps circle
	*/
	public static function overlapsCircle(a : Circle, b : Circle) : Bool {
		return (b.origin.sub(a.origin).len() <= (a.r + b.r));
	}
}
