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

	public class TileEngineAppBtnDefault extends MovieClip
	{
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		// this is for global settings and functionality.
		//public static var assetPath:String = "base/assets/";

		public var overState:Boolean = false;
		public var movedOut:Boolean = true;
		
		public var initialX:int = this.x;
		public var initialY:int = this.y;
		
		/**
		* -------------------------------------------------------------------------> NEW
		*/		
		// constructor
		public function TileEngineAppBtnDefault()
		{
			// trace the state
			//trace("Loading TileEngineAppBtnDefault...");
			this.addEventListener(Event.ADDED, onAddedHandler);			
			
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutHandler);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverHandler);
			
			this.addEventListener(TileEngineEvent.STATE_CHANGE, onTileEngineStateChangeHandler);

		}
		/**
		* -------------------------------------------------------------------------> METHODS
		*/		
		// initialize the class
		public function init()
		{
			// trace the state
			//trace("Initializing TileEngineAppBtnDefault...");
			this.useHandCursor = true;
			this.buttonMode = true;

		}		
		/**
		* -------------------------------------------------------------------------> EVENTS
		*/	
		
		function onTileEngineStateChangeHandler(event:TileEngineEvent) : void
		{
			this.y = this.y + 600;
		}	
		
		function onMoveOutDoneHandler()
		{
			overState = false;
			movedOut = true;
		}
		
		function onMoveOverDoneHandler()
		{
			overState = true;
			movedOut = true;
		}
		
		function onAddedHandler(event:Event) : void
		{
			init();
		}	
		
		function onMouseMoveHandler(event:Event) : void
		{
			
		}
		
		function checkOverState()
		{
			
		}
		
		function checkIfOver()
		{
		
		}
		
		function onMouseOverHandler(event:Event) : void
		{	
			if(!overState && movedOut)
			{
				if(TileEngineState.bState == TileEngineState.MODAL)
				{
					/*
					movedOut = false;
					overState = true;
						// move way out in full mode
										// do scroll out
													
					Tweener.addTween(this, {x:this.x +  (10)
						, time:.3, delay:0, transition:"easeinoutexpo"
						});
						
						*/
						
					//Tweener.addTween(this, {_blur_blurX:20, time:.1});
					//Tweener.addTween(this, {_blur_blurX:0, time:.1, delay:0, onComplete:onMoveOverDoneHandler});
					
				}
				else
				{
					/*
					movedOut = false;
					overState = true;
					// move out just a little	
					Tweener.addTween(this, {x:this.x +  (10)
						, time:.3, delay:0, transition:"easeinoutexpo"
						});
						
						*/
					//Tweener.addTween(this, {_blur_blurX:20, time:.1});
					//Tweener.addTween(this, {_blur_blurX:0, time:.1, delay:0, onComplete:onMoveOverDoneHandler});
					
				}
			}
		}
		
		function onMouseOutHandler(event:Event) : void
		{	
			//if(movedOut)
			//{
			
			/*
				movedOut = false;
				overState = false;
					// move way out in full mode
									// do scroll out
				Tweener.addTween(this, {x:initialX
					, time:.5, delay:0, transition:"easeinoutexpo"
					});
					
					*/
					
				//Tweener.addTween(this, {_blur_blurX:20, time:.2});
				//Tweener.addTween(this, {_blur_blurX:0, time:.2, delay:0, onComplete:onMoveOutDoneHandler});

			//}
		}

		function onMouseWheelHandler(event:Event):void
		{	
			
		}

		function onEnterFrameHandler(event:Event):void
		{
			if(TileEngineState.bStateSwitch == TileEngineState.MODAL
					&& TileEngineState.bState != TileEngineState.MODAL)
			{
				TileEngineState.DoStateChange(TileEngineState.MODAL);
			}
			
		}
	}
}