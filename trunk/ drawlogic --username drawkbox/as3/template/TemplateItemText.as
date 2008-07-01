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

	public class TemplateItemText extends TemplateBaseItem
	{
		public var fontName:String = "Verdana";
		public var fontSize:int = 12;
		
		var txt:TextField = new TextField();

		public function TemplateItemText()
		{
			trace("drawlogic.as3.template.TemplateItemText Loaded...");
			LoadTextBox();
		}
		
		public function LoadTextBox()
		{
			
			var f:TextFormat = new TextFormat(fontName, fontSize,0);
			txt.alwaysShowSelection = true;
			txt.defaultTextFormat = f;
			//txt.embedFonts = true;     
			//txt.rotation = 15; 
			txt.type = TextFieldType.INPUT;
			txt.multiline = true;
			txt.width = 200;
			txt.height = 50;
			txt.selectable = true;
			txt.doubleClickEnabled = true;
			txt.restrict = false;
			txt.autoSize = TextFieldAutoSize.LEFT;
			// to demonstrate the embed worked     
			txt.text = "[FILL IN]";     
			this.addChild(txt); 
		}
		
	}
}
