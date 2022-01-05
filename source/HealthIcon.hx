package;

import sys.io.File;
import sys.FileSystem;
import lime.utils.Assets;
import flixel.FlxSprite;

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
		if(modfolder == ""){
			modfolder = PlayState.curmodfolder;
		}
		var path:String = "assets/images/icons/icon-" + char +".png";
		if(FileSystem.exists("mods/" + modfolder + "/images/icons/icon-" + char + ".png")){
			path = "mods/" + modfolder + "/images/icons/icon-" + char + ".png";
		}else if(!Assets.exists(path))
			path = "assets/images/icons/icon-face.png";
		
		loadGraphic(Paths.LoadImage(path), true, 150, 150);

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
