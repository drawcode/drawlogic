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
package drawlogic.as3.template
{	
	import flash.display.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.geom.*;	
    import flash.net.*;
	import flash.utils.*;
	
	import drawlogic.as3.util.*;		
	import drawlogic.as3.template.TemplateService; // our connection to the service
	
	public class TemplateServiceAPI    
	{        
		private var rs:TemplateService;
		
		function TemplateServiceAPI(url:String)        
		{        
			trace("Welcome to TemplateServiceAPI enjoy your stay...");
			rs = new TemplateService(url);
		}     		
		
		public function Serialize(userGuid:String, codeName:String, appName:String):Boolean
		{
			// serialize to service
			return true;
		}
		
		public function Deserialize(userGuid:String, codeName:String, appName:String)
		{
			// pull from service
			return true;
		}		
		
		public function TestMe()        
		{		
			//trace("Calling TestMe()");
			var responder:Responder = new Responder(onResult, onFault);            
			var params:Object = new Object();            
			//params.arg1 = "something";            
			//params.arg2 = "2";            
			var r:String = rs.call("WJTemplateFlourine.Sample.Echo", responder, params);   
		//	trace("HHH:" + r);
			//trace(rs.objectEncoding.toString());
			//Log(LogType.TRACE_LOG, r);
			//Log(LogType.TRACE_LOG, getQualifiedClassName(r));			
			//trace("Done Calling TestMe()");
		}  
		
		private function onResult(result:Object):void        
		{            
			trace("resultXXXXXXXXXXXXXXX222" + result); 
			trace("resultXXXXXXXXXXXXXXX" + result.toString()); 
			
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
			//trace(echo);			
		}        
        
		private function onFault(fault:Object):void        
		{            
			Log(LogType.TRACE_LOG, fault);        
		}
	}
}

