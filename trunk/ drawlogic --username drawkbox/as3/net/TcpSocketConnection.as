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
package drawlogic.as3.net {

	import flash.display.Sprite;
	import flash.net.Socket;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	
	public class TcpSocketConnection {		
	
		private var host:String;
		private var port:int;

		private var socket:Socket;

		public function TcpSocketConnection()
		{
			host = "localhost";
			port = 9050;

			connect();
		}
 
		private function connect():void
		{
			 // socket connection code goes here
			socket = new Socket();

			socket.addEventListener(Event.CONNECT, socketConnectHandler);
			socket.addEventListener(Event.CLOSE, socketCloseHandler);
			socket.addEventListener(IOErrorEvent.IO_ERROR, socketErrorHandler );

			try
			{
				socket.connect( host, port );
			}
			catch ( e:Error )
			{
				trace(e);
			}
		}
		
	
		private function socketConnectHandler( event:Event ):void
		{
			// add handler for receiving data
		   socket.addEventListener( ProgressEvent.SOCKET_DATA, socketDataHandler );
		   sendMessage( "Hello TcpServer" );
		}
		 
		public function sendMessage( message:String ):void
		{
		   message = "[RYAN]{action{type:\"chat\"}}message;" + message + "\n";
		 
		   if ( socket && socket.connected )
			  socket.writeUTFBytes( message );
		}
		 
		private function socketDataHandler( event:ProgressEvent ):void
		{
		   receiveMessage( socket.readUTFBytes( socket.bytesAvailable ) );
		}
		
		private function socketCloseHandler( event:Event ):void
		{
			// handle connection closed
			trace( "Socket Closed" );
		}
		
		private function socketErrorHandler( event:IOErrorEvent ):void
		{
			// handle connection error
			trace( "Socket has run into an Error" );
		}
		 
		private function receiveMessage( message:String ):void
		{
		   trace( message );
		}	
	
	}
	
}
