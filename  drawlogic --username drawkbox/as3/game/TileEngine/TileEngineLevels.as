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
	
	public class TileEngineLevels 
	{
		public static const UNDERGROUND:String = "underground";
		public static const EMPTY:String = "empty";
		public static const TERRAIN_BASE:String = "terrainBase";
		public static const TERRAIN_LARGE:String = "terrainLarge";
		public static const TERRAIN_ROAD:String = "roads";
		public static const ASSETS:String = "assets";
		public static const SKY:String = "sky";
		public static const SPACE:String = "space";
		public static const UNIVERSE:String = "universe";
		public static const GRID:String = "grid";
		
		public static const UNDERGROUND_LEVEL:int = 0;
		public static const TERRAIN_BASE_LEVEL:int = 2;
		public static const TERRAIN_LARGE_LEVEL:int = 4;
		public static const TERRAIN_ROAD_LEVEL:int = 6;
		public static const ASSETS_LEVEL:int = 8;
		public static const SKY_LEVEL:int = 10;
		public static const SPACE_LEVEL:int = 12;
		public static const UNIVERSE_LEVEL:int = 14;
		public static const GRID_LEVEL:int = 16;
	}	
}
