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
	* import bridgeware/drawlogic libs
	*/
	import drawlogic.as3.util.*;
	import drawlogic.as3.game.tileengine.*;
	import drawlogic.as3.game.tileengineService.*;

	/**
	* polygonal labs random number and data structures
	*/
	import de.polygonal.ds.*;
	import de.polygonal.math.*;
	
	/**
	* tweener and tweenerlite
	*/
	import gs.*;
	import caurina.transitions.*;

	public class TileSelect extends Sprite
	{
		private var size:uint = 50;
		private var overSize:uint = 60;
		private var backgroundColor:uint = 0xFFCC00;
		private var overColor:uint = 0xCCFF00;
		private var downColor:uint = 0x00CCFF;

		public function TileSelect()
		{
			draw(size, size, backgroundColor);
			addEventListener(MouseEvent.CLICK, clickHandler);
			addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandler);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
		}

		private function draw(w:uint, h:uint, bgColor:uint):void
		{
			graphics.clear();
			graphics.beginFill(bgColor);
			graphics.drawRect(0, 0, w, h);
			graphics.endFill();
		}

		private function clickHandler(event:MouseEvent):void
		{
			trace("clickHandler");
		}

		private function doubleClickHandler(event:MouseEvent):void
		{
			trace("doubleClickHandler");
		}

		private function mouseDownHandler(event:MouseEvent):void
		{
			trace("mouseDownHandler");
			draw(overSize, overSize, downColor);

			var sprite:Sprite = Sprite(event.target);
			sprite.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			sprite.startDrag();
		}

		private function mouseMoveHandler(event:MouseEvent):void
		{
			trace("mouseMoveHandler");
			event.updateAfterEvent();
		}

		private function mouseOutHandler(event:MouseEvent):void
		{
			trace("mouseOutHandler");
			draw(size, size, backgroundColor);
		}

		private function mouseOverHandler(event:MouseEvent):void
		{
			trace("mouseOverHandler");
			draw(overSize, overSize, overColor);
		}

		private function mouseWheelHandler(event:MouseEvent):void
		{
			trace("mouseWheelHandler delta: " + event.delta);
		}

		private function mouseUpHandler(event:MouseEvent):void
		{
			trace("mouseUpHandler");
			var sprite:Sprite = Sprite(event.target);
			sprite.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			sprite.stopDrag();
			draw(overSize, overSize, overColor);
		}
	}
}