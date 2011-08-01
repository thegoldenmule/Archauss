/**
 * A basic renderer using the Graphics object.
 * 
 * @author thegoldenmule
 */

package com.thegoldenmule.archauss.render;

import com.thegoldenmule.archauss.math.State;
import com.thegoldenmule.archauss.shape.Circle;

import flash.display.Graphics;
import flash.display.MovieClip;

class GraphicsRenderer
{
	private var _renderCanvas:MovieClip;
	private var _graphics:Graphics;
	
	public function new(canvas:MovieClip) {
		_renderCanvas = canvas;
		_graphics = _renderCanvas.graphics;
	}
	
	public function refresh():Void {
		_graphics.clear();
	}
	
	public function render(circle:Circle):Void {
		var state:State = circle.state;
		
		// draw circle
		_graphics.lineStyle(1, 0x00FF00);
		_graphics.drawCircle(state.x, state.y, circle.radius);
		
		// center
		_graphics.lineStyle(1, 0xFF0000);
		_graphics.drawCircle(state.x, state.y, 1);
	}
}