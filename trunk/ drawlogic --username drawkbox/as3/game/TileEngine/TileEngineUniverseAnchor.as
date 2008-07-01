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
	
	public class TileEngineUniverseAnchor extends MovieClip
	{			
		public var tileX:int = 0;
		public var tileY:int = 0;
		public var tileName:String = "UNIVERSE";
		
		public var tileAssetsArray:Array = new Array();
		
		public function TileEngineUniverseAnchor() 
		{
			//trace("Loading TileSquareAnchor");
			//this.addEventListener( Event.ENTER_FRAME, onEnterFrameHandler );
			//this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP,onMouseUpHandler);
			
			// load default terrain
		}	
		function onMouseDownHandler(event:Event):void
		{
			//trace(event.shiftKey);
			if(!event.shiftKey && !event.altKey && !event.ctrlKey)
				this.startDrag();				
			//trace(event);			
		}
		function onMouseUpHandler(event:Event):void
		{
			this.stopDrag();
		}
		
		function onMouseMoveHandler(event:Event):void
		{
			//trace("arranging....");
			//if(event.shiftKey && !event.altKey && !event.ctrlKey)
			//arrange();
		}	
		
		function arrange():void 
		{
			 tileAssetsArray = new Array();
			for(var b=0;b<this.numChildren;b++)
			{
				tileAssetsArray.push(this.getChildAt(b));
			}
			tileAssetsArray.sortOn("y", Array.NUMERIC);
			var i:int = tileAssetsArray.length;
			while(i--){
				if (getChildAt(i) != tileAssetsArray[i]) {
					this.setChildIndex(tileAssetsArray[i], i);
				}
			}
		}
	}
}
