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
	
	public class TileEngineAppUserState 
	{
		
		public static var soUserState:SharedObject = SharedObject.getLocal("soUserState");
		public static var soUserStatePL:SharedObject = SharedObject.getLocal("soUserStatePL");	
		
		public static var isLoggedIn:Boolean = false;
		
		public function TileEngineAppUserState():void
		{
		}
		
		public static function setUserLoggedIn(loggedIn:Boolean):void
		{
			soUserState.data.loggedIn = loggedIn;
			isLoggedIn = loggedIn;
			soUserState.flush();
		}
		
		public static function setUserLoggedOut():void
		{
			soUserState.data.loggedIn = false;
			isLoggedIn = false;
			soUserState.flush();
		}
		
		public static function getUserLoggedIn():Boolean
		{
			if(soUserState.data.loggedIn == true)
				isLoggedIn = true;			
			return isLoggedIn;
		}
	}	
}






