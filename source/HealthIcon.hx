package;
import openfl.utils.AssetType;
import sys.io.File;
import sys.FileSystem;
import lime.utils.Assets;
import flixel.FlxSprite;
import openfl.utils.Assets;
import flixel.FlxG;
import flixel.FlxG;
using StringTools;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	var loaded:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false, ?modfolder:String = '')
	{
		super();
		trace(char);
		antialiasing = true;
		trace("fucking exists istg");
		var icnpath = "images/icons/icon-" + char + ".png";
		if (!FileSystem.exists(Paths.modpath(icnpath)))
			if (FileSystem.exists(Paths.modpath(icnpath.replace(".png", "-pixel.png"))))
				icnpath = icnpath.replace(".png", "-pixel.png");
			else
				icnpath = "images/icons/icon-face.png";

		if (icnpath.endsWith("pixel.png"))
			antialiasing = false;
		trace(icnpath);
		loadGraphic(FlxG.bitmap.add(Paths.LoadImage(Paths.modpath(icnpath))), true, 150, 150);

		//antialiasing = true;
		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
