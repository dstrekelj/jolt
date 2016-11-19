package jolt.algo.narrow;

import jolt.geom.Quad;

class QuadQuad {
	public static function contains(a : Quad, b : Quad) : Bool {
		if (a.minX > b.minX) return false;
		if (a.minY > b.minY) return false;
		if (a.maxX < b.maxX) return false;
		if (a.maxY < b.maxY) return false;
		return true;
	}

	public static function overlaps(a : Quad, b : Quad) : Bool {
		if (a.minX > b.maxX) return false;
		if (a.minY > b.maxY) return false;
		if (a.maxX < b.minX) return false;
		if (a.maxY < b.minY) return false;
		return true;
	}
}