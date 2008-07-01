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

  import flash.events.EventDispatcher;
  import flash.display.Shape;
  import flash.events.Event;

  // miniest tween engine you ever have seen...
  public class Twn extends flash.events.EventDispatcher 
  {

    private var _object:Object;
    private var _property:String;
    private var _start:Number;
    private var _stop:Number;
    private var _duration:Number;
    private var _shape:Shape;
    private var _count:uint;
	
	public static TWN_COMPLETE:String = "twnComplete";

    public function twn(object:Object, property:String, start:Number, stop:Number, duration:Number) 
	{
    	_object = object;
    	_property = property;
    	_start = start;
    	_stop = stop;
    	_duration = duration;
    	_shape = new Shape();
    }
    
    public function start():void 
	{
    	_count = 0;
    	_shape.addEventListener(Event.ENTER_FRAME, onChange);
    }
    
    private function onChange(event:Event):void 
	{
    	_count++;
    	_object[_property] = _start + (_stop - _start) / _duration * _count;
    	_count++;
    	if(_count >= _duration) {
    		_shape.removeEventListener(Event.ENTER_FRAME, onChange);
    		dispatchEvent(new Event(Twn.TWN_COMPLETE));
    	}
    }
	
  }
  
}