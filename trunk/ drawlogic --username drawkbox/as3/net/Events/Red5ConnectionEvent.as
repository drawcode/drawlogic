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

package drawlogic.as3.net.events
{

	import flash.events.Event;
	
	public class Red5ConnectionEvent extends Event
	{
		public static var RED5_SUCCESS:String = "red5success";
		public static var RED5_FAILED:String = "red5failed";
		public static var RED5_CLOSED:String = "red5closed";
		public static var RED5_REJECTED:String = "red5rejected";
		public static var RED5_INVALIDAPP:String = "red5invalidApp";
		public static var RED5_APPSHUTDOWN:String = "red5appShutdown";
		public static var RED5_SECURITYERROR:String = "red5securityError";
		public static var RED5_DISCONNECTED:String = "red5disconnected";
		
		public var code:String = "";
		public function Red5ConnectionEvent(type:String, bubbles:Boolean, cancelable:Boolean, p_code:String=""):void
		{
			super(type, bubbles, cancelable);
			code = p_code;
		}	
	}
}
