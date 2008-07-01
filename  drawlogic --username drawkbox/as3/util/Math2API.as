/**
* ...
* @author Default
* @version 0.1
*/

package drawlogic.as3.util
{

	import flash.geom.Point;
	import flash.display.*;
	//import Human;
	//import Relation;

	public class Math2API 
	{


		public static function Random(Min:Number=0,Max:Number=1,Round:Boolean=false,Interval:Number=1) {

			///////Variables

			var Min:Number;
			//Min: holds minimum value of number

			var Max:Number;
			//Min: holds maximum value of number

			var Round:Boolean;
			//Round: determines whether the result will be rounded

			var Interval:Number;
			//RoundInterval: the number to round to

			var ReturnValue:Number;
			//ReturnValue: holds the number returned to the calling function

			///////Function

			ReturnValue=Math.random() * (Max - Min) + Min;


			if (Round) {
				ReturnValue=Math.round(ReturnValue / Interval);
				ReturnValue*= Interval;
			}

			return ReturnValue;
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*		public static function PickChance(... Num) {

			///////Variables

			var i:uint=new uint;
			//i: used in for..loops

			var Sum:Number=new Number;
			//Sum: used to check the sum of the numbers

			var Boundaries:Array=new Array;
			//Boundaries: determines each choice's boundary

			var Random:Number=new Number;
			//Random: holds value of the number to choose

			///////Function

			if (Num.length > 0) {
				Sum=0;
				checking:for (i=0; i < Num.length; i++) {
					if (Num[i] is Number) {
						Sum+= Num[i];
						Boundaries[i]=Sum;
					} else {
						break checking;
					}
				}
				if (Sum > 0) {
					Random=Math2.Random(0,Sum,false);
					for (i=0; i < Num.length; i++) {
						if (Random <= Boundaries[i]) {
							return i;
						}
					}
				}
			}
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public static function ChangePoint(point:Point,origin:DisplayObjectContainer,target:DisplayObjectContainer):Point {

			///////Variables

			var point:Point;
			//point: original point

			var origin:DisplayObjectContainer;
			//origin: the object which the point is relative to

			var target:DisplayObjectContainer;
			//target: object to which the point is "relativized"

			///////Function

			return target.globalToLocal(origin.localToGlobal(point));

		}
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public static function CheckArray(array:Array,val:*):int {

			///////Variables

			var array:Array;
			//array: the array to check for the specified object, value, etc.

			var val:*;
			//val: the object, value, etc. to search for

			var i:uint;
			//i: used in the for..loop

			var returnValue:int = -1;
			//returnValue: the value returned by the function (Default = -1)

			///////Function

			ArrayCheck:for (i = 0; i < array.length; i++) {
				if (array[i] == val) {
					returnValue = i;
					break ArrayCheck;
				}
			}
			return returnValue;
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public static function CheckID(id:uint):int {

			///////Variables

			var id:uint;
			//id: the ID to look for in the people's array

			var array:Array = Human.People;
			//array: the array to look inside

			var person:Human;
			//person: used to hold temp values of people to compare

			var ReturnValue:int = -1;
			//ReturnValue: the value to return

			var i:uint;
			//i: used in for..loops

			///////Function

			IDCheck:for (i = 0; i < array.length; i++) {
				person = array[i] as Human;
				if (person.ID == id) {
					ReturnValue = i;
					break IDCheck;
				}
			}
			return ReturnValue;
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public static function CheckRelations(relationType:String):int {

			///////Variables
			trace(Human,Relation,Relationship);
			var relationType:String;
			//relationType: the relation to look for in the relations array

			var array:Array = Relation.Relations;
			//array: the array to look inside

			var relation:Relation;
			//relation: used to hold temp values of relations to compare

			var ReturnValue:int = -1;
			//ReturnValue: the value to return

			var i:uint;
			//i: used in for..loops

			///////Function

			RelationCheck:for (i = 0; i < array.length; i++) {
				relation = array[i] as Relation;
				if (relation.Type == relationType) {
					ReturnValue = i;
					break RelationCheck;
				}
			}
			return ReturnValue;
		}*/
	}
}


/*

public class Relation 
{
	

		private var vType:String;
		//vType: describes the type of relationship (eg. parent)

		private var vOpposeType:Array;
		//vOpposeType: describes the type of relationships possible (eg. sibling)

		private var vInitRelationship:int;
		//vInitRelationship: stores the starting relationship value

		private var vInitAssociation:uint;
		//vInitAssociation: stores the starting association value

		private var vStatic:Boolean;
		//vStatic: determines whether the relationship type is subject to change or not

		public static var Relations:Array = new Array();
		//Relations: stores all relations

		private static var Begin:* = defineRelations();
		//Begin: used to define relations beforehand


		public function Relation(type:String) {
			Type = type;
		}

		public function get Type():String {
			return vType;
		}
		public function set Type(type:String) {
			if (type == null || type == "") {
				GameError.InvalidValue("Type","String",type);
			} else {
				vType = type;
			}
		}

		public function get InitRelationship():int {
			return vInitRelationship;
		}
		public function set InitRelationship(initRelationship:int) {
			if (InitRelationship >= -100 && InitRelationship <= 100) {
				vInitRelationship = initRelationship;
			} else {
				GameError.InvalidRange(initRelationship,"int",-100,true,100,true);
			}
		}

		public function get InitAssociation():uint {
			return vInitAssociation;
		}
		public function set InitAssociation(initAssociation:uint) {
			if (InitAssociation >= 0 && InitAssociation <= 100) {
				vInitAssociation = initAssociation;
			} else {
				GameError.InvalidRange(initAssociation,"integer",0,true,100,true);
			}
		}

		public function get Static():Boolean {
			return vStatic;
		}
		public function set Static($static:Boolean) {
			if ($static == true || $static == false) {
				vStatic = $static;
			} else {
				GameError.InvalidValue("Static","Boolean",$static);
			}
		}


		public function addOpposeType(...relation) {
			for(var i = 0 ; i < relation.length ; i++) {
			var val:int = Math2.CheckArray(Relations,relation);
			if (val == -1) {
				vOpposeType.push(relation[i]);
			} else {
				GameError.DuplicateRelation(relation[i]);
			}
			}
		}

		public static function getRelation(relation:String):Relation {
			var val:int = Math2.CheckRelations(Relations,relation);

			if (val == -1) {
				GameError.InvalidRelation(relation);
			}return Relations[relation];
		}

		private static function defineRelations() {
			createRelation("Father" , 60 , 60 , true);
			createRelation("Mother" , 60 , 60 , true);
			createRelation("Son" , 80 , 70 , true);
			createRelation("Daughter" , 80 , 70 , true);
			createRelation("Grandfather" , 60 , 50 , true);
			createRelation("Grandmother" , 60 , 50 , true);
			createRelation("Grandson" , 70 , 70 , true);
			createRelation("Granddaughter" , 70 , 70 , true);
			createRelation("Brother" , 80 , 80 , true);
			createRelation("Sister" , 80 , 80 , true);
			createRelation("Uncle" , 50 , 50 , true);
			createRelation("Aunt" , 50 , 50 , true);
			createRelation("Nephew" , 60 , 50 , true);
			createRelation("Niece" , 60 , 50 , true);
			createRelation("Cousin" , 50 , 50 , true);
			createRelation("In-law" , 50 , 40 , false);
			createRelation("Ally " , 40 , 30 , false);
			createRelation("Friend" , 60 , 60 , false);
			createRelation("Best Friend" , 80 , 90 , false);
			createRelation("No Relation" , 0 , 0 , false);
			createRelation("Opponent" , -20 , 30 , false);
			createRelation("Rival" , -50 , 50 , false);
			createRelation("Enemy" , -80 , 80 , false);
			createRelation("Crush" , 70 , 40 , false);
			createRelation("Boy Friend" , 70 , 50 , false);
			createRelation("Girl Friend" , 80 , 50 , false);
			createRelation("Fiancé" , 80 , 80 , false);
			createRelation("Fiancée" , 80 , 80 , false);
			createRelation("Husband" , 90 , 90 , false);
			createRelation("Wife" , 90 , 90 , false);

			getRelation("Father").addOpposeType(getRelation("Son"),getRelation("Daughter"));
			getRelation("Mother").addOpposeType(getRelation("Son"),getRelation("Daughter"));
			getRelation("Son").addOpposeType(getRelation("Father"),getRelation("Mother"));
			getRelation("Daughter").addOpposeType(getRelation("Father"),getRelation("Mother"));
			getRelation("Grandfather").addOpposeType(getRelation("Grandson"),getRelation("Granddaughter"));
			getRelation("Grandmother").addOpposeType(getRelation("Grandson"),getRelation("Granddaughter"));
			getRelation("Grandson").addOpposeType(getRelation("Grandfather"),getRelation("Grandmother"));
			getRelation("Granddaughter").addOpposeType(getRelation("Grandfather"),getRelation("Grandmother"));
			getRelation("Brother").addOpposeType(getRelation("Brother"),getRelation("Sister"));
			getRelation("Sister").addOpposeType(getRelation("Brother"),getRelation("Sister"));
			getRelation("Uncle").addOpposeType(getRelation("Nephew"),getRelation("Niece"));
			getRelation("Aunt").addOpposeType(getRelation("Nephew"),getRelation("Niece"));
			getRelation("Nephew").addOpposeType(getRelation("Uncle"),getRelation("Aunt"));
			getRelation("Niece").addOpposeType(getRelation("Uncle"),getRelation("Aunt"));
			getRelation("Cousin").addOpposeType(getRelation("Cousin"));
			getRelation("In-law").addOpposeType(getRelation("In-law"));
			getRelation("Ally").addOpposeType(getRelation("Ally"),getRelation("Friend"),getRelation("Crush"));
			getRelation("Friend").addOpposeType(getRelation("Ally"),getRelation("Crush"));
			getRelation("Best Friend").addOpposeType(getRelation("Best Friend"),getRelation("Crush"));
			getRelation("No Relation").addOpposeType(getRelation("No Relation"),getRelation("Crush"));
			getRelation("Opponent").addOpposeType(getRelation("Opponent"),getRelation("Rival"));
			getRelation("Rival").addOpposeType(getRelation("Opponent"),getRelation("Rival"),getRelation("Enemy"));
			getRelation("Enemy").addOpposeType(getRelation("Rival"),getRelation("Enemy"));
			getRelation("Crush").addOpposeType(getRelation("No Relation"),getRelation("Ally"),getRelation("Friend"),getRelation("Best Friend"),getRelation("Crush"));
			getRelation("BoyFriend").addOpposeType(getRelation("Girlfriend"));
			getRelation("Girlfriend").addOpposeType(getRelation("Boyfriend"));
			getRelation("Fiancé").addOpposeType(getRelation("Fiancée"));
			getRelation("Fiancée").addOpposeType(getRelation("Fiancée"));
			getRelation("Husband").addOpposeType(getRelation("Wife"));
			getRelation("Wife").addOpposeType(getRelation("Husband"));
		}

		private static function createRelation(type:String,initRel:int,initAssoc:uint,$static:Boolean) {
			var relation:Relation = new Relation(type);
			relation.InitRelationship = initRel;
			relation.InitAssociation = initAssoc
			relation.Static = $static;

			Relations.push(relation);
		}
	}
}*
}*/