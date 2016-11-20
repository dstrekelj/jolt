package jolt.algo.broad;

import haxe.ds.Vector;
import jolt.geom.Quad;

using jolt.algo.narrow.CheckQuad;

/**
	Quadtrees are a spatial partitioning data structure used during
	the broad phase of collision detection for detecting groups of
	shapes that may be colliding.

	A root region is split into four nodes of equal size, each of
	which can serve as the root region of its own quadtree. Every node
	contains references to the shapes that overlap it (shapes that are
	currently located in the region). When the environment of a
	colliding shape is fetched, the nodes are queried down to the leaf
	node, and the leaf node's shape references are returned.
*/
class QuadTree extends Quad {
	/** Depth at which this node resides in the quadtree. */
	var depth : Int;

	/** Items (shapes) present in this node. */
	var items : Array<Quad>;

	/** Maximum allowed depth to fork the tree down to. */
	var maxDepth : Int;

	/** Maximm allowed number of items (shapes) before node forks. */
	var maxItems : Int;

	/** The nodes this node may have split into. */
	var nodes : Vector<QuadTree>;

	/**
		Creates new quadtree.
		@param	x			Region X-position
		@param	y			Region Y-position
		@param	w			Region width
		@param	h			Region height
		@param	maxDepth	Maximum depth level
		@param	maxItems	Maximum items count
		@param	depth		Current depth level
	*/
	function new(x : Float, y : Float, w : Float, h : Float, maxDepth : Int, maxItems : Int, depth : Int) : Void {
		super(x, y, w, h);

		this.maxDepth = maxDepth;
		this.maxItems = maxItems;
		this.depth = depth;

		clear();
	}

	/**
		Creates a quadtree root.
		@param	x			Region X-position
		@param	y			Region Y-position
		@param	w			Region width
		@param	h			Region height
		@param	maxDepth	Maximum depth level
		@param	maxItems	Maximum items count
		@return	Quadtree instance, the root of all other generated trees
	*/
	public static function create(x : Float, y : Float, w : Float, h : Float, maxDepth : Int, maxItems : Int) : QuadTree {
		return new QuadTree(x, y, w, h, maxDepth, maxItems, 0);
	}

	/**
		Clears quadtree, removing all items and nodes.
	*/
	public function clear() : Void {
		items = new Array<Quad>();

		if (nodes != null) {
			for (node in nodes) node.clear();
			nodes = null;
		}
	}

	/**
		Queries the quadtree to retrieve the items (shapes) that
		surrounded the provided shape.
		@param	q	Quad
		@return	Array of items (shapes) in the region
	*/
	public function get(q : Quad) : Array<Quad> {
		var environment = new Array<Quad>();

		if (nodes != null) {
			for (node in nodes) {
				if (q.overlapsQuad(node)) {
					environment = environment.concat(node.get(q));
				}
			}
		} else {
			environment = environment.concat(items);
		}

		return environment;
	}

	/**
		Places a shape into the quadtree.
		@param	q	Quad
	*/
	public function put(q : Quad) : Void {
		if (items.length >= maxItems && depth < maxDepth) {
			if (nodes == null) fork();
			forward(q);
		}

		items.push(q);
	}

	/**
		Forks the region into four separate regions, making it a
		quadtree.
	*/
	function fork() : Void {
		nodes = new Vector<QuadTree>(4);

		var nodeWidth = (maxX - minX) / 2;
		var nodeHeight = (maxY - minY) / 2;

		// Create quadrants according to Cartesian coordinate system
		nodes[0] = new QuadTree(minX + nodeWidth, minY			   , nodeWidth, nodeHeight, maxDepth, maxItems, depth + 1);
		nodes[1] = new QuadTree(minX + nodeWidth, minY + nodeHeight, nodeWidth, nodeHeight, maxDepth, maxItems, depth + 1);
		nodes[2] = new QuadTree(minX			, minY + nodeHeight, nodeWidth, nodeHeight, maxDepth, maxItems, depth + 1);
		nodes[3] = new QuadTree(minX			, minY			   , nodeWidth, nodeHeight, maxDepth, maxItems, depth + 1);

		for (item in items) forward(item);
	}

	/**
 		Forwards shape into quadtree nodes.
		@param	q	Quad
	*/
	function forward(q : Quad) : Void {
		for (node in nodes) {
			if (q.overlapsQuad(node)) {
				node.put(q);
			}
		}
	}
}
