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
import flixel.FlxObject;

class OptionsMenu extends MusicBeatState 
{
	var curSelected:Int = 0;
	private var grpOptions:FlxTypedGroup<Alphabet>;
	override function create()
	{//File.saveContent(path, fileStr); for later
		var blaccground = new FlxSprite((FlxG.width / 2), 0).makeGraphic(FlxG.width, FlxG.height, 0xFFffff73);
		blaccground.scrollFactor.x = 0;
		blaccground.scrollFactor.y = 0;
		blaccground.alpha = 0.45;
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0xFF73ff8f;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.23));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		menuBG.scrollFactor.y = 0.12;
		menuBG.scrollFactor.x = 0;
		add(menuBG);
		add(blaccground);
		var devider = new FlxSprite(0, 0).makeGraphic( 15, FlxG.height, FlxColor.BLACK);
		devider.x = (FlxG.width / 2) - (devider.width / 2);
		add(devider);

		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);
		for (i in 0...Options.SettingsArr.length)
		{
			var optionthing:Alphabet = new Alphabet(0, (70 * i),Options.SettingsArr[i][0], true, false );
			optionthing.isMenuItem = true;
			optionthing.targetY = i / 2;
			optionthing.targetX = 1;
			optionthing.scrollFactor.set( 0, 0.15);
			grpOptions.add(optionthing);
		}
		changeSelection(0);
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER){
			trace(grpOptions.members[curSelected].text);
			switch(grpOptions.members[curSelected].text){
				case "Controls":
					openSubState(new ControlSettings());
			}
		}
		if (FlxG.keys.justPressed.ESCAPE){
			if (this._requestedSubState != null)
				closeSubState();
			else
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
			curSelected = grpOptions.length - 1;
		if (curSelected >= grpOptions.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
	function closesub(){
		closeSubState();
	}
}
