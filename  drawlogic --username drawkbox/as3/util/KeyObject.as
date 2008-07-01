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
	
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	/**
	 * The KeyObject class recreates functionality of
	 * Key.isDown of ActionScript 1 and 2
	 *
	 * Usage:
	 * var key:KeyObject = new KeyObject(stage);
	 * if (key.isDown(key.LEFT)) { ... }
	 */
	dynamic public class KeyObject extends Proxy 
	{
		
		private static var stage:Stage;
		private static var keysDown:Object;
		
		public function KeyObject(stage:Stage) 
		{
			construct(stage);
		}
		
		public function construct(stage:Stage):void 
		{
			KeyObject.stage = stage;
			keysDown = new Object();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
		}
		
		flash_proxy override function getProperty(name:*):* 
		{
			return (name in Keyboard) ? Keyboard[name] : -1;
		}
		
		public function isDown(keyCode:uint):Boolean 
		{
			return Boolean(keyCode in keysDown);
		}
		
		public function deconstruct():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyReleased);
			keysDown = new Object();
			KeyObject.stage = null;
		}
		
		private function keyPressed(evt:KeyboardEvent):void 
		{
			keysDown[evt.keyCode] = true;
		}
		
		private function keyReleased(evt:KeyboardEvent):void 
		{
			delete keysDown[evt.keyCode];
		}
	}
}