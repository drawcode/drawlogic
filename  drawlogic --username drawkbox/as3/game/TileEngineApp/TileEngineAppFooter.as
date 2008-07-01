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

	public class TileEngineAppFooter extends MovieClip
	{
		public var request:URLRequest;
		public var loader:Loader;
		public var percentLoaded:Number = 0;
		public var isLoaded:Boolean = false;
		public static var tileEngineAppFooterNavBackground:TileEngineAppFooterNavBackground;
		public static var tileEngineAppFooterBackground:TileEngineAppFooterBackground;
		
		
		public function TileEngineAppFooter()
		{
			trace("drawlogic.as3.game.tileengineapp.TileEngineAppFooter Loaded...");
			loadAsset("base/ui/TileEngineFooterNav.swf");
		}
				
		public function loadAsset(assetPath:String):void
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
					
		function ioErrorHandler(event:IOErrorEvent):void 
		{
			trace("IOErrorEvent: ",event);
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
			
			setGlobalObjects();
		}		
		
		
		public function setGlobalObjects():void
		{
			//DisplayInfo.traceDisplayList(this);
			try
			{
				// set world mask
				TileEngineAppFooter.tileEngineAppFooterBackground
					= DisplayInfo.getObjectByQualifiedClassName(loader
					, "drawlogic.as3.game.tileengineapp.TileEngineAppFooterBackground") as TileEngineAppFooterBackground;
				trace("tileEngineAppFooterBackground: " + TileEngineAppFooter.tileEngineAppFooterBackground);
				
			var gm:DisplayObject 
					= DisplayInfo.getObjectByQualifiedClassName(this
					, "drawlogic.as3.game.tileengineapp.TileEngineAppFooterBackground") as DisplayObject;
				trace("DisplayObject: " + gm);
				
			}
			catch(err:Error)
			{
				trace("ERROR tileEngineAppFooterBackground: ", err);
			}
			
			try
			{
				// set world mask
				TileEngineAppFooter.tileEngineAppFooterNavBackground 
					= DisplayInfo.getObjectByQualifiedClassName(loader
					, "drawlogic.as3.game.tileengineapp.TileEngineAppFooterNavBackground") as TileEngineAppFooterNavBackground;
				trace("tileEngineAppFooterNavBackground: " + TileEngineAppFooter.tileEngineAppFooterNavBackground);
			}
			catch(err:Error)
			{
				trace("ERROR tileEngineAppFooterNavBackground: ", err);
			}
		}
	}
}

