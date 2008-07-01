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
package drawlogic.as3.game.tileengine
{
	import flash.display.*;
	import flash.errors.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.media.*;
	import flash.ui.*;
	import flash.utils.*;
	import flash.xml.*;

	/**
	* import bridgeware/drawlogic libs
	*/
	import drawlogic.as3.util.*;

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

	public class TileEngineClass extends MovieClip
	{
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		// this is for global settings and functionality.
		public static var assetPath:String = "base/assets/";

		/**
		* -------------------------------------------------------------------------> NEW
		*/		
		// this is the main tile engine 
		public function TileEngineClass()
		{
			// trace the state
			trace("Loading TileEngineClass...");
			
			// initialize
			Init();

		}
		/**
		* -------------------------------------------------------------------------> METHODS
		*/		
		// this is the main tile engine 
		public function Init()
		{
			// trace the state
			trace("Initializing TileEngineClass...");

		}		
		/**
		* -------------------------------------------------------------------------> EVENTS
		*/	
	
		
		function onMouseMoveEvent(event:Event) : void
		{
			
		}

		function onMouseClickEvent(event:Event) : void
		{	
			
		}

		function onMouseWheelEvent(event:Event):void
		{	
			
		}

		function onEnterFrameEvent(event:Event):void
		{
			
		}
	}
}