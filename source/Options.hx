package;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
class Options
{
	public static var SettingsArr:Array<Array<Dynamic>> = [
	["Caching", "sets wether or not we should cache stuff", false],
	["Controls", "use this to set your controls for in battle", "nya"]
	]; 
	public static var keyBinds:Map<String, FlxKey> = [
		'KeyLeft'		=> LEFT,
		'KeyDown'		=> DOWN,
		'KeyUp'		=> UP,
		'KeyRight'	=> RIGHT,
		
		'KeyLeftAlt' => A,
		'KekRightAlt' => D,
		'KeyDowntAlt' => S,
		'KeyUptAlt' => W,
	];
	public static function init(?forceresetopts:Bool = false){
		if (FlxG.save.data.KeyUp == null || forceresetopts){
			trace("uhoh");
			FlxG.save.data.KeyUp =  UP;
			FlxG.save.data.KeyLeft = LEFT;
			FlxG.save.data.KeyDown = DOWN;
			FlxG.save.data.KeyRight = RIGHT;
			
			FlxG.save.data.KeyUpAlt = W;
			FlxG.save.data.KeyLeftAlt = A;
			FlxG.save.data.KeyDownAlt = S;
			FlxG.save.data.KeyRightAlt = D;
			FlxG.save.flush();
		}
		keyBinds.set("KeyUp", FlxG.save.data.KeyUp);
		keyBinds.set("KeyDown", FlxG.save.data.KeyDown);
		keyBinds.set("KeyLeft", FlxG.save.data.KeyLeft);
		keyBinds.set("KeyRight", FlxG.save.data.KeyRight);
		keyBinds.set("KeyUpAlt", FlxG.save.data.KeyUpAlt);
		keyBinds.set("KeyDownAlt", FlxG.save.data.KeyDownAlt);
		keyBinds.set("KeyLeftAlt", FlxG.save.data.KeyLeftAlt);
		keyBinds.set("KeyRightAlt", FlxG.save.data.KeyRightAlt);
	}
	public static function saveKeys(){
		FlxG.save.data.KeyUp =  keyBinds.get("KeyUp");
		FlxG.save.data.KeyLeft = keyBinds.get("KeyLeft");
		FlxG.save.data.KeyDown = keyBinds.get("KeyDown");
		FlxG.save.data.KeyRight = keyBinds.get("KeyRight");
		
		FlxG.save.data.KeyUpAlt = keyBinds.get("KeyUpAlt");
		FlxG.save.data.KeyLeftAlt = keyBinds.get("KeyLeftAlt");
		FlxG.save.data.KeyDownAlt = keyBinds.get("KeyDownAlt");
		FlxG.save.data.KeyRightAlt = keyBinds.get("KeyRightAlt");
		FlxG.save.flush();
	}
}
