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
package drawlogic.as3.net 
{
	import flash.events.EventDispatcher;
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	
	import com.blitzagency.xray.logger.XrayLog;
	
	import drawlogic.as3.util.OutputPanel;
	
	import drawlogic.as3.net.Red5Connection;
	import drawlogic.as3.net.Events.Red5ConnectionEvent;
	
	public class Red5Connection extends EventDispatcher
	{
	
		private var nc:NetConnection;
		private var uri:String;
		private var log:XrayLog;
		
		public function Red5Connection()
		{
			// xray if needed
			log = new XrayLog();
			
			//  create the netConnection
			nc = new NetConnection();
			//  set it's client/focus to this
			nc.client = this;
			
			// add listeners for netstatus and security issues
			nc.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);			

			
			// set the encoding to AMF0 - still waiting for AMF3 to be implemented on Red5
			nc.objectEncoding = ObjectEncoding.AMF0;
		}
		
		public function connect():void
		{
			if(getURI().length == 0)
			{
				trace("please provide a valid URI connection string", "URI Connection String missing");
				return;
			}else if(nc.connected)
			{
				trace("You are already connected to " + getURI(), "Already connected");
				return;
			}
			nc.connect(getURI());
		}
		
		public function close():void
		{
			nc.close();
		}
		
		public function setURI(p_URI:String):void
		{
			uri = p_URI;
		}
		
		public function getURI():String
		{
			return uri;
		}
		
		public function getConnection():NetConnection
		{
			return nc;
		}
		
		public function getConnected():Boolean
		{
			return nc.connected;
		}
		
		public function onBWDone():void
		{
			// have to have this for an RTMP connection
		}
		
		private function netStatusHandler(event:NetStatusEvent):void 
		{
			log.debug("netStatus", event.info.code);
			var e:Red5ConnectionEvent;
			switch(event.info.code)
			{
				case "NetConnection.Connect.Failed":
					e = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_FAILED, false, false, event.info.code);
					dispatchEvent(e);
				break;
				
				case "NetConnection.Connect.Success":
					e = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_SUCCESS, false, false, event.info.code);
					dispatchEvent(e);
				break;
				
				case "NetConnection.Connect.Rejected":
					e = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_REJECTED, false, false, event.info.code);
					dispatchEvent(e);
				break;
				
				case "NetConnection.Connect.Closed":
					e = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_CLOSED, false, false, event.info.code);
					dispatchEvent(e);
				break;
				
				case "NetConnection.Connect.InvalidApp":
					e = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_INVALIDAPP, false, false, event.info.code);
					dispatchEvent(e);
				break;
				
				case "NetConnection.Connect.AppShutdown":
					e = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_APPSHUTDOWN, false, false, event.info.code);
					dispatchEvent(e);
				break;
			}
			
			if(event.info.code != "NetConnection.Connect.Success")
			{
				// I dispatch DISCONNECTED incase someone just simply wants to know if we're not connected'
				// rather than having to subscribe to the events individually
				e = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_DISCONNECTED, false, false, event.info.code);
				dispatchEvent(e);
			}
		}
		
		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			log.debug("nc error", event.text);
			var e:Red5ConnectionEvent = new Red5ConnectionEvent(Red5ConnectionEvent.RED5_SECURITYERROR, false, false, event.text);
			dispatchEvent(e);
		}
	}
}

