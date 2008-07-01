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
	
	public class TileSquareAsset extends MovieClip
	{		
		public var assetX:Number;
        public var assetY:Number;
        public var assetZ:Number;
        public var assetHeight:Number;
        public var assetRotation:Number;

        public var assetType = "house";
        public var assetCode = "house_01";
        public var assetClass = "drawlogic.as3.game.tileengine.TileSquareAsset";		

		public var container:Sprite = new Sprite();
		public var pictLdr:Loader = new Loader();
		public var pictURL:String = TileEngineAPI.assetPath + assetCode + "/" + assetCode + "_L_512.png";
		public var pictURLReq:URLRequest = new URLRequest(pictURL);		
		
		public function TileSquareAsset() 
		{
			//trace("Loading TileSquareAsset");
			//this.addEventListener( Event.ENTER_FRAME, onEnterFrameEvent );			
			// load default terrain
			this.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
		}
		
		public function loadAsset(assetCode, assetType, assetClass)
		{
			// add image container
			addChild(container);
			pictURL = TileEngineAPI.assetPath + assetCode + "/" + assetCode + "_L_512.png";						
			pictLdr.load(pictURLReq);			
			pictLdr.contentLoaderInfo.addEventListener(Event.COMPLETE, imgLoadedHandler); 
		}
		
		function imgLoadedHandler(e:Event):void 
		{
			container.addChild(pictLdr.content); 
		}
		
		function onMouseClickHandler(event:Event):void
		{
			trace(assetCode);
			trace(this.name);
		}
	
		function onEnterFrameHandler(event:Event):void
		{
			
		}		
	}
}
