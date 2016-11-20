package jolt.math;

/**
	A generic implementation of a three-component square matrix of
	floating point values.
*/
class Mat3 {
	/** Matrix components, in row-major ordering. */
	public var xx : Float;	public var xy : Float;	public var xz : Float;
	public var yx : Float;	public var yy : Float;	public var yz : Float;
	public var zx : Float;	public var zy : Float;	public var zz : Float;

	/**
		Creates new matrix.
		@param	xx	X component of X vector
		@param	xy	Y component of X vector
		@param	xz	Z component of X vector
		@param	yx	X component of Y vector
		@param	yy	Y component of Y vector
		@param	yz	Z component of Y vector
		@param	zx	X component of Z vector
		@param	zy	Y component of Z vector
		@param	zz	Z component of Z vector
	*/
	public function new(
		xx : Float,	xy : Float,	xz : Float,
		yx : Float,	yy : Float,	yz : Float,
		zx : Float,	zy : Float,	zz : Float
	) : Void {
		this.xx = xx;	this.xy = xy;	this.xz = xz;
		this.yx = yx;	this.yy = yy;	this.yz = yz;
		this.zx = zx;	this.zy = zy;	this.zz = zz;
	}

	/**
		Creates identity matrix.
		@return	Identity matrix
	*/
	public static inline function identity() : Mat3 {
		return new Mat3(
			1,	0,	0,
			0,	1,	0,
			0,	0,	1
		);
	}

	/**
		Creates emtpy matrix.
		@return Empty matrix
	*/
	public static inline function empty() : Mat3 {
		return new Mat3(
			0,	0,	0,
			0,	0,	0,
			0,	0,	0
		);
	}

	/**
		Creates scale transformation matrix.
		@param	x	Scale along X axis
		@param	y	Scale along Y axis
		@return Scale transformation matrix
	*/
	public static inline function scale(x : Float, y : Float) : Mat3 {
		return new Mat3(
			x,	0,	0,
			0,	y,	0,
			0,	0,	1
		);
	}

	/**
		Creates rotation transformation matrix. Rotation is applied in
		clockwise direction.
		@param	rad	Angle in radians
		@return Rotation transformation matrix 
	*/
	public static inline function rotate(rad : Float) : Mat3 {
		var c : Float = Math.cos(rad);
		var s : Float = Math.sin(rad);
		return new Mat3(
			c,	s,	0,
			-s,	c,	0,
			0,	0,	1
		);
	}

	/**
		Performs negation of matrix components, producing a new matrix
		in the process.
		@return	New matrix
	*/
	public inline function neg() : Mat3 {
		return new Mat3(
			-xx,	-xy,	-xz,
			-yx,	-yy,	-yz,
			-zx,	-zy,	-zz
		);
	}

	/**
		Performs matrix addition, producing a new matrix in the
		process.
		@param	m	Matrix
		@return	New matrix
	*/
	public inline function add(m : Mat3) : Mat3 {
		return new Mat3(
			xx + m.xx,	xy + m.xy,	xz + m.xz,
			yx + m.yx,	yy + m.yy,	yz + m.yz,
			zx + m.zx,	zy + m.zy,	zz + m.zz
		);
	}

	/**
		Performs matrix subtraction, producing a new matrix in the
		process.
		@param	m	Matrix
		@return	New matrix
	*/
	public inline function sub(m : Mat3) : Mat3 {
		return new Mat3(
			xx - m.xx,	xy - m.xy,	xz - m.xz,
			yx - m.yx,	yy - m.yy,	yz - m.yz,
			zx - m.zx,	zy - m.zy,	zz - m.zz
		);
	}

	/**
		Performs scalar multiplication, producing a new matrix in the
		process.
		@param	s	Scalar
		@return New matrix
	*/
	public inline function mul(s : Float) : Mat3 {
		return new Mat3(
			xx * s,	xy * s,	xz * s,
			yx * s,	yy * s,	yz * s,
			zx * s,	zy * s,	zz * s
		);
	}

	/**
		Performs matrix multiplication, producing a new matrix in the
		process.
		@param	m	Matrix
		@return	New matrix
	*/
	public inline function mulMat3(m : Mat3) : Mat3 {
		return new Mat3(
			xx * m.xx + xy * m.yx + xz * m.zx,	xx * m.xy + xy * m.yy + xz * m.zy,	xx * m.xz + xy * m.yz + xz * m.zz,
			yx * m.xx + yy * m.yx + yz * m.zx,	yx * m.xy + yy * m.yy + yz * m.zy,	yx * m.xz + yy * m.yz + yz * m.zz,
			zx * m.xx + zy * m.yx + zz * m.zx,	zx * m.xy + zy * m.yy + zz * m.zy,	zx * m.xz + zy * m.yz + zz * m.zz
		);
	}

	/**
		Prepares string representation of matrix structure.
		@return	String representation of matrix structure
	*/
	public inline function toString() : String {
		return '{ { xx : $xx, xy : $xy, xz : $xz }, { yx : $yx, yy : $yy, yz : $yz }, { zx : $zx, zy : $zy, zz : $zz }}';
	}
}
