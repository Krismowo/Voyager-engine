package;

import lime.utils.Assets;
#if sys
import sys.io.File;
#end
using StringTools;

class CoolUtil
{
	public static var difficultyArray:Array<String> = ['EASY', "NORMAL", "HARD"];

	public static function difficultyString(diff:Int = 1):String
	{
		return difficultyArray[diff];
	}

	public static function coolTextFile(path:String, mod:Bool = false):Array<String>
	{
		var daList:Array<String>;
		#if sys
		if (mod)
			daList = File.getContent(path).trim().split('\n');
		else
		#end 
			daList = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}
}
