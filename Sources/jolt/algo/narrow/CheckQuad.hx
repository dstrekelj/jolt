package jolt.algo.narrow;

import jolt.math.Vec2;
import jolt.geom.Quad;

class CheckQuad {
	public static function containsPoint(a : Quad, b : Vec2) : Bool {
		if (a.maxX < b.x) return false;
		if (a.maxY < b.y) return false;
		if (a.minX > b.x) return false;
		if (a.minY > b.y) return false;
		return true;
	}

	public static function containsQuad(a : Quad, b : Quad) : Bool {
		if (a.minX > b.minX) return false;
		if (a.minY > b.minY) return false;
		if (a.maxX < b.maxX) return false;
		if (a.maxY < b.maxY) return false;
		return true;
	}

	public static function overlapsQuad(a : Quad, b : Quad) : Bool {
		if (a.minX > b.maxX) return false;
		if (a.minY > b.maxY) return false;
		if (a.maxX < b.minX) return false;
		if (a.maxY < b.minY) return false;
		return true;
	}
}