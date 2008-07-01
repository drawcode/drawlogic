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
package drawlogic.as3.game.tileengineapp
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
	
	public class TileEngineAppAPI extends MovieClip
	{
		/**
		* -------------------------------------------------------------------------> VARS
		*/		
		
		//public var stage:Stage;
		private static var instance:TileEngineAppAPI;
		
		// this is for global settings and functionality.
		public static var assetPath:String = "base/assets/";
		public static var modalPath:String = "base/microsites/";
		
		public static var sheet:StyleSheet = new StyleSheet();
		
	// current viewable assets loaded
		public static var selectedItemsArray:Array = new Array();

		// main level holder
		public static var tileLevelsArray:Array = new Array();

		// levels holder for individual levels
		public static var tileLevelsObjectArray:Array = new Array();
		
		// object anchors
		public static var tileEngineUniverseAnchor:TileEngineUniverseAnchor = new TileEngineUniverseAnchor();	
		public static var tileEngineModalAnchor:TileEngineModalAnchor = new TileEngineModalAnchor();
		public static var tileEngineCalloutAnchor:TileEngineCalloutAnchor = new TileEngineCalloutAnchor();
		public static var tileEngineWorldMask:TileEngineWorldMask = new TileEngineWorldMask();
		public static var tileEngineNavigation:TileEngineNavigation = new TileEngineNavigation();
		public static var tileEngineAppCover:TileEngineAppCover = new TileEngineAppCover();
		public static var tileEngineAppFooter:TileEngineAppFooter = new TileEngineAppFooter();
		public static var tileEngineAppBackground:TileEngineAppBackground = new TileEngineAppBackground();
		
		//engine state
		public static var tileEngineState:String = TileEngineState.MAP;
		
		// loaders
		public static var tileAsset:TileEngineAssetLoader;
		public static var tileTerrain:TileEngineTerrainLoader;
		public static var tileModal:TileEngineModalLoader;
		public static var tileCallout:TileEngineCalloutLoader;
		
		// key tracking
		public static var keyRight:Boolean = false;
		public static var keyLeft:Boolean = false;
		public static var keyUp:Boolean = false;
		public static var keyDown:Boolean = false;
		
		public static var keyLogger:Array = new Array();
		
		// globals
		public static var HEADER_HEIGHT:int = 0;
		public static var FOOTER_HEIGHT:int = 55;
		public static var MIN_VIEWABLE_HEIGHT:int = 700;
		public static var MAX_VIEWABLE_HEIGHT:int = 900;

		public static var ORIGINAL_NAV_HEIGHT = 0;
		public static var ORIGINAL_NAV_WIDTH = 0;

		public static var finalScaleAmount:Number = 0;

		
		/**
		* -------------------------------------------------------------------------> NEW
		*/		
		// this is the main tile engine 
		public function TileEngineAppAPI()
		{
			// trace the state
			//tracer("Loading TileEngineAppAPI...");
			//initEngine();
			
			tracer("LOGGEDINisLoggedIn:" + TileEngineAppUserState.isLoggedIn);
			tracer("LOGGEDIN:" + TileEngineAppUserState.getUserLoggedIn());
			
			TileEngineAppUserState.setUserLoggedOut();
			tracer("LOGGEDINisLoggedIn:" + TileEngineAppUserState.isLoggedIn);
			tracer("LOGGEDIN:" + TileEngineAppUserState.getUserLoggedIn());
			
			TileEngineAppUserState.setUserLoggedIn(true);
			tracer("LOGGEDINisLoggedIn:" + TileEngineAppUserState.isLoggedIn);
			tracer("LOGGEDIN:" + TileEngineAppUserState.getUserLoggedIn());
			
			instance = this;
		}

		/**
		* -------------------------------------------------------------------------> METHODS
		*/
		/**
		* Initializes the engine...
		*/
		public function initEngine(): void
		{
			
			//this.addEventListener(Event.ENTER_FRAME, onEnterFrameEvent);
			glo.bal.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveHandler);			
			glo.bal.stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
			glo.bal.stage.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
			
			glo.bal.stage.addEventListener(Event.ENTER_FRAME, onEnterFrameHandler);
			glo.bal.stage.addEventListener(Event.RESIZE, onResizeHandler);
			
			glo.bal.stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDownHandler );
			glo.bal.stage.addEventListener( KeyboardEvent.KEY_UP, onKeyUpHandler );
			
			try
			{
				glo.bal.stage.addChild(new OutputPanel(200));
			}
			catch(error:Error)
			{
				tracer(error);
			}
			//tracer("Loading TileEngineAPITileEngineAPI...");

			// set levels in their positions/order
			try
			{
				setLevels();
			}
			catch(error:Error)
			{
				tracer("setLevels() error:" +  error);
			}

			// print levels
			//tracer("Levels:" + tileLevelsArray);

			// load up an array in each level to be filled later
			//for (var i:String in tileLevelsArray)
			//{
				//var arrNew:Array = new Array();
				//tileLevelsObjectArray.push(arrNew);//
			//}		
		
			// test - get asset level (returns array)
			//var assetTile:Array = GetLevel(TileLevels.ASSETS_LEVEL);
			
			// add items to asset level array 
			/**
			for (var o:int=0; o<50; o++)
			{
				var tileAsset:TileSquareAsset = new TileSquareAsset();
				tileAsset.x = (o+1) * 500;
				var arrNew2:Array = new Array();
				arrNew2.push(tileAsset);
				assetTile.push(arrNew2);// 
			}
			*/
			
			try
			{
				setGlobalObjects();
			}
			catch(error:Error)
			{
				tracer("setGlobalObjects() error:" +  error);
			}	
			
			try
			{
				changeState(TileEngineState.EDIT);
			}
			catch(error:Error)
			{
				tracer("changeState() error:" +  error);
			}
		
			try
			{					
				
				for(var v:int=1;v<7;v++)
				{				
					var start:int = 0;
					var incAmount:int = 80;
					var level:int = 20;
					loadAsset("house-01-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-02-LR","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-03-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-04-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-05-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-06-LL","swf",start++*incAmount,incAmount*v,level);
					//loadAsset("house-07-LR","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-08-LR","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-09-LR","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-10-LR","swf",start++*incAmount,incAmount*v,level);	
					loadAsset("house-11-LL","swf",start++*incAmount,incAmount*v,level);	
					loadAsset("house-12-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-13-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-14-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-15-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-16-LR","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-17-LL","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-19-LR","swf",start++*incAmount,incAmount*v,level);
					loadAsset("house-20-LL","swf",start++*incAmount,incAmount*v,level);
					//loadAsset("building-01-LL","swf",start++*incAmount,incAmount*v,level);
				}


				
				
				//loadAsset("map-microsoft-LL");
				//loadAsset("micro-01-LL","swf",100,100,40);
				//loadAsset("micro-01-LL","swf",300,300,30);
				
				

				
				
				// try loading the grass that graphically expands and has a 
				// mind of it's own...
				/*
				TileEngineTerrainLoader
				
				
				
				var _mainTileTerrain:Class = Class(getDefinitionByName("drawlogic.as3.game.tileengine.TileEngineTerrainLoader"));
					if(_mainTileSquareAnchor)
					{
						//if(mainTileWorldAnchor.x> xrr)
						//{
						mainTileAssetBuilding = new _mainTileSquareAnchor();
						mainTileAssetBuilding.x =xrr;
						mainTileAssetBuilding.y = n *500;
						mainTileWorldAnchor.addChild(mainTileAssetBuilding);
						//}
						
					}
*/				
				var tileStartX:int = 1;
				var tileStartY:int = 0;
				var widthC:int = 120;
				for(var n:int = tileStartY;n<2;n++)
				{		
					tileStartY = (widthC/1.48)*n;
					for(g = -tileStartX;g<2;g++)
					{
						loadTerrain("grass-01-LL","swf",(g*widthC)+(widthC/2),tileStartY+(widthC/3),10);
					}				
					for(g = -tileStartX;g<10;g++)
					{
						loadTerrain("grass-01-LL","swf",g*widthC,tileStartY,10);
					}
				}



				//loadModal("micro-about");
				//loadCallout("micro-forums");
			}
			catch(error:Error)
			{
				tracer("tileAsset() error:" +  error);
			}
			
			try
			{
				doContextMenu();	
			}
			catch(error:Error)
			{
				tracer("doContextMenu() error:" +  error);
			}	
			
			adjustStage();
			
			
			
		}
		
		public static function doDebugSetup()
		{
			
		}
		
		public static function updateUrlState()
		{

			tracer("SWFAddress.getValue():" + SWFAddress.getValue());
			tracer("SWFAddress.getParameterNames():" + SWFAddress.getParameterNames());
			tracer("SWFAddress.getPath():" + SWFAddress.getPath());
			tracer("SWFAddress.getQueryString():" + SWFAddress.getQueryString());
			tracer("SWFAddress.getStatus():" + SWFAddress.getStatus());
			tracer("SWFAddress.getTitle():" + SWFAddress.getTitle());
			
		
			//TileEngineAppUrlAPI.	
			
			TileEngineState.DoStateChange(TileEngineState.MODAL);	
			
			
			//TileEngineAppAPI.loadModal("micro-enter");
			//TileEngineAppAPI.loadCallout("micro-enter");
			
			//ExternalInterface.call("alert", arrUrl);
		}

		/**
		* Adjusts the size of the mask that allows the map to display.
		* @return
		*/
		public static function adjustStage() : void
		{
			//tileEngineWorldMask.x = 0 + tileEngineWorldMask.width/2;
			//tileEngineWorldMask.y = 0 + tileEngineWorldMask.height/2;
			try
			{
				tileEngineWorldMask.width = (glo.bal.stage.stageWidth);
				tileEngineWorldMask.y = HEADER_HEIGHT;
				Tweener.addTween(tileEngineWorldMask, 
				{
					height:(glo.bal.stage.stageHeight - FOOTER_HEIGHT - HEADER_HEIGHT)
					, time:.5
					, delay:0
					, transition:"easeinoutexpo"
				});
				
			}
			catch(err:Error)
			{
				tracer(err);
			}
			
			try
			{
				tileEngineAppCover.width = (glo.bal.stage.stageWidth);
				tileEngineAppCover.y = HEADER_HEIGHT;
				Tweener.addTween(tileEngineAppCover, 
				{
					height:(glo.bal.stage.stageHeight - FOOTER_HEIGHT - HEADER_HEIGHT)
					, time:.5
					, delay:0
					, transition:"easeinoutexpo"
				});
				
			}
			catch(err:Error)
			{
				tracer(err);
			}
			
			try
			{
				Tweener.addTween(tileEngineAppCover, 
				{
					alpha: .7
					, time:.5
					, delay:0
					, transition:"easeinoutexpo"
				});
				
				
			
			}
			catch(err:Error)
			{
				tracer(err);
			}

			
			try
			{
				
				var amountWidth:Number  =(glo.bal.stage.stageWidth)/ tileEngineNavigation.width;
				var amountHeight:Number  = (glo.bal.stage.stageHeight-FOOTER_HEIGHT/3)/tileEngineNavigation.height;					
				
			
				if(amountWidth < amountHeight)
				{
					finalScaleAmount = amountWidth;	
				}
				else
				{
					finalScaleAmount = amountHeight;
				}		
				
		
				if(finalScaleAmount >= 1)
				{	
					finalScaleAmount = 1;
					
					if(glo.bal.stage.stageWidth < 800 || glo.bal.stage.stageHeight < 600)
					{
						amountWidth =800/ (glo.bal.stage.stageWidth);
						amountHeight = 600/glo.bal.stage.stageHeight;	
						if(amountWidth < amountHeight)
						{
							finalScaleAmount = amountWidth;	
						}
						else
						{
							finalScaleAmount = amountHeight;
						}	
					}
				}
					
				Tweener.addTween(tileEngineNavigation, 
				{
					scaleX:Number(finalScaleAmount)
					,scaleY:Number(finalScaleAmount)
					, time:.5
					, delay:0
					, transition:"easeinoutexpo"
					,onComplete: onScaleComplete
				});	
			}
			catch(err:Error)
			{
				tracer(err);
			}
			
			try
			{
				tileEngineAppBackground.width = glo.bal.stage.stageWidth;
				tileEngineAppBackground.height = glo.bal.stage.stageHeight;
			}
			catch(err:Error)
			{
				tracer(err);
			}
			
			try
			{
				//tileEngineAppFooter.scaleX = 1.1;
				tileEngineAppFooter.y = glo.bal.stage.stageHeight - FOOTER_HEIGHT;//tileEngineAppCover.height + tileEngineAppCover.y;
				TileEngineAppFooter.tileEngineAppFooterBackground.width = glo.bal.stage.stageWidth;
				TileEngineAppFooter.tileEngineAppFooterNavBackground.width = glo.bal.stage.stageWidth;
				

				/*Tweener.addTween(tileEngineAppFooter, 
				{
					width:glo.bal.stage.stageWidth
					, time:.5
					, delay:0
					, transition:"easeinoutexpo"
					,onComplete: onScaleComplete
				});*/
				
			
				
			}
			catch(err:Error)
			{
				tracer("SIZING ERROR:" + err);
			}
			
			glo.bal.bMaskWidth = tileEngineWorldMask.width;
			
		}		
		
		/**
		* Scale complete call when the adjustment of the interface is complete
		*/
		static function onScaleComplete()
		{
			var ymin = 0;
			ymin = (glo.bal.stage.stageHeight/2 - tileEngineNavigation.height/2 - FOOTER_HEIGHT + HEADER_HEIGHT);
			if(ymin<0)
				ymin=0;
				
				if(tileEngineModalAnchor.numChildren > 0)
				{
				Tweener.addTween(tileEngineNavigation, 
				{
					x:(glo.bal.stage.stageWidth/2 - tileEngineNavigation.width/2)
					,y:ymin
					, time:1
					, delay:0
					, transition:"easeinoutexpo"
				});
				}else{
				Tweener.addTween(tileEngineNavigation, 
				{
					x:20
					,y:20
					, time:1
					, delay:0
					, transition:"easeinoutexpo"
				});
				}
		}
		
		
		/**
		* Loads in an asset into the universe anchor
		* @param	assetName
		* @param	level
		* @return
		*/
		public static function loadAsset(assetName:String,type:String="swf",x:Number=0,y:Number=0,level:int = 10) :void
		{
			try
			{
				tileAsset
					= new TileEngineAssetLoader(assetPath + assetName + "/" + assetName + "_L" + level.toString() + "." + type, level);

					//if(tileEngineUniverseAnchor.numChildren > 0)
					//{
					//	tileEngineUniverseAnchor.removeChildAt(0);
					//}
					tileAsset.moveToPosition(x,y);
					tileEngineUniverseAnchor.addChildAt(tileAsset,0);
					
					//tileAsset.commitMoveToPosition();
			}
			catch(error:Error)
			{
				tracer("loadAsset() error:"+ error);
			}
		}
		
		
		public static function loadTerrain(assetName:String,type:String="swf",x:Number=0,y:Number=0,level:int = 10) :void
		{
			try
			{
				tileTerrain
					= new TileEngineTerrainLoader(assetPath + assetName + "/" + assetName + "_L" + level.toString() + "." + type, level);

					//if(tileEngineUniverseAnchor.numChildren > 0)
					//{
					//	tileEngineUniverseAnchor.removeChildAt(0);
					//}
					tileTerrain.moveToPosition(x,y);
					tileEngineUniverseAnchor.addChildAt(tileTerrain,0);
					
					//tileAsset.commitMoveToPosition();
			}
			catch(error:Error)
			{
				tracer("loadAsset() error:"+ error);
			}
		}		
		
		public static function tracer(obj:*)
		{
			//tracer(Panel.autoExpand = false;
			OutputPanel.trace(obj);
			//txtDebug.styleSheet = sheet;
			//txtDebug.htmlText = "<p>" + obj + "</p>" 
			//	+ "<br>" + txtDebug.htmlText;
		}
		
		/**
		* 
		* @param	modalName
		* @return
		*/
		public static function loadCallout(calloutName:String) :void
		{
			// TODO add in animation
			try
			{
				tileCallout
					= new TileEngineCalloutLoader(modalPath +  calloutName + "/"  + calloutName + "-callout.swf");
					if(tileEngineCalloutAnchor.numChildren > 0)
					{
						tileEngineCalloutAnchor.removeChildAt(0);
					}
					//tileEngineNavigation.scaleX = finalScaleAmount;
					//tileEngineNavigation.scaleY = finalScaleAmount;
					tileEngineCalloutAnchor.addChildAt(tileCallout,0);
			}
			catch(error:Error)
			{
				tracer("loadCallout() error:"+ error);
			}
		}
		
		/**
		* Loads in a modal dialog or microsite to center with the navigation
		* @param	modalName
		* @return
		*/
		public static function loadModal(modalName:String) :void
		{
			// TODO add in animation
			try
			{
				tileModal
					= new TileEngineModalLoader(modalPath +  modalName + "/"  + modalName + ".swf");
					if(tileEngineModalAnchor.numChildren > 0)
					{
						tileEngineModalAnchor.removeChildAt(0);
					}
					//tileEngineNavigation.scaleX = finalScaleAmount;
					//tileEngineNavigation.scaleY = finalScaleAmount;
					tileEngineModalAnchor.addChildAt(tileModal,0);
			}
			catch(error:Error)
			{
				tracer("loadModal() error:" +  error);
			}
		}
		
		/**
		* Change state of the application
		* @param	state
		*/
		public function changeState(state:String)
		{
			instance.tileEngineState = state;
			
			if(state == TileEngineState.EDIT)
			{
				//Tweener.addTween(tileEngineWorldMask, {height:tileEngineWorldMask.height - 200});
			}
		}
		
		/**
		* Sets the global movie objects used in the interface
		*/
		public function setGlobalObjects():void
		{
			try
			{
				// set world mask
				tileEngineWorldMask 
					= DisplayInfo.getObjectByQualifiedClassName(glo.bal.root
					, "drawlogic.as3.game.tileengine.TileEngineWorldMask") as TileEngineWorldMask;
				tracer("worldMask: " + tileEngineWorldMask);
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineWorldMask: " +  err);
			}
			
			try
			{
				// set world mask
				tileEngineAppCover 
					= DisplayInfo.getObjectByQualifiedClassName(glo.bal.root
					, "drawlogic.as3.game.tileengineapp.TileEngineAppCover") as TileEngineAppCover;
				tracer("tileEngineAppCover: " + tileEngineAppCover);
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineAppCover: " +  err);
			}

			try
			{
				// set tileEngineAppFooter
				tileEngineAppFooter 
					= DisplayInfo.getObjectByQualifiedClassName(glo.bal.root
					, "drawlogic.as3.game.tileengineapp.TileEngineAppFooter") as TileEngineAppFooter;
				tracer("tileEngineAppFooter: " + tileEngineAppFooter);
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineAppFooter: " +  err);
			}
			
		
			try
			{
				// set world tileEngineNavigation
				tileEngineNavigation
					= DisplayInfo.getObjectByQualifiedClassName(glo.bal.root
					, "drawlogic.as3.game.tileengine.TileEngineNavigation") as TileEngineNavigation;
				tracer("tileEngineNavigation: " + tileEngineNavigation);
				ORIGINAL_NAV_HEIGHT= tileEngineNavigation.height;
				ORIGINAL_NAV_WIDTH = tileEngineNavigation.width;
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineNavigation: " +  err);
			}			
			
			try
			{
				// set tileEngineModalAnchor
				tileEngineModalAnchor 
					= DisplayInfo.getObjectByQualifiedClassName(tileEngineNavigation
					, "drawlogic.as3.game.tileengine.TileEngineModalAnchor") as TileEngineModalAnchor;
				tracer("tileEngineModalAnchor: " + tileEngineModalAnchor);
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineModalAnchor: " +  err);
			}
			
			try
			{
				// set tileEngineCalloutAnchor
				tileEngineCalloutAnchor 
					= DisplayInfo.getObjectByQualifiedClassName(tileEngineNavigation
					, "drawlogic.as3.game.tileengine.TileEngineCalloutAnchor") as TileEngineCalloutAnchor;
				tracer("tileEngineCalloutAnchor: " + tileEngineCalloutAnchor);
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineCalloutAnchor: " +  err);
			}			
			
			try
			{
				// set universe anchor
				tileEngineUniverseAnchor 
					= DisplayInfo.getObjectByQualifiedClassName(glo.bal.root
					, "drawlogic.as3.game.tileengine.TileEngineUniverseAnchor") as TileEngineUniverseAnchor;
				tracer("tileEngineUniverseAnchor: " + tileEngineUniverseAnchor);
				tracer("tileEngineUniverseAnchor:" + tileEngineUniverseAnchor.x);
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineUniverseAnchor: " +  err);				
			}
			
				
			try
			{
				// set tileEngineModalAnchor
				tileEngineAppBackground 
					= DisplayInfo.getObjectByQualifiedClassName(glo.bal.root
					, "drawlogic.as3.game.tileengineapp.TileEngineAppBackground") as TileEngineAppBackground;
				tracer("tileEngineAppBackground: " + tileEngineAppBackground);
			}
			catch(err:Error)
			{
				tracer("ERROR tileEngineAppBackground: " +  err);
			}
			
			
			try
			{
				// set mask
				tileEngineUniverseAnchor.mask = tileEngineWorldMask;
			}
			catch(err:Error)
			{
				tracer("ERROR mask: " +  err);	
			}
		}
		
		/**
		* Attach the contextMenu
		* @return
		*/
		public function doContextMenu():void
		{
			var fullscreenCM:ContextMenu = new ContextMenu();
			fullscreenCM.addEventListener(ContextMenuEvent.MENU_SELECT, onContextMenuHandler);
			fullscreenCM.hideBuiltInItems();   var fs:ContextMenuItem = new ContextMenuItem("Show Full Screen" );
			fs.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onShowFullScreen);
			fullscreenCM.customItems.push( fs );   var xfs:ContextMenuItem = new ContextMenuItem("Exit Full Screen");
			xfs.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onShowNormalScreen);
			fullscreenCM.customItems.push( xfs );      // THIS ASSUMES YOU HAVE A MOVIECLIP IN THE LIBRARY
			
			// attach the context menu
			//tileEngineUniverseAnchor.contextMenu = fullscreenCM;
			glo.bal.root.contextMenu = fullscreenCM;
		}
		
		/**
		* Sort the levels
		* 
		* 
		*/
		public function sortLevels():void 
		{
			var assetTile:Array = getLevel(TileLevels.ASSETS_LEVEL);
			for(var b=0;b<this.numChildren;b++)
			{
				assetTile.push(this.getChildAt(b));
			}
			assetTile.sortOn("y", Array.NUMERIC);
			var i:int = assetTile.length;
			while(i--){
				if (getChildAt(i) != assetTile[i]) {
					this.setChildIndex(assetTile[i], i);
				}
			}
		}
		
		/**
		* This draws on a grid and helps during testing
		* 
		* 
		*/
		public function doDrawLogic()
		{
			// draw the current set onto the screen
			// if the current item exists already, skip it,
			// if not, then load it, then fade in the fog of war
			//this.removeChildAt(){}
			
		
			for(var bb=0;bb<mainTileWorldAnchor.numChildren;bb++)
			{
				mainTileWorldAnchor.removeChildAt(bb);
			}
			
			//tracer(glo.bal.stage.width);
			//tracer(mainTileWorldAnchor.width);
			//tracer(mainTileWorldAnchor.x);
			
			// if drawgrid is on show buoys...
			for(var m:int=-10;m< 10;m++)
			{
				var xrr:int = 500 * m;
				
				for(var n:int=-10;n< 10;n++)
				{
					var _mainTileSquareAnchor:Class = Class(getDefinitionByName("drawlogic.as3.game.tileengine.TileBuoy"));
					if(_mainTileSquareAnchor)
					{
						//if(mainTileWorldAnchor.x> xrr)
						//{
						mainTileAssetBuilding = new _mainTileSquareAnchor();
						mainTileAssetBuilding.x =xrr;
						mainTileAssetBuilding.y = n *500;
						mainTileWorldAnchor.addChild(mainTileAssetBuilding);
						//}
						
					}
				}
			}
		}
		
		/**
		* Get array for level passed.
		* 
		* @param level The level you want to fetch, returned as Array.
		*/
		public function getLevel(level:String):Object
		{
			return tileLevelsObjectArray[level];
		}
		
		/**
		* Initialize the levels for engine.
		* 
		* 
		*/
		public function setLevels():void
		{			
			
			//TODO: hook to datastore
			/*tileLevelsArray.push(TileEngineLevels.UNDERGROUND);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.TERRAIN_BASE);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.TERRAIN_LARGE);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.TERRAIN_ROAD);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.ASSETS);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.SKY);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.SPACE);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.UNIVERSE);
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(TileEngineLevels.GRID);*/			
			
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			tileLevelsArray.push(TileEngineLevels.EMPTY);
			tileLevelsArray.push(new Array());
			
			tracer(tileLevelsArray);
		}

		/**
		* 
		* 
		* 
		*/
		public function doMove()
		{
			var speed:int = 50;
			// Speed
			
			if ( keyUp )
			{
				tileEngineUniverseAnchor.y += speed;

			}
			else if ( keyDown )
			{
				tileEngineUniverseAnchor.y -= speed;

			}
			else
			{
			}
			
			if ( keyRight )
			{
				tileEngineUniverseAnchor.x -= speed;

			}
			else if ( keyLeft )
			{
				tileEngineUniverseAnchor.x += speed;

			}
			else
			{
			}
		}
		

		
		/**
		* -------------------------------------------------------------------------> EVENTS
		* 
		* 
		*/
		
		// functions to enter and leave full screen mode
		/**
		* 
		* @param	event
		* @return
		*/
		private function onShowFullScreen(event:ContextMenuEvent):void
		{
			glo.bal.stage.displayState = StageDisplayState.FULL_SCREEN;
			//instance.HEADER_HEIGHT = 80;
			adjustStage();
		}
		
		/**
		* 
		* @param	event
		* @return
		*/
		private function onShowNormalScreen(event:ContextMenuEvent):void
		{
			glo.bal.stage.displayState = StageDisplayState.NORMAL;
			///instance.HEADER_HEIGHT = 0;
			adjustStage();
		}  
		
		// function to enable and disable the context menu items,
		// based on what mode we are in.
		/**
		* 
		* @param	event
		* @return
		*/
		private function onContextMenuHandler(event:ContextMenuEvent):void
		{
			if (glo.bal.stage.displayState == StageDisplayState.NORMAL)
			{
				event.target.customItems[0].enabled = true; // show full screen button
				event.target.customItems[1].enabled = false; // hide normal screen button
			}
			else
			{
				event.target.customItems[0].enabled = false; // hide full screen button
				event.target.customItems[1].enabled = true; // shoe normal screen button
			}
		}		
		
		/**
		* 
		* @param	event
		* @return
		*/
		private function onKeyDownHandler( event :KeyboardEvent ):void
		{
			switch ( event.keyCode)
			{
				case "W".charCodeAt() :
				case Keyboard.UP :
					keyUp = true;
					keyDown = false;
					break;

				case "S".charCodeAt() :
				case Keyboard.DOWN :
					keyDown = true;
					keyUp = false;
					break;

				case "A".charCodeAt() :
				case Keyboard.LEFT :
					keyLeft = true;
					keyRight = false;
					break;

				case "D".charCodeAt() :
				case Keyboard.RIGHT :
					keyRight = true;
					keyLeft = false;
					break;
			}
			
			if(event.shiftKey)
			{
				// if shift key is down cehkc for codes
				var key:KeyObject = new KeyObject(glo.bal.stage);
				if (key.isDown("!".charCodeAt()) 
					&& key.isDown("a".charCodeAt())
					&& key.isDown("r".charCodeAt()) 
					&& key.isDown("g".charCodeAt())) 
				{ 
					OutputPanel.trace("EDIT MODE DETECTED!");
				}
				
			}
			

			
			//tracer("keyDownHandler: " + event.keyCode);
		}
		
		/**
		* 
		* @param	event
		* @return
		*/
		private function onKeyUpHandler( event :KeyboardEvent ):void
		{
			keyRight = false;
			keyLeft = false;
			keyUp = false;
			keyDown = false;

			switch ( event.keyCode)
			{
				case "W".charCodeAt() :
				case Keyboard.UP :
					//keyUp = true;
					break;

				case "S".charCodeAt() :
				case Keyboard.DOWN :
					//keyDown = true;
					break;

				case "A".charCodeAt() :
				case Keyboard.LEFT :
					//keyLeft = true;
					break;

				case "D".charCodeAt() :
				case Keyboard.RIGHT :
					//keyRight = true;
					break;
			}
			//tracer("keyUpHandler: " + event.keyCode);
		}

		/**
		* 
		* @param	event
		* @return
		*/
		private function onResizeHandler(event:Event):void
		{		
			adjustStage();			
		}
		
		/**
		* 
		* @param	event
		* @return
		*/
		public function onMouseMoveHandler(event:Event) : void
		{
			
		}

		/**
		* 
		* @param	event
		* @return
		*/
		private function onMouseClickHandler(event:Event) : void
		{		
			//tracer("glo.bal.stage.width: " + stage.width);
			//tracer("mainTileWorldAnchor.width: " + mainTileWorldAnchor.width);
			//tracer("mainTileWorldAnchor.x: " + mainTileWorldAnchor.x);
			//tracer("glo.bal.stage.screenWidth: " + glo.bal.stage.screenWidth);
			//traceDisplayList(mainTileWorldAnchor,"");
		}

		/**
		* 
		* @param	event
		* @return
		*/
		private function onMouseWheelHandler(event:MouseEvent):void
		{
			//[MouseEvent type="mouseWheel" bubbles=true cancelable=false 
			// eventPhase=2 localX=261 localY=241 stageX=261 stageY=241 
			// relatedObject=null ctrlKey=false altKey=false shiftKey=false 
			// delta=-6]
			try
			{		

					var amount:Number = new Number(event.delta);
					OutputPanel.trace(amount);
					if(amount > 0)
					{
						tileEngineUniverseAnchor.scaleX += event.delta/600;
						tileEngineUniverseAnchor.scaleY += event.delta/600;
					}	
					else
					{
						tileEngineUniverseAnchor.scaleX -= event.delta/600;
						tileEngineUniverseAnchor.scaleY -= event.delta/600;
					}
			}
			catch(err:Error)
			{
				tracer(err);
			}			
		}

		/**
		* 
		* @param	event
		* @return
		*/
		private function onEnterFrameHandler(event:Event):void
		{
			doMove();
		}
		
				/**
		* 
		* @param	event
		* @return
		*/
		//private function onAddedHandler(event:Event):void
		//{
			//tracer(glo.bal.stage.mouseX);
		//	initEngine();
		//}
	}
}