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
package drawlogic.as3.util.units 
{
  import drawlogic.as3.util.*;

  public class ConverterAPI
  {

    public function ConverterAPI(uFrom:Unit, uTo:Unit) 
	{

    }

    public static function convert(uFrom:Unit, uTo:Unit, nValue:Number, bVerbose:Boolean = false):Number 
	{
		var fFunction:Function = LookUpTable.getConversionFunction(_uFrom.baseUnit.name + "TO" + _uTo.baseUnit.name);
		var nReturn:Number = NumberUtilities.round((fFunction(nValue * _uFrom.multiplier) / _uTo.multiplier), .0000001);
		if (bVerbose) 
		{
			trace("converting " + nValue + " " + _uFrom.name + " to " + _uTo.name);
			trace("\t" + _uFrom.name + ": 1 " + _uFrom.baseUnit.name + " = " + _uFrom.multiplier + " " + _uFrom.name);
			trace("\t" + _uTo.name + ": 1 " + _uTo.baseUnit.name + " = " + _uTo.multiplier + " " + _uTo.name);
			trace("\tanswer: " + nReturn + " " + (nReturn == 1 ? _uTo.label : _uTo.labelPlural));
		}
		return nReturn;
    }

    public static function convertWithLabel(uFrom:Unit, uTo:Unit, nValue:Number):String 
	{
      var nReturn:Number = convert(nValue);
      return nReturn + " " + ((Math.abs(nReturn - 1) < .000000000000001) ? _uTo.label : _uTo.labelPlural);
    }

  }
  
}

  class LookUpTable 
  {
	  

    public static function getConversionFunction(sKey:String):Function 
	{
      var oFunctions:Object = new Object();

      // ---------------------------------------------------------
      //                Angle Conversion Functions
      // ---------------------------------------------------------
      oFunctions.degreeTOradian = function(nValue:Number):Number 
	  {
        return (nValue * Math.PI / 180);
      };
      oFunctions.radianTOdegree = function(nValue:Number):Number 
	  {
        return (nValue * 180 / Math.PI);
      };
      oFunctions.gradianTOdegree = function(nValue:Number):Number 
	  {
        return (nValue * .9);
      };
      oFunctions.gradianTOradian = function(nValue:Number):Number 
	  {
        return oFunctions.degreeTOradian(nValue * .9);
      };
      oFunctions.degreeTOgradian = function(nValue:Number):Number 
	  {
        return (nValue / .9);
      };
      oFunctions.radianTOgradian = function(nValue:Number):Number 
	  {
        return oFunctions.radianTOdegree(nValue) / .9;
      };

      // ---------------------------------------------------------
      //                Temperature Conversion Functions
      // ---------------------------------------------------------
      oFunctions.fahrenheitTOcelcius = function(nValue:Number):Number 
	  {
        return ((nValue - 32) * (5 / 9));
      };
      oFunctions.celciusTOfahrenheit = function(nValue:Number):Number 
	  {
        return ((nValue * (9 / 5)) + 32);
      };
      oFunctions.fahrenheitTOkelvin = function(nValue:Number):Number 
	  {
        return oFunctions.fahrenheitTOcelcius(nValue) + 273.15;
      };
      oFunctions.kelvinTOfahrenheit = function(nValue:Number):Number 
	  {
        return oFunctions.fahrenheitTOcelcius(nValue) + 273.15;
      };
      oFunctions.celciusTOkelvin = function(nValue:Number):Number 
	  {
        return (nValue + 273.15);
      };
      oFunctions.kelvinTOcelcius = function(nValue:Number):Number 
	  {
        return nValue - 273.15;
      };

      // ---------------------------------------------------------
      //                Mass/Weight Conversion Functions
      // ---------------------------------------------------------
      oFunctions.gramTOpound = function(nValue:Number):Number 
	  {
        return (nValue * .0022);
      };
      oFunctions.poundTOgram = function(nValue:Number):Number 
	  {
        return (nValue / .0022);
      };


      // ---------------------------------------------------------
      //                Distance Conversion Functions
      // ---------------------------------------------------------
      oFunctions.footTOmeter = function(nValue:Number):Number 
	  {
        return (nValue / 3.2808399);
      };
      oFunctions.meterTOfoot = function(nValue:Number):Number 
	  {
        return (nValue * 3.2808399);
      };

      // ---------------------------------------------------------
      //                Volume Conversion Functions
      // ---------------------------------------------------------
      oFunctions.gallonTOliter = function(nValue:Number):Number 
	  {
        return (nValue * 3.7854);
      };
      oFunctions.literTOgallon = function(nValue:Number):Number 
	  {
        return (nValue / 3.7854);
      };

      oFunctions.none = function(nValue:Number):Number 
	  {
        return nValue;
      };

      return (oFunctions[sKey] == null) ? oFunctions.none : oFunctions[sKey];
    }

  }