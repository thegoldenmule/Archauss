/**
 * Definition of a basic circle.
 * 
 * @author thegoldenmule
 */

package com.thegoldenmule.archauss.shape;

import com.thegoldenmule.archauss.math.State;

class Circle 
{
	public var radius(default, default):Float;
	public var state(default, default):State;
	public var disabled(default, default):Bool;
	
	public function new(radius:Float = 10) {
		this.radius = radius;
		disabled = false;
	}
}