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
package drawlogic.as3.game.tileengineService
{	
	import flash.display.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.geom.*;	
    import flash.net.*;
	import flash.utils.*;
	
	import drawlogic.as3.util.*;		
	import drawlogic.as3.game.tileengine.*; // our connection to the service	
	
	public class TileEngineServiceAPI    
	{        
		// our service connector, NetConnection
		private var rs:TileEngineService;
		private const namespacePrefix:String = "B.Net2.Game.TileEngine.TileEngineServiceAPI.";
		
		function TileEngineServiceAPI(url:String)        
		{        
			trace(namespacePrefix + " started...");
			rs = new TileEngineService(url);
		}     		
		
		public function GetTemplateItems3(str:String)
		{
			var responder:Responder = new Responder(GetTemplateItems3_onResult, GetTemplateItems3_onFault);            
			rs.call(namespacePrefix + "GetTemplateItems3", responder, "testing"); 
		}
		
		private function GetTemplateItems3_onResult(result:Object):void        
		{            
			
			trace("result:" +result);
			//trace("result:" +result.result);
			
			for(var items:String in result) 
			{
				trace("items" +items);
				if (typeof(result[items]) == "object") 
				{
					//mediaList.push(list[items]);
					for (var d:String in result[items]) 
					{					
						trace(d + " - " + result[items][d]);
					}
				}
			}	
		}        
        
		private function GetTemplateItems3_onFault(fault:Object):void        
		{            
			Log(LogType.TRACE_LOG, fault);        
		}
	}
}

