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
 * */  adapted from a senocular post www.senocular.com
package drawlogic.as3.util 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.GradientType;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import fl.controls.UIScrollBar;
	import fl.controls.ScrollBarDirection;
	
	/**
	 * Creates a pseudo Output panel in a publish
	 * swf for displaying trace statements.
	 * For the output panel to capture trace 
	 * statements, you must use Output.trace()
	 * and add an instance to the stage:
	 * stage.addChild(new OutputPanel());
	 *
	 */
	public class OutputPanel extends Sprite 
	{
		private var txtOutput:TextField;
		private var sbVertical:UIScrollBar;
		private var titleBar:Sprite;
		private static var instance:OutputPanel;
		private static var autoExpand:Boolean = false;
		private static var maxLength:int = 1000;
		
		public function OutputPanel(outputHeight:uint = 200)
		{
			if (instance && instance.parent){
				instance.parent.removeChild(this);
			}
			
			instance = this;
			var tf:TextField = newOutputField(outputHeight);
			
			addChild(tf);
			//addChild(newOutputFieldScrollbar(tf));
			addChild(newTitleBar());
			
			addEventListener(Event.ADDED, added);
			addEventListener(Event.REMOVED, removed);
		}
		
		// public methods
		public static function trace(str:*):void 
		{
			if (!instance) return;
			instance.txtOutput.appendText(str+"\n");
			if (instance.txtOutput.length > maxLength) 
			{
				instance.txtOutput.text = instance.txtOutput.text.slice(-maxLength);
			}
			instance.txtOutput.scrollV = instance.txtOutput.maxScrollV;
			if (autoExpand && !instance.txtOutput.visible) instance.toggleCollapse();
			
			//instance.sbVertical.update();
		}
		public static function clear():void {
			if (!instance) return;
			instance.txtOutput.text = "";
		}
		
		private function newOutputFieldScrollbar(tf:TextField) : UIScrollBar
		{
			sbVertical = new UIScrollBar();
			sbVertical.direction = ScrollBarDirection.VERTICAL;
			sbVertical.move(tf.x + tf.width, tf.y);
			sbVertical.height = tf.height;
			sbVertical.scrollTarget = tf;
			return sbVertical;
		}
		
		private function newOutputField(outputHeight:uint):TextField 
		{
			txtOutput = new TextField();
			txtOutput.type = TextFieldType.INPUT;
			txtOutput.border = true;
			txtOutput.borderColor = 0;
			txtOutput.background = true;
			txtOutput.backgroundColor = 0xFFFFFF;
			txtOutput.height = outputHeight;
			var format:TextFormat = txtOutput.getTextFormat();
			format.font = "Lucida Sans Unicode";
			format.size = "10";
			txtOutput.setTextFormat(format);
			txtOutput.defaultTextFormat = format;			
			return txtOutput;
		}
		private function newTitleBar():Sprite 
		{
			var barGraphics:Shape = new Shape();
			barGraphics.name = "bar";
			var colors:Array = new Array(0xDFDFDF, 0xFFFFFF, 0xEFEFEF);
			var alphas:Array = new Array(1, 1, 1);
			var ratios:Array = new Array(0, 50, 255);
			var gradientMatrix:Matrix = new Matrix();
			gradientMatrix.createGradientBox(18, 18, Math.PI/2, 0, 0);
			barGraphics.graphics.lineStyle(0);
			barGraphics.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, gradientMatrix);
			barGraphics.graphics.drawRect(0, 0, 18, 18);
			
			var barLabel:TextField = new TextField();
			barLabel.autoSize = TextFieldAutoSize.LEFT;
			barLabel.selectable = false;
			barLabel.text = "Debug Output Panel";
			var format:TextFormat = barLabel.getTextFormat();
			format.font = "Lucida Sans Unicode";
			format.size = "10";
			barLabel.setTextFormat(format);
			
			titleBar = new Sprite();
			titleBar.addChild(barGraphics);
			titleBar.addChild(barLabel);
			
			return titleBar;
		}
		
		// Event handlers
		private function added(evt:Event):void 
		{
			stage.addEventListener(Event.RESIZE, fitToStage);
			titleBar.addEventListener(MouseEvent.CLICK, toggleCollapse);
			fitToStage();
			toggleCollapse();
		}
		private function removed(evt:Event):void 
		{
			stage.removeEventListener(Event.RESIZE, fitToStage);
			titleBar.removeEventListener(MouseEvent.CLICK, toggleCollapse);
		}
		private function toggleCollapse(evt:Event = null):void 
		{
			if (!instance) return;
			txtOutput.visible = !txtOutput.visible;
			
			fitToStage(evt);
			//sbVertical.visible = !sbVertical.visible;
		}
		private function fitToStage(evt:Event = null):void 
		{
			if (!stage) return;
			txtOutput.width = stage.stageWidth;
			txtOutput.y = stage.stageHeight - txtOutput.height;
			
			//sbVertical.x = stage.stageWidth - sbVertical.width;
			//sbVertical.y = stage.stageHeight - txtOutput.height;

			
			titleBar.y = (txtOutput.visible) ? txtOutput.y - titleBar.height : stage.stageHeight - titleBar.height;
			titleBar.getChildByName("bar").width = stage.stageWidth;
		}
	}
}