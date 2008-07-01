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

	public class TileEngineState extends MovieClip
	{		
		public static const MAP:String = "map";
		public static const MODAL:String = "modal";
		public static const EDIT:String = "edit";
		public static const REGISTER:String = "register";
		
		public static const MAP_STATE:int = 0;
		public static const MODAL_STATE:int = 2;
		public static const EDIT_STATE:int = 4;
		public static const REGISTER_STATE:int = 6;
		
		public static var bState:String = glo.bal.bState;
		public static var bStateSwitch:String = glo.bal.bStateSwitch;
		
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		// this is for global settings and functionality.
		public static var assetPath:String = "base/assets/";

		/**
		* -------------------------------------------------------------------------> NEW
		*/		
		// this is the main tile engine 
		public function TileEngineState()
		{
			// trace the state
			trace("Loading TileEngineState...");
			

		}
		
		public static function DoStateChange(str:String)
		{
			glo.bal.bState = str;
			glo.bal.bStateSwitch = str;
			// dispatch event for state change
			//var tileEngineEvent:TileEngineEvent = new TileEngineEvent(TileEngineEvent.STATE_CHANGE);
			try{
			//dispatchEvent(tileEngineEvent);
			//trace("tileEngineEvent:",tileEngineEvent);
			}catch (err:Error){
			//trace("ERROR: Dispatching TileEvent");
			}
		}
		
		public static function DoStateSwitch(str:String)
		{
			glo.bal.bStateSwitch = str;
		}
		
		
		/**
		* -------------------------------------------------------------------------> METHODS
		*/		
		// this is the main tile engine 
		public function Init()
		{
			// trace the state
			trace("Initializing TileEngineState...");

		}		
		/**
		* -------------------------------------------------------------------------> EVENTS
		*/	
	
		
		function onMouseMoveHandler(event:Event) : void
		{
			
		}

		function onMouseClickHandler(event:Event) : void
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