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
	public class TileEngineModalLoader extends MovieClip
	{		
		var request:URLRequest;
		var loader:Loader;
		public var percentLoaded:Number = 0;
		public var isLoaded:Boolean = false;
		
		public var assetHeight:int = 0;
		public var assetWidth:int = 0;
		
		public function TileEngineModalLoader(modalPath:String) 
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
			
			this.loadAsset(modalPath);
		}	
		
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
			}
			catch (error:SecurityError) 
			{
				trace("SecurityError: ",error);
			}
		}
		
		public function loadZipAsset(modalPath:String)
		{
			request = new URLRequest(modalPath);
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
		
					
		function ioErrorHandler(event:IOErrorEvent):void 
		{
			trace("IOErrorEvent: ",event);
		}
		
		function onMouseDownHandler(event:Event):void
		{
			//trace(event.shiftKey);
			//if(!event.shiftKey && !event.altKey && !event.ctrlKey)
				//this.startDrag();
		}
		
		function onMouseUpHandler(event:Event):void
		{
			//this.stopDrag();
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
			trace("Loading: "+percentLoaded+"%");
		}
		function loadCompleteHandler(event:Event):void 
		{
			trace("Complete");
			isLoaded = true;
			
			addChild(loader);
			
			assetWidth = this.width;
			assetHeight = this.height;
			
			TileEngineAppAPI.adjustStage();
		}


		
	}	
}




