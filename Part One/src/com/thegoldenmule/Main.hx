package com.thegoldenmule;

import com.thegoldenmule.archauss.collision.BruteForceCollisionDetector;
import com.thegoldenmule.archauss.math.ode.Solver;
import com.thegoldenmule.archauss.math.State;
import com.thegoldenmule.archauss.render.GraphicsRenderer;
import com.thegoldenmule.archauss.shape.Circle;

import flash.events.Event;
import flash.Lib;

/**
 * A physics engine 1/10 as fast as Box2D! But only half as stupidly named!
 * 
 * @author thegoldenmule
 */

class Main {
	
	// a collection of circles
	private static var _collection:Array<Circle>;
	
	// our three main pieces
	private static var _solver:Solver;
	private static var _collisionDetector:BruteForceCollisionDetector;
	private static var _renderer:GraphicsRenderer;
	
	// our time step
	private static var _step:Float;
	
	static function main() {
		// create our main objects
		_solver = new Solver();
		_collisionDetector = new BruteForceCollisionDetector();
		_renderer = new GraphicsRenderer(Lib.current);
		
		// set our time step
		_step = 1 / 30;
		
		// create a new collection
		_collection = new Array<Circle>();
		
		// create 20 random circles
		var i:Int = 20;
		var state:State;
		while (i-- > 0) {
			var j:Int = 1;
			while (j-- > 0) {
				var circle:Circle = new Circle(Math.floor(1 + Math.random() * 40));
				state = new State();
				state.x = i * 40;
				state.y = 100 + j * 10;
				state.mass = 10;
				circle.state = state;
				_collection.push(circle);
			}
		}
		
		// listen for ENTER_FRAME events to form our loop
		Lib.current.addEventListener(Event.ENTER_FRAME, loop);
	}
	
	private static function loop(event:Event):Void {
		// perform the physics!
		integrate(_collection);
		
		// take actions when two objects intersect
		resolveCollisions(_collection);
		
		// render the result
		render(_collection);
	}
	
	private static function integrate(collection:Array<Circle>):Void {
		// iterate over all the Circles and integrate over their State objects
		var circle:Circle;
		for (circle in collection) {
			_solver.integrate(circle.state, _step);
		}
	}
	
	private static function resolveCollisions(collection:Array<Circle>):Void {
		// resolve the collisions of our Circles
		_collisionDetector.resolveCollisions(collection);
	}
	
	private static function render(collection:Array<Circle>):Void {
		// refresh our renderer
		_renderer.refresh();
		
		// render each Circle
		var circle:Circle;
		for (circle in collection) {
			_renderer.render(circle);
		}
	}
}