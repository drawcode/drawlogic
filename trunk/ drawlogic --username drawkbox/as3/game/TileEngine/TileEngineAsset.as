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

	public class TileEngineAsset extends MovieClip
	{
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		public var assetX:Number = 0;
		public var assetY:Number = 0;
		public var assetZ:Number = 0;
		
		public var className:String = "drawlogic.as3.tileengine.TileEngineAssetItem";
		
		public var name:String = "";
		public var code:String = "";
		public var displayName:String = "";
		

		/**
		* -------------------------------------------------------------------------> NEW
		*/		
		public function TileEngineAsset():void
		{
			
		}
		/**
		* -------------------------------------------------------------------------> METHODS
		*/		

		/**
		* -------------------------------------------------------------------------> EVENTS
		*/
		
		/**
		* onMouseMoveHandler
		* @param	event
		* @return
		*/
		function onMouseMoveHandler(event:Event):void
		{
			
		}
		
		/**
		* onMouseClickHandler
		* @param	event
		* @return
		*/
		function onMouseClickHandler(event:Event):void
		{	
			
		}
		
		/**
		* onMouseWheelHandler
		* @param	event
		* @return
		*/
		function onMouseWheelHandler(event:Event):void
		{	
			
		}
		
		/**
		* onEnterFrameHandler
		* @param	event
		* @return
		*/
		function onEnterFrameHandler(event:Event):void
		{
			
		}
	}
}