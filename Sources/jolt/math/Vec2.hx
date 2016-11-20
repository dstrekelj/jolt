package jolt.math;

/**
	A generic implementation of a two-component vector of floating
	point values.
*/
class Vec2 {
	/** X component. */
	public var x : Float;

	/** Y component. */
	public var y : Float;

	/**
		Creates new two-component vector of floating point values.
		@param	x	X component
		@param	y	Y component
	*/
	public inline function new(x : Float, y : Float) : Void {
		this.x = x;
		this.y = y;
	}

	/**
		Performs vector addition, producing a new vector.
		@param	v	Vector
		@return	New vector
	*/
	public inline function add(v : Vec2) : Vec2 {
		return new Vec2(x + v.x, y + v.y);
	}

	/**
		Computes vector cross product.
		@param	v	Vector
		@return	Vector cross product
	*/
	public inline function cross(v : Vec2) : Float {
		return x * v.y - y * v.x;
	}

	/**
		Performs vector division, producing a new vector.
		@param	v	Vector
		@return	New vector
	*/
	public inline function div(v : Float) : Vec2 {
		return new Vec2(x / v, y / v);
	}

	/**
		Computes vector dot product.
		@param	v	Vector
		@return	Vector dot product
	*/
	public inline function dot(v : Vec2) : Float {
		return x * v.x + y * v.y;
	}

	/**
		Computes vector length.
		@return	Vector length
	*/
	public inline function len() : Float {
		return Math.sqrt(dot(this));
	}

	/**
		Performs linear interpolation of vector components, producing
		a new vector.
		@param	v	Target vector
		@param	f	Interpolation factor
		@return	New vector
	*/
	public inline function lerp(v : Vec2, f : Float) : Vec2 {
		return new Vec2(x + (v.x - x) * f, y + (v.y - y) * f);
	}

	/**
		Performs scalar multiplication, producing a new vector.
		@param	s	Scalar
		@return	New vector
	*/
	public inline function mul(B : Float) : Vec2 {
		return new Vec2(x * B, y * B);
	}

	/**
		Performs vector negation, producing a new vector.
		@return	New vector
	*/
	public inline function neg() : Vec2 {
		return new Vec2(-x, -y);
	}

	/**
		Performs vector normalization, producing a new vector.
		@return	New vector
	*/
	public inline function normalize() : Vec2 {
		var l = len();
		return new Vec2(x / l, y / l);
	}

	/**
		Performs vector subtraction, producing a new vector.
		@param	v	Vector
		@return	New vector
	*/
	public inline function sub(v : Vec2) : Vec2 {
		return new Vec2(x - v.x, y - v.y);
	}

	/**
		Prepares string representation of vector structure.
		@return	String representation of vector structure
	*/
	public inline function toString() : String {
		return '{ x : $x, y : $y }';
	}
}
