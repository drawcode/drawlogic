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

	public class TileEngineAppMapContainer extends MovieClip
	{
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		// this is for global settings and functionality.
		//public static var assetPath:String = "base/assets/";
		public var mapVisible:Boolean = false;

		/**
		* -------------------------------------------------------------------------> NEW
		*/		
		// constructor
		public function TileEngineAppMapContainer()
		{
			// trace the state
			//trace("Loading TileEngineAppMapContainer...");
			
			// initialize
			Init();

		}
		/**
		* -------------------------------------------------------------------------> METHODS
		*/		
		// initialize the class
		public function Init()
		{
			// trace the state
			//trace("Initializing TileEngineAppMapContainer...");
			
			this.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
			
			this.buttonMode = true;
			this.useHandCursor = true;

		}		
		/**
		* -------------------------------------------------------------------------> EVENTS
		*/	
	
		
		function onMouseMoveHandler(event:Event) : void
		{
			
		}

		function onMouseClickHandler(event:Event) : void
		{	
			//Log(LogType.TRACE_LOG, event);
			
			if(mapVisible)
			{
				// do scroll in
				Tweener.addTween(this, {y:this.y - (this.height-49)
					, time:.5, delay:0, transition:"easeinoutexpo"
					, onComplete:onMapMoveHandler});
					
				Tweener.addTween(this, {_blur_blurY:20, time:.3});
				Tweener.addTween(this, {_blur_blurY:0, time:.2, delay:.3});
				//Tweener.removeTweensByTime(this, _blur_blurY, .5 ,.5);
				mapVisible = false;
			}
			else
			{
				// do scroll out
				Tweener.addTween(this, {y:this.y +  (this.height-49)
					, time:.7, delay:0, transition:"easeinoutexpo"
					, onComplete:onMapMoveHandler});
					
				Tweener.addTween(this, {_blur_blurY:20, time:.3});
				Tweener.addTween(this, {_blur_blurY:0, time:.3, delay:.3});
				mapVisible = true;
			}
		}
		
		function onMapMoveHandler(event:Event)
		{
			
		}

		function onMouseWheelHandler(event:Event):void
		{	
			
		}

		function onEnterFrameHandler(event:Event):void
		{
			
		}
	}
}