/* *
 * code draw(n) by Ryan Christensen
 * drawk.com  * drawcode.com * drawlogic.com * drawlabs.com * baseplane.com * bridgeware.com
 * 
 * The MIT License
 * 
 * Copyright (c) 2006-2008 Ryan Christensen, drawk llc
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 * 
 * */
package drawlogic.as3.game.tileengineapp
{
	import flash.accessibility.*;
	import flash.display.*;
	import flash.errors.*;
	import flash.events.*;
	import flash.external.*;
	import flash.filters.*;
	import flash.geom.*;
	import flash.media.*;
	import flash.net.*;
	import flash.printing.*;
	import flash.system.*;
	import flash.text.*;
	import flash.ui.*;
	import flash.utils.*;
	import flash.xml.*;	

	/**
	* import bridgeware/drawlogic libs
	*/
	import drawlogic.as3.util.*;
	import drawlogic.as3.game.tileengine.*;
	import drawlogic.as3.game.tileengineService.*;

	/**
	* polygonal labs random number and data structures
	*/
	import de.polygonal.ds.*;
	import de.polygonal.math.*;
	
	/**
	* tweener and tweenerlite
	*/
	import gs.*;
	import caurina.transitions.*;

	public class TileEngineAppBaseItemResizer extends MovieClip
	{
		public function TileEngineAppBaseItemResizer()
		{
			trace("drawlogic.as3.game.tileengineapp.TileEngineAppBaseItem Loaded...");			
			this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
			DrawBoundingBox();
		}
		
		public function onMouseMoveHandler(event:Event)
		{
			//this.removeChildAt(0);
			
			trace("Moving mouse over me: " + this.name);
		
		}
		
		public function onMouseDownHandler(event:Event)
		{
			this.startDrag(false, new Rectangle(0-this.width, 0-this.height,parent.width-40, parent.height-40));
			
		}
		
		public function onMouseUpHandler(event:Event)
		{
			this.stopDrag();
		}
		
		public function DrawBoundingBox()
		{
			var mBound:Sprite = new Sprite();
			mBound.graphics.beginFill(0xff0000,.2);
			mBound.graphics.lineStyle(2, 0x333333, .5);
			mBound.graphics.drawRect(this.x, this.y, 20, 20);
			mBound.graphics.endFill();
		
			this.addChildAt(mBound,0);	
			
		}
		
		
	}
}
