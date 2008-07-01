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
/**
* This is the main TileEngineAppAPI which provides some global
* methods, states and facade to other simplified actions
*/
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

	public class TileEngineAppCover extends MovieClip
	{
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		// this is for global settings and functionality.
		//public static var assetPath:String = "base/assets/";

		/**
		* -------------------------------------------------------------------------> NEW
		*/		
		// constructor
		public function TileEngineAppCover()
		{
		
			// initialize
			init();

		}
		/**
		* -------------------------------------------------------------------------> METHODS
		*/		
		// initialize the class
		public function init()
		{
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
			//this.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
		}		
		/**
		* -------------------------------------------------------------------------> EVENTS
		*/	
		function onMouseDownHandler(event:Event) : void
		{
			try
			{
				this.visible = false;				
			}
			catch(err:Error)
			{
				trace(err);
			}
		}
		
		function onMouseUpHandler(event:Event) : void
		{
			try
			{
				this.x =0;
				this.y =0;			
			}
			catch(err:Error)
			{
				trace(err);
			}
		}
		
		function onMouseOverHandler(event:Event) : void
		{
			try
			{
				Tweener.addTween(this, 
				{
					alpha: .0
					, time:.5
					, delay:0
					, transition:"easeinoutexpo"
					,onComplete:toggleVisible
				});
				
			}
			catch(err:Error)
			{
				trace(err);
			}
		}
		
		public function toggleVisible()
		{
			this.x = -5000;
			this.y = -5000;
			this.visible = false;			
		}

		function onMouseOutHandler(event:Event) : void
		{
			this.visible = true;
			this.x =0;
			this.y =0;
			try
			{
				Tweener.addTween(this, 
				{
					alpha: .7
					, time:.5
					, delay:0
					, transition:"easeinoutexpo"
				});
				
			}
			catch(err:Error)
			{
				trace(err);
			}			
		}
		
		function onMouseClickHandler(event:Event) : void
		{	
			this.visible = false;
			try
			{
			//	trace("clickety click mutha chucka");				
			}
			catch(err:Error)
			{
				trace(err);
			}			
		}	
	}
}

