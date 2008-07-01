/// -------------------------------------------------------------------
///
/// code draw(n) by Ryan Christensen /s/drawk/cab/
/// drawk.com / drawlogic.com / bridgeware.com/lab/
/// drawlogic.as3.game.tileengine
/// 
/// -------------------------------------------------------------------
//
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
	import flash.external.ExternalInterface;

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
	
	public class TileEngineAppUrlAPI 
	{
		private static var urlArray:Array = new Array();
		private static var uiSwitch:String = "";
		private static var uiSection:String = "";
		private static var uiUrlParams:String = "";
		
		public function TileEngineAppUrlAPI() 
		{

		}
		
		private static function parseUrl()
		{
			var str:String = SWFAddress.getValue();
			urlArray = str.split("/");
			if(urlArray[0] =="" && urlArray.length > 0)
			{
				uiSwitch = urlArray[1];
			}
			
			for(var i:int=0;i<urlArray.length;i++)
			{
				
			}
			trace(urlArray);
			trace(uiSwitch);
			
			
		}
		
		public static function getSwitch()
		{
			TileEngineAppUrlAPI.parseUrl();
		}

		
		// TODO switch out to xml file soon
		public static function setUrl(url:String)
		{
			var title:String = "HB100";
			switch(url)
			{
				case TileEngineAppUrlSwitch.ABOUT:
					title = "HB100 About";
					break;
				case TileEngineAppUrlSwitch.ADMIN:
					title = "HB100 Admin";
					break;
				case TileEngineAppUrlSwitch.EDITOR:
					title = "HB100 Editor";
					break;
				case TileEngineAppUrlSwitch.ENTER:
					title = "HB100 Enter the HB100 Top 10 Contest";
					break;
				case TileEngineAppUrlSwitch.HOUSE:
					title = "HB100 Business View";
					break;
				case TileEngineAppUrlSwitch.JOIN:
					title = "HB100 Join the Sun City Map";
					break;
				case TileEngineAppUrlSwitch.MAP:
					title = "HB100 Sun City Map";
					break;
				case TileEngineAppUrlSwitch.MICRO_DELL:
					title = "HB100 Dell";
					break;
				case TileEngineAppUrlSwitch.MICRO_MICROSOFT:
					title = "HB100 Microsoft";
					break;
				case TileEngineAppUrlSwitch.MICRO_SOUTHWEST:
					title = "HB100 Southwest";
					break;
				case TileEngineAppUrlSwitch.MICRO_SUN:
					title = "HB100 StartUpNation";
					break;
				case TileEngineAppUrlSwitch.MYACCOUNT:
					title = "HB100 My Account";
					break;
				case TileEngineAppUrlSwitch.PRIVACY:
					title = "HB100 Privacy Policy";
					break;
				case TileEngineAppUrlSwitch.PROMOTIONS:
					title = "HB100 Promotions";
					break;
				case TileEngineAppUrlSwitch.RECENT:
					title = "HB100 Recent Entries";
					break;
			}

			SWFAddress.setTitle(title);
			SWFAddress.setValue(url); 			
			
            /*if (ExternalInterface.available) {
                try {
                    trace("Adding callback...\n");
                    ExternalInterface.addCallback("sendToActionScript", receivedFromJavaScript);
                    if (checkJavaScriptReady()) {
                        trace("JavaScript is ready.\n");
                    } else {
                        trace("JavaScript is not ready, creating timer.\n");
                        var readyTimer:Timer = new Timer(100, 0);
                        readyTimer.addEventListener(TimerEvent.TIMER, timerHandler);
                        readyTimer.start();
                    }
                } catch (error:SecurityError) {
                    trace("A SecurityError occurred: " + error.message + "\n");
                } catch (error:Error) {
                    trace("An Error occurred: " + error.message + "\n");
                }
            } else {
                trace("External interface is not available for this container.");
            }
			if (ExternalInterface.available) {
               // ExternalInterface.call("sendToJavaScript", "#" + url + "/" + subUrl);
            }
			
					private function receivedFromJavaScript(value:String):void 
		{
            trace("JavaScript says: " + value + "\n");
        }
		
        private function checkJavaScriptReady():Boolean 
		{
            var isReady:Boolean = ExternalInterface.call("isReady");
            return isReady;
        }
		
        private function timerHandler(event:TimerEvent):void 
		{
            trace("Checking JavaScript status...\n");
            var isReady:Boolean = checkJavaScriptReady();
            if (isReady) {
                trace("JavaScript is ready.\n");
                Timer(event.target).stop();
            }
        }
			*/
			
			//navigateToURL(new URLRequest("#" + url + "/" + subUrl));
			
		}
		

		
	}	
}
