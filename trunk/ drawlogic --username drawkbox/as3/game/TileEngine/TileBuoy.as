/// -------------------------------------------------------------------
///
/// code draw(n) by Ryan Christensen /s/drawk/cab/
/// drawk.com / drawlogic.com / bridgeware.com/lab/
/// drawlogic.as3.game.tileengine
/// 
/// -------------------------------------------------------------------
//
package drawlogic.as3.game.tileengine
{
	import flash.display.*;
	import flash.errors.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.media.*;
	import flash.text.TextField;
	import flash.ui.*;
	import flash.utils.*;
	import flash.xml.*;

	// import bridgeware/drawlogic libs
	import drawlogic.as3.util.*;

	import de.polygonal.ds.*;
	import de.polygonal.math.*;

	public class TileBuoy extends MovieClip
	{
		public function TileBuoy()
		{
			this.addEventListener(MouseEvent.CLICK,onMouseClickEvent);
			this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDownEvent);
			this.addEventListener(MouseEvent.MOUSE_UP,onMouseUpEvent);
			this.addEventListener(Event.ADDED,onAddedEvent);
		}
		
		public function onAddedEvent(event:Event) : void
		{
						//trace(tilePosition.currentX);
			//trace(tilePosition.currentY);
			for(var n:int=0;n<this.numChildren;n++)
			{
				//trace(this.getChildAt(n));
				//trace(getQualifiedClassName(this.getChildAt(n)));
				if(getQualifiedClassName(this.getChildAt(n)).indexOf("TextField") > -1)
				{
					//trace("ITS A TEXT BOXXX");
					var text:TextField = this.getChildAt(n);
					text.htmlText = "<b>x:<b/> " + this.x + "<br><b>y:<b/> " + this.y ;
				}
			}
		}
		
		public function onMouseDownEvent(event:Event) : void
		{
			//trace(tilePosition.currentX);
			//trace(tilePosition.currentY);
			//this.startDrag();
		}
		
		public function onMouseUpEvent(event:Event) : void
		{
			//this.stopDrag();
		}
		
		public function onMouseClickEvent(event:Event) : void
		{
trace("x: " + this.x);
trace("y: " + this.y);


		}
		
		public function onEnterFrameEvent(event:Event):void
		{
			//trace(glo.bal.stage.mouseX);
			
			
			
		}
	}
}