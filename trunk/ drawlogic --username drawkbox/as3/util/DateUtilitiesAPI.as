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
	public class DateUtilitiesAPI 
	{		
		  public static const MILLISECOND:Number = 1;
		  public static const SECOND:Number = MILLISECOND * 1000;
		  public static const MINUTE:Number = SECOND * 60;
		  public static const HOUR:Number = MINUTE * 60;
		  public static const DAY:Number = HOUR * 24;
		  public static const WEEK:Number = DAY * 7;
		
		  public static function addTo(dOriginal:Date, nYears:Number = 0, nMonths:Number = 0, nDays:Number = 0, nHours:Number = 0, nMinutes:Number = 0, nSeconds:Number = 0, nMilliseconds:Number = 0):Date {
		    var dNew:Date = new Date(dOriginal.getTime());
		    dNew.setFullYear(dNew.getFullYear() + nYears);
		    dNew.setMonth(dNew.getMonth() + nMonths);
		    dNew.setDate(dNew.getDate() + nDays);
		    dNew.setHours(dNew.getHours() + nHours);
		    dNew.setMinutes(dNew.getMinutes() + nMinutes);
		    dNew.setSeconds(dNew.getSeconds() + nSeconds);
		    dNew.setMilliseconds(dNew.getMilliseconds() + nMilliseconds);
		    return dNew;
		  }
		
		  private static function elapsedDate(dOne:Date, dTwo:Date = null):Date 
		  {
		    if(dTwo == null) 
			{
		      dTwo = new Date();
		    }
		    return new Date(dOne.getTime() - dTwo.getTime());
		  }
		
		  public static function elapsedMilliseconds(dOne:Date, dTwo:Date = null, bDisregard:Boolean = false):Number {
		    if(bDisregard) 
			{
		      return elapsedDate(dOne, dTwo).getUTCMilliseconds();
		    }
		    else 
			{
		      return (dOne.getTime() - dTwo.getTime());
		    }
		  }
		
		  public static function elapsedSeconds(dOne:Date, dTwo:Date = null, bDisregard:Boolean = false):Number {
		    if(bDisregard) 
			{
		      return (elapsedDate(dOne, dTwo).getUTCSeconds());
		    }
		    else 
			{
		      return Math.floor(elapsedMilliseconds(dOne, dTwo) / SECOND);
		    }
		  }
		
		  public static function elapsedMinutes(dOne:Date, dTwo:Date = null, bDisregard:Boolean = false):Number {
		    if(bDisregard) 
			{
		      return (elapsedDate(dOne, dTwo).getUTCMinutes());
		    }
		    else 
			{
		      return Math.floor(elapsedMilliseconds(dOne, dTwo) / MINUTE);
		    }
		  }
		
		  public static function elapsedHours(dOne:Date, dTwo:Date = null, bDisregard:Boolean = false):Number {
		    if(bDisregard) 
			{
		      return (elapsedDate(dOne, dTwo).getUTCHours());
		    }
		    else 
			{
		      return Math.floor(elapsedMilliseconds(dOne, dTwo) / HOUR);
		    }
		  }
		
		  public static function elapsedDays(dOne:Date, dTwo:Date = null, bDisregard:Boolean = false):Number {
		    if(bDisregard) 
			{
		      return (elapsedDate(dOne, dTwo).getUTCDate());
		    }
		    else 
			{
		      return Math.floor(elapsedMilliseconds(dOne, dTwo) / DAY);
		    }
		  }
		
		  public static function elapsedMonths(dOne:Date, dTwo:Date = null, bDisregard:Boolean = false):Number {
		    if(bDisregard) 
			{
		      return (elapsedDate(dOne, dTwo).getUTCMonth());
		    }
		    else 
			{
		      return (elapsedDate(dOne, dTwo).getUTCMonth() + elapsedYears(dOne, dTwo) * 12);
		    }
		  }
		
		  public static function elapsedYears(dOne:Date, dTwo:Date = null):Number 
		  {
		    return (elapsedDate(dOne, dTwo).getUTCFullYear() - 1970);
		  }
		
		  public static function elapsed(dOne:Date, dTwo:Date = null):Object 
		  {
		    var oElapsed:Object = new Object();
		    oElapsed.years = elapsedYears(dOne, dTwo);
		    oElapsed.months = elapsedMonths(dOne, dTwo, true);
		    oElapsed.days = elapsedDays(dOne, dTwo, true);
		    oElapsed.hours = elapsedHours(dOne, dTwo, true);
		    oElapsed.minutes = elapsedMinutes(dOne, dTwo, true);
		    oElapsed.seconds = elapsedSeconds(dOne, dTwo, true);
		    oElapsed.milliseconds = elapsedMilliseconds(dOne, dTwo, true);
		    return oElapsed;
		  }	
	}
}