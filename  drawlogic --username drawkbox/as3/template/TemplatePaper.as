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
	
	import drawlogic.as3.util.*;

	public class TemplatePaper extends MovieClip
	{
		public var pageWidth:int = this.width;
		public var pageHeight:int = this.height;
		public var pageX:int = this.x;
		public var pageY:int = this.y;
		
		public function TemplatePaper()
		{
			trace("drawlogic.as3.template.TemplatePaper Loaded...");
			this.addEventListener(MouseEvent.CLICK, onMouseClickedEvent);
		}
		
		public function onMouseClickedEvent(event:Event)
		{
			if(glo.bal.filled)
			{
				/*var mainEdit:Class 
					= Class(getDefinitionByName("drawlogic.as3.template.TemplateItemText"));
				if(mainEdit)
				{
					var mainEdit2:MovieClip = new mainEdit();
					mainEdit2.x = this.mouseX;
					mainEdit2.y = this.mouseY;
					this.addChild(mainEdit2);
					glo.bal.filled = false;
					glo.bal.filledItem = this;
					glo.bal.filledItemName = this.name;
				}*/
				var mainEdit:Class 
					= Class(getDefinitionByName("drawlogic.as3.template.TemplateItemImage"));
				if(mainEdit)
				{
					var mainEdit2:MovieClip = new mainEdit();
					mainEdit2.x = this.mouseX;
					mainEdit2.y = this.mouseY;
					this.addChild(mainEdit2);
					glo.bal.filled = false;
					glo.bal.filledItem = this;
					glo.bal.filledItemName = this.name;
					trace(glo.bal.filled );
					trace(glo.bal.filledItem );
					trace(glo.bal.filledItemName );
				}
			}
		}
		

	}
}
