/**
 * An integrator.
 * 
 * @author Benjamin Jordan
 */

package com.thegoldenmule.archauss.math.ode;

import com.thegoldenmule.archauss.math.State;

class Solver
{

	public function new() {
		//
	}
	
	public function integrate(state:State, step:Float):Void {
		return;
		/*
			y_{i+1} = y_i + h * f(t_i, y_i)
		*/
		
		state.t += step;
		state.dt = step;
		
		state.vx += step * ( state.fx / state.mass );
		state.vy += step * ( state.fy / state.mass );
		
		state.x += step * state.vx;
		state.y += step * state.vy;
		
		state.o += step * ( state.w );
		state.w += step * ( state.T / state.I );
	}
}