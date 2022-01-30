package;
import flixel.FlxG;
class Options
{
	public static var SettingsMap:Map<String,Dynamic> = new Map<String,Dynamic>();
	public static var SettingsArr:Array<Array<Dynamic>> = [
	["Caching", "sets wether or not we should cache stuff", false],
	["Controls", "use this to set your controls for in battle", "nya"]
	]; 
	public static function init(){
		if (FlxG.save.data.options == null){
			for (i in SettingsArr){
				SettingsMap.set(i[0], i[2]);
			}
			FlxG.save.data.options = SettingsMap;
		}else{
			SettingsMap = FlxG.save.data.options;
			for (i in SettingsArr){
				if (SettingsMap.get(i[0]) == null){
					SettingsMap.set(i[0], i[2]);
				}
			}
			FlxG.save.data.options = SettingsMap;
				
		}
		FlxG.save.flush();
	}
	public static function SaveThing(Varible:Dynamic, Name:String){
		SettingsMap.set(Varible, Name);
		FlxG.save.data.options = SettingsMap;
		FlxG.save.flush();
		
	}
}
