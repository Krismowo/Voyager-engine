package;

import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

class OptionsMenu extends MusicBeatState
{
	var curSelected:Int = 0;

	private var grpControls:FlxTypedGroup<Alphabet>;
	override function create()
	{//File.saveContent(path, fileStr); for later
	
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.23));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		
		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);
		for (i in 0...Options.SettingsArr.length)
		{
			var optionthing:Alphabet = new Alphabet(0, (70 * i),Options.SettingsArr[i][0], true, false );
			optionthing.isMenuItem = true;
			optionthing.targetY = i;
			grpControls.add(optionthing);
		}
		changeSelection(0);
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER){
			trace(grpControls.members[curSelected].text);
			switch(grpControls.members[curSelected].text){
				case "Controls":
					openSubState(new ControllSettings());
			}
		}
		if (FlxG.keys.justPressed.ESCAPE){
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.DOWN){
			changeSelection(1);
		}
		if (FlxG.keys.justPressed.UP){
			changeSelection(-1);
		}
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}
