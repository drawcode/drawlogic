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
package drawlogic.as3.util
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
	* DisplayInfo class helps facilitate some movie and tree actions
	*/
    public class DisplayInfoAPI
	{
		
		/**
		 * Constructs the DisplayConverter object.
		 */
		public function DisplayInfoAPI()
		{
			trace("DisplayInfo is a static class and should not be instantiated");
		} 	
		
		/**
		* TODO: make this based on debug or not
		* Trace info 
		* @param	obj
		* @return
		*/
        public static function traceInfo(obj:*):void
		{			
			var methodName:String = "dumpMovieClipInfo";
			//Log(LogType.TRACE_LOG, methodName + " - getQualifiedClassName:" + getQualifiedClassName(obj));
			//Log(LogType.TRACE_LOG, methodName + " - Object:" + obj);
			//Log(LogType.TRACE_LOG, methodName + " - Name:" + obj.name);
			trace(methodName + " - getQualifiedClassName:" + getQualifiedClassName(obj));
			trace(methodName + " - Object:" + obj);
			trace(methodName + " - Name:" + obj.name);
			//trace(describeType(obj));
		}
		
		/**
		* describeType
		* @param	obj
		* @return
		*/
        public static function describeType(obj:*):void
		{			
			trace(describeType(obj));
		}
		
		/**
		* Trace the display list of the parent display container passed in.
		* @param	container
		* @param	indentString
		* @return
		*/
		public static function traceDisplayList(container:DisplayObjectContainer,  indentString:String = " "):void
		{
			var child:DisplayObject;
			for (var i:uint=0; i < container.numChildren; i++)
			{
				child = container.getChildAt(i);
				
				trace(indentString, child, child.name); 
				if (container.getChildAt(i) is DisplayObjectContainer)
				{
					try
					{
						traceDisplayList(DisplayObjectContainer(child), indentString + "    ")
					}
					catch(err:Error)
					{
						
					}
				}
			}
		}
		
		/**
		* Get the object by the className and search within the tree of the parent container.
		* @param	container
		*/
		public static function getObjectByQualifiedClassName(container:DisplayObjectContainer, className:String)
		{
			var child:DisplayObject;
			for (var i:uint=0; i < container.numChildren; i++)
			{
				child = container.getChildAt(i);
				var _child:Class = Class(getDefinitionByName(className));		
				if(child is _child)// || child.toString().indexOf(className) > -1)
				{
					trace(child, child.name, className, child.toString()); 
					trace(child);
					traceInfo(child);
					return child;
				}					
				
				if (container.getChildAt(i) is DisplayObjectContainer)
				{				
					try
					{
						getObjectByQualifiedClassName(DisplayObjectContainer(child), className)
					}
					catch(err:Error)
					{
						//return child;
					}
				}
			}
			return child;
		}
		
		/**
		* Get the object by the instance name
		* @param	container
		*/
		public static function getObjectByInstanceName(container:DisplayObjectContainer, instanceName:String)
		{
			var child:DisplayObject;
			for (var i:uint=0; i < container.numChildren; i++)
			{
				child = container.getChildAt(i);
				if(child.name == instanceName)
					return child;
				trace(instanceName, child, child.name); 
				if (container.getChildAt(i) is DisplayObjectContainer)
				{
					//trace(child, child.name, className); 
					
					try
					{
						getObjectByQualifiedClassName(DisplayObjectContainer(child), instanceName)
					}
					catch(err:Error)
					{
						//return child;
					}
				}
			}
			return child;
		}
		
				// Remove all of the children in a container
		public static function removeAllChildren( container:DisplayObjectContainer ):void 
		{
			  
			// Because the numChildren value changes after every time we remove
			// a child, save the original value so we can count correctly
			var count:int = container.numChildren;
			
			// Loop over the children in the container and remove them
			for ( var i:int = 0; i < count; i++ ) {
				container.removeChildAt( 0 );
			}
		}
		
		/**
		* 			var _movieWorldMask:Class	
					= Class(getDefinitionByName("drawlogic.as3.game.tileengine.TileEngineWorldMask"));
				if(_movieWorldMask)
				{
					movieWorldMask = new _movieWorldMask();

					//movieWorldMask.x = movieWorldMask.x + 10;
					trace("movieWorldMask:" + movieWorldMask);
				}
			movieWorldMask = new _movieWorldMask();

					//movieWorldMask.x = movieWorldMask.x + 10;
					trace("movieWorldMask:" + movieWorldMask);
					movieWorldMask.width = stage.stageWidth;
					movieWorldMask.height = stage.stageHeight;
					movieWorldMask.x += 10;

			
			trace("_movieWorldMask:" + _movieWorldMask);
		*/
    } 
}