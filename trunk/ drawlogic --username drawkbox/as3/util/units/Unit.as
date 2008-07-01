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
	
  public class Unit 
  {
    private var _sUnitName:String;
    private var _sUnitCategory:String;
    private var _uBaseUnit:Unit;
    private var _nMultiplier:Number;
    private var _sLabelSingular:String;
    private var _sLabelPlural:String;

    public static function getCategories():Array 
	{
      return ["angle", "temperature", "weightmass", "distance", "volume"];
    }

    public static function getUnits(sCategory:String):Array 
	{
      var aAngle:Array = ["DEGREE", "RADIAN", "GRADIAN"];
      var aTemperature:Array = ["CELCIUS", "FAHRENHEIT", "KELVIN"];
      var aWeightMass:Array = ["OUNCE", "POUND", "TON", "MILLIGRAM", "GRAM", "KILOGRAM"];
      var aDistance:Array = ["CENTIMETER", "METER", "KILOMETER", "INCH", "FOOT", "MILE", "YARD"];
      var aVolume:Array = ["LITER", "GALLON"];
      aAngle.sort();
      aTemperature.sort();
      aWeightMass.sort();
      aDistance.sort();
      aVolume.sort();
      var aSum:Array = aAngle.concat(aTemperature, aWeightMass, aDistance, aVolume);
      switch (sCategory) {
        case "angle":
          return aAngle;
        case "temperature":
          return aTemperature;
        case "weightmass":
          return aWeightMass;
        case "distance":
          return aDistance;
        case "volume":
          return aVolume;
        default:
          return aSum;
      }
    }

    public static function get DEGREE():Unit 
	{
      return new Unit("degree", "angle");
    }

    public static function get RADIAN():Unit 
	{
      return new Unit("radian", "angle");
    }

    public static function get GRADIAN():Unit 
	{
      return new Unit("gradian", "angle");
    }

    public static function get CELCIUS():Unit 
	{
      return new Unit("celcius", "temperature", null, null, "celcius", "celcius");
    }

    public static function get FAHRENHEIT():Unit 
	{
      return new Unit("fahrenheit", "temperature", null, null, "fahrenheit", "fahrenheit");
    }

    public static function get KELVIN():Unit 
	{
      return new Unit("kelvin", "temperature", null, null, "kelvin", "kelvin");
    }

    public static function get OUNCE():Unit 
	{
      return new Unit("ounce", "weightmass", POUND, 1/16);
    }

    public static function get POUND():Unit 
	{
      return new Unit("pound", "weightmass");
    }

    public static function get TON():Unit 
	{
      return new Unit("ton", "weightmass", POUND, 2000);
    }

    public static function get MILLIGRAM():Unit 
	{
      return new Unit("milligram", "weightmass", GRAM, .001);
    }

    public static function get GRAM():Unit 
	{
      return new Unit("gram", "weightmass");
    }  

    public static function get KILOGRAM():Unit 
	{
      return new Unit("kilogram", "weightmass", GRAM, 1000);
    }

    public static function get LITER():Unit 
	{
      return new Unit("liter", "volume");
    }

    public static function get GALLON():Unit 
	{
      return new Unit("gallon", "volume");
    }

    public static function get INCH():Unit 
	{
      return new Unit("inch", "distance", FOOT, 1/12, "inch", "inches");
    }

    public static function get FOOT():Unit 
	{
      return new Unit("foot", "distance", null, null, "foot", "feet");
    }

    public static function get YARD():Unit 
	{
      return new Unit("yard", "distance", FOOT, 3);
    }

    public static function get MILE():Unit 
	{
      return new Unit("mile", "distance", FOOT, 5280);
    }

    public static function get CENTIMETER():Unit 
	{
      return new Unit("centimeter", "distance", METER, .01);
    }

    public static function get METER():Unit 
	{
      return new Unit("meter", "distance");
    }

    public static function get KILOMETER():Unit 
	{
      return new Unit("kilometer", "distance", METER, 1000);
    }

    public function get name():String 
	{
      return _sUnitName;
    }

    public function get category():String 
	{
      return _sUnitCategory;
    }

    public function get baseUnit():Unit 
	{
      return _uBaseUnit;
    }

    public function get multiplier():Number 
	{
      return _nMultiplier;
    }

    public function get label():String 
	{
      return _sLabelSingular;
    }

    public function get labelPlural():String 
	{
      return _sLabelPlural;
    }

    public function Unit(sUnitName:String
	, sUnitCategory:String
	, uBaseUnit:Unit = null
	, nMultiplier:Number = 1
	, sLabelSingular:String = null
	, sLabelPlural:String = null) 
	{
      _sUnitName = sUnitName;
      _sUnitCategory = sUnitCategory;
      _uBaseUnit = (uBaseUnit == null) ? this : uBaseUnit;
      _sLabelSingular = (sLabelSingular == null) ? sUnitName : sLabelSingular;
      _sLabelPlural = (sLabelPlural == null) ? _sLabelSingular + "s" : sLabelPlural;
      _nMultiplier = nMultiplier;
    }

    public function getConverterTo(uUnit:Unit):Converter 
	{
      if (uUnit.category != _sUnitCategory) 
	  {
        return null;
      }
      else 
	  {
        return new Converter(this, uUnit);
      }
    }

    public function getConverterFrom(uUnit:Unit):Converter 
	{
      if (uUnit.category != _sUnitCategory) 
	  {
        return null;
      }
      else 
	  {
        return new Converter(uUnit, this);
      }
    }
  }
}