
/**
 * SWFAddress v1.1: Deep linking for Flash - http://www.asual.com/swfaddress/
 * 
 * SWFAddress is (c) 2006 Rostislav Hristov and is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 *
 */
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

    import flash.external.ExternalInterface;
    import flash.utils.clearInterval;
    import flash.utils.setInterval;

    public class SWFAddress 
	{

        private static var _value:String = '';
        private static var _availability:Boolean = ExternalInterface.available;
 
        public static var onChange:Function;

        private static function _check():void 
		{
            if (SWFAddress.onChange != null) 
			{
                clearInterval(SWFAddress._interval);
                if (_availability) 
				{
                    ExternalInterface.addCallback('getSWFAddressValue', 
                        function():String {return _value});
                    ExternalInterface.addCallback('setSWFAddressValue', 
                        SWFAddress.setValue);
                }
                SWFAddress.setValue(SWFAddress.getValue());
            }
        }    
        private static var _interval:Number = setInterval(SWFAddress._check, 10);

        public static function getTitle():String 
		{
            var title:String = (_availability) ? 
                ExternalInterface.call('SWFAddress.getTitle') as String : '';
            if (title == 'undefined' || title == null) title = '';
            return title;
        }

        public static function setTitle(title:String):void 
		{
            if (_availability) ExternalInterface.call('SWFAddress.setTitle', title);
        }

        public static function getStatus():String 
		{
            var status:String = (_availability) ? 
                ExternalInterface.call('SWFAddress.getStatus') as String : '';
            if (status == 'undefined' || status == null) status = '';
            return status;
        }

        public static function setStatus(status:String):void 
		{
            if (_availability) ExternalInterface.call('SWFAddress.setStatus', status);
        }
        
        public static function resetStatus():void 
		{
            if (_availability) ExternalInterface.call('SWFAddress.resetStatus');
        }
        
        public static function getPath():String 
		{
            var value:String = SWFAddress.getValue();
            if (value.indexOf('?') != 1) {
                return value.split('?')[0];
            } else {
                return value;   
            }
        }

        public static function getQueryString():String 
		{
            var value:String = SWFAddress.getValue();
            var index:Number = value.indexOf('?');
            if (index != -1 && index < value.length) {
                return value.substr(index + 1);
            }
            return '';
        }
        
        public static function getParameter(param:String):String 
		{
            var value:String = SWFAddress.getValue();
            var index:Number = value.indexOf('?');
            if (index != -1) {
                value = value.substr(index + 1);
                var params:Array = value.split('&');
                var p:Array;
                var i:Number = params.length;
                while(i--) {
                    p = params[i].split('=');
                    if (p[0] == param) {
                        return p[1];
                    }
                }
            }
            return '';
        }

        public static function getParameterNames():Array 
		{
            var value:String = SWFAddress.getValue();
            var index:Number = value.indexOf('?');
            var names:Array = new Array();
            if (index != -1) {
                value = value.substr(index + 1);
                if (value != '' && value.indexOf('=') != -1) {            
                    var params:Array = value.split('&');
                    var i:Number = 0;
                    while(i < params.length) {
                        names.push(params[i].split('=')[0]);
                        i++;
                    }
                }
            }
            return names;
        }

        public static function getValue():String 
		{
            var addr:String, id:String = null;
            if (_availability) { 
                addr = ExternalInterface.call('SWFAddress.getValue') as String;
                id = ExternalInterface.call('SWFAddress.getId') as String;
            }
            if (id == null || !_availability) {
                addr = SWFAddress._value;
            } else {
                if (addr == 'undefined' || addr == null) addr = '';            
            }
            return addr;
        }

        public static function setValue(addr:String):void 
		{
            if (addr == 'undefined' || addr == null) addr = '';
            SWFAddress._value = addr;
            if (_availability) ExternalInterface.call('SWFAddress.setValue', addr);
            if (SWFAddress.onChange != null) SWFAddress.onChange();
        }
    }
}