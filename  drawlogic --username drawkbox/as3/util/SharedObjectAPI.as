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
	import flash.display.*;
	import flash.errors.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.SharedObject;
	
	import drawlogic.as3.util.OutputPanel;	// inline output panel
	
	// Facade API for shared objects local and remote
    public class SharedObjectAPI 
	{		
		public function SharedObjectAPI()
		{
			OutputPanel.trace("SharedObjectAPI is a static object for performance, only call directly with no instance ShareObjectAPI.method()");
		} 			
		
		public static function setLocalSoValue
		(
			so:SharedObject
			, propName:String
			, propValue:*
		)
		{			
			so.data[propName]=propValue;
			so.setProperty(propName,propValue);
			so.setDirty(propName);
			
			OutputPanel.trace("so.data[" + propName + "]:"+so.data[propName]);
			OutputPanel.trace("so:"+so);
		}
		
		public static function getLocalSoValue
		(
			so:SharedObject
			, propName:String
		)
		{			
			try {
				return so.data[propName];				
			}catch (e:Error) {
				return "";				
			}
		}
		
		public static function setRemoteSoValue
		(
			so:SharedObject
			, propName:String
			, propValue:*
		)
		{			
			so.data[propName]=propValue;
			so.setProperty(propName,propValue);
			so.setDirty(propName);
			
			OutputPanel.trace("so.data[" + propName + "]:"+so.data[propName]);
			OutputPanel.trace("so:"+so);
		}
		
		public static function getRemoteSoValue
		(
			so:SharedObject
			, propName:String
		)
		{			
			try {
				return so.data[propName];				
			}catch (e:Error) {
				return "";				
			}
		}
		
		
		
    } 
}