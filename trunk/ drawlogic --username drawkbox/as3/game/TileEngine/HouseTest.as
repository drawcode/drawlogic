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
	import flash.ui.*;
	import flash.utils.*;
	import flash.xml.*;

	// import bridgeware/drawlogic libs
	import drawlogic.as3.util.*;
	
	public class HouseTest extends MovieClip
	{	
		public var assetSquareX:int = 0;
		public var assetSquareY:int = 0;
		public var assetSquareName:String = "ASSET";
		
		public function  HouseTest() 
		{
			//trace("Loading TileSquareAsset");
			//this.addEventListener( Event.ENTER_FRAME, onEnterFrameEvent );
			this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDownEvent);
			this.addEventListener(MouseEvent.MOUSE_UP,onMouseUpEvent);
			
			// load default terrain
		}	
		function onMouseDownEvent(event:Event):void
		{
			if(event.shiftKey && !event.altKey && !event.ctrlKey)
				this.startDrag();
				
			//trace(event);
			
		}
		function onMouseUpEvent(event:Event):void
		{
			this.stopDrag();
		}
		
		function onEnterFrameEvent(event:Event):void
		{
			
		}
		
	}
}
