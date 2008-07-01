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
package drawlogic.as3.template
{
	import flash.accessibility.*;
	import flash.display.*;
	import flash.events.*;
	import flash.errors.*;
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

	public class TemplateButtonAddText extends MovieClip
	{
		public function TemplateButtonAddText()
		{
			trace("drawlogic.as3.template.TemplateButtonAddText Loaded...");			
			//this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveEvent);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownEvent);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUpEvent);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverEvent);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutEvent);
		}
		
		//public function onMouseMoveEvent(event:Event)
		//{
			//trace("Moving mouse over me: " + this.name);
		
		//}
		
		public function onMouseOverEvent(event:Event)
		{
			this.alpha = .5;
		}
		
		public function onMouseOutEvent(event:Event)
		{
			this.alpha = 1;	
		}
		
		public function onMouseDownEvent(event:Event)
		{
			//trace("Moving mouse over me: " + this.name);
			trace(this.numChildren);
		
		}
		
		public function onMouseUpEvent(event:Event)
		{
			//trace("Moving mouse over me: " + this.name);
		
		}
	
	
		
	}
}
