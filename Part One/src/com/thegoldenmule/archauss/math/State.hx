/**
 * A value object containing various physical state data.
 * 
 * @author thegoldenmule
 */

package com.thegoldenmule.archauss.math;

class State implements Dynamic <Float> {
	// Time
	public var t:Float;
	public var dt:Float;
	
	// Rotational kinematics
	public var o:Float;
	public var w:Float;
	public var I:Float;
	
	// Translational kinematics
	public var x:Float;
	public var y:Float;
	public var vx:Float;
	public var vy:Float;
	public var mass:Float;
	
	// Forces
	public var T:Float;
	public var fx:Float;
	public var fy:Float;
	
	public function new() {
		t = dt = o = w = I = x = y = vx = vy = mass = T = fx = fy = 0;
	}
	
	public function clone():State {
		var state:State = new State();
		state.setState(this);
		
		return state;
	}
	
	public function setState(state:State):Void {
		t = state.t;
		dt = state.dt;
		
		o = state.o;
		w = state.w;
		I = state.I;
		
		x = state.x;
		y = state.y;
		vx = state.vx;
		vy = state.vy;
		mass = state.mass;
		
		T = state.T;
		fx = state.fx;
		fy = state.fy;
	}
	
	public function trace() {
		trace("State dump :");
		trace("x : " + x);
		trace("y : " + y);
	}
}