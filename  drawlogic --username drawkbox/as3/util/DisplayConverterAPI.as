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
package drawlogic.as3.util
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
	 * Provides convenience conversion methods for Sprites and Bitmaps.
	 * 
	 * Open source. Free to use. Licensed under the MIT License.
	 * 
	 * @author	Nate Chatellier
	 * @see		http://blog.natejc.com
	 */
	public class DisplayConverterAPI
	{		
		/**
		 * Constructs the DisplayConverter object.
		 */
		public function DisplayConverterAPI()
		{
			trace("DisplayConverterAPI is a static class and should not be instantiated");
		} 		

		/**
		 * Converts a Bitmap to a Sprite.
		 *
		 * @param	bitmap		The Bitmap that should be converted.
		 * @param	smoothing	Whether or not the bitmap is smoothed when scaled.
		 * @return				The converted Sprite object.
		 * 
		 * @see					http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/flash/display/Bitmap.html#smoothing
		 */
		public static function bitmapToSprite(bitmap:Bitmap, smoothing:Boolean = false):Sprite
		{
			var sprite:Sprite = new Sprite();
			sprite.addChild( new Bitmap(bitmap.bitmapData.clone(), "auto", smoothing) );
			return sprite;
		} 
		
		/**
		 * Converts a Sprite to a Bitmap.
		 *
		 * @param	sprite		The Sprite that should be converted.
		 * @param	smoothing	Whether or not the bitmap is smoothed when scaled.
		 * @return				The converted Bitmap object.
		 * 
		 * @see					http://livedocs.adobe.com/flash/9.0/ActionScriptLangRefV3/flash/display/BitmapData.html#draw()
		 */
		public static function spriteToBitmap(sprite:Sprite, smoothing:Boolean = false):Bitmap
		{
			var bitmapData:BitmapData = new BitmapData(sprite.width, sprite.height, true, 0x00FFFFFF);
			bitmapData.draw(sprite);			
			return new Bitmap(bitmapData, "auto", smoothing);			
		} 
	} 
} 

