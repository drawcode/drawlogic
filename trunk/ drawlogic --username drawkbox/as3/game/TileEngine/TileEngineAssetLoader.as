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
	import drawlogic.as3.game.tileengineapp.*;	
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
	
	/**
	* This class loads in the assets at different levels or it loads in the custom 
	* class and objects.
	*/
	public class TileEngineAssetLoader extends MovieClip
	{		
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		
		var request:URLRequest;
		var loader:Loader;
		
		public var percentLoaded:Number = 0;
		public var isLoaded:Boolean = false;
		
		public var assetHeight:Number = 0;
		public var assetWidth:Number = 0;
		
		public var assetX:Number = 0;
		public var assetY:Number = 0;
		public var assetZ:Number = 0;
		
		public var assetPath:String = "";
		
		public var movieClip:MovieClip;
		public var level:int = 10;
		
		public var tickTimer:Timer;
		
		/**
		* -------------------------------------------------------------------------> CONSTRUCTOR
		*/
		
		/**
		* TileEngineAssetLoader loads in the tile engine individual assets.
		* @param	assetPath
		*/
		public function TileEngineAssetLoader(assetPath:String, level:int) 
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
			this.assetPath = assetPath;
			this.level = level;
			this.loadAsset(assetPath);
		}	

		
		
		/**
		* -------------------------------------------------------------------------> METHODS
		*/
		
		/**
		* loadAsset loads in the asset
		* @param	assetPath
		*/
		public function loadAsset(assetPath:String)
		{
			request = new URLRequest(assetPath);
			loader = new Loader();
			
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			//loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);			
			
			try 
			{
				loader.load(request);
				
				tickTimer = new Timer(500);
				tickTimer.addEventListener(TimerEvent.TIMER, onTickHandler);
				tickTimer.start();
			}
			catch (error:SecurityError) 
			{
				trace("SecurityError: ",error);
			}
		}
		
		public function loadZipAsset(assetPath:String)
		{
			request = new URLRequest(assetPath);
			loader = new Loader();
			
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			//loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			try 
			{
				loader.load(request);
			}
			catch (error:SecurityError) 
			{
				trace("SecurityError: ",error);
			}	
		}

		
		/**
		* -------------------------------------------------------------------------> EVENTS
		*/		
		
		// Function will be called every 500 milliseconds
		function onTickHandler(eventArgs:TimerEvent)
		{
			
			//trace("Timer fired " + tickTimer.currentCount + TileEngineAppAPI.tileEngineAppBackground + " times.");
			if(!this.hitTestObject(TileEngineAppAPI.tileEngineAppBackground))
			{
				if(this.numChildren > 0)
				{
					tickTimer.stop();
					this.removeChildAt(0);
					tickTimer = null;
				}
			}
			
		}
		
		
					
		function ioErrorHandler(event:IOErrorEvent):void 
		{
			trace("IOErrorEvent: ",event);
		}
		
		function onMouseDownHandler(event:Event):void
		{
			//trace(event.shiftKey);
			if(!event.shiftKey && !event.altKey && !event.ctrlKey)
				this.startDrag();
		}
		
		function onMouseUpHandler(event:Event):void
		{
			this.stopDrag();
		}
		
		function onMouseMoveHandler(event:Event):void
		{
			//trace("arranging....");
			//if(event.shiftKey && !event.altKey && !event.ctrlKey)
			//arrange();
		}
		
		function loadProgressHandler(event:ProgressEvent):void 
		{
			var percentLoaded:Number = event.bytesLoaded/event.bytesTotal;
			percentLoaded = Math.round(percentLoaded * 100);
			//trace("Loading: "+this.assetPath+"-"+percentLoaded+"%");
		}
		function loadCompleteHandler(event:Event):void 
		{
			//trace("Complete");
			isLoaded = true;
			
			
			
			assetWidth = this.width;
			assetHeight = this.height;
			
			movieClip = loader.content;	
			
			var modifier:Number = 1;
			
			switch(level)
			{
				case 10:
				modifier = 1;
				break;
				
				case 20:
				modifier = .49;
				break;
				
				case 30:
				modifier = .32;
				break;
				
				case 40:
				modifier = .24;
				break;
				
				case 5:
				modifier = 2;
				break;
			}
			
			loader.width = loader.width * modifier;
			loader.height = loader.height * modifier;
			
			
			addChild(loader);
			commitMoveToPosition();			
		
			//TileEngineAPI.adjustStage();
		}
		
		public function moveToPosition(x:Number, y:Number)
		{		
			assetX = x;
			assetY = y;
			
		}
		
	
		public function commitMoveToPosition()
		{
			try
			{
				loader.x = assetX;
				loader.y = assetY;
				movieClip.x = assetX;
				movieClip.y = assetY;
			}
			catch(err:Error)
			{
				trace("Error on setting position:", assetX,assetY,err);
			}
		}
		
		public function moveToPosition3D(x:Number, y:Number, z:Number)
		{
			
		}


		
	}	
}




