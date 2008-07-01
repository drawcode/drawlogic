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

	public class TileEngineAppItemImage extends TemplateBaseItem
	{
		public var bitmap:Bitmap;
		
		public function TileEngineAppItemImage()
		{
			trace("drawlogic.as3.game.tileengineapp.TileEngineAppItemImage Loaded...");
			super();
			loadBitmap("STAPLER.jpg");
			//this.addEventHandler(MouseEvent.MOUSE_DOWN, onMouseOverHandler);
		
		}
		
		private function loadBitmap(file:String):void
		{
			var request:URLRequest = new URLRequest(file);
			var loader:Loader = new Loader();
		 
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadBitmapCompleteHandler);
			try {
				loader.load(request);
			} catch (error:Error) {
				//log.error("Unable to load URL", error);
			}
		}
		
		//public function onMouseOverHandler(e:Event)
		//{
			
		//}
 
		private function loadBitmapCompleteHandler(e:Event):void
		{
			Redraw(e);
		}
		
		public function Redraw(e:Event)
		{
			var loader:Loader = Loader(e.target.loader);
			bitmap = Bitmap(loader.content);
			this.addChild(bitmap);
			
			var mBound:Sprite = new Sprite();
			mBound.graphics.beginFill(0xff0000,0);
			mBound.graphics.lineStyle(2, 0x000000, .5);
			mBound.graphics.drawRect(bitmap.x, bitmap.y, bitmap.x+bitmap.width, bitmap.y+bitmap.height);
			mBound.graphics.endFill();

			var mBoundLine:Sprite = new Sprite();
			mBoundLine.graphics.lineTo((bitmap.x+bitmap.width)/2, bitmap.y);
			mBoundLine.graphics.lineTo((bitmap.x+bitmap.width)/2, (bitmap.y-200));		
			
			
			this.addChildAt(mBound,0);
			this.addChildAt(mBoundLine,0);
			
			
			

		}		

	}
}
