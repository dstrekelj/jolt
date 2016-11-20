package jolt;

import jolt.geom.Quad;
import jolt.geom.Shape;
import jolt.math.Vec2;

class Painter {
	public static function paintQuad(p : IPaint, q : Quad) : Void {
		paintVertices(p, q.vertices);
	}

	public static function paintShape(p : IPaint, s : Shape) : Void {
		paintVertices(p, s.vertices);
	}

	static function paintVertices(p : IPaint, v : Array<Vec2>) : Void {
		var l = v.length;
		while (--l >= 0) {
			if (l-1 < 0) p.line(v[0], v[v.length-1]);
			else p.line(v[l], v[l-1]);
		}
	}
}

interface IPaint {
	function point(p : Vec2) : Void;
	function line(a : Vec2, b : Vec2) : Void;
}
