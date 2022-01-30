package;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class ControlSettings extends MusicBeatSubstate
{
	var curSelected:Int = 0;
	
	private var grpControls:FlxTypedGroup<Alphabet>;
	public var controlsStrings:Array<String>;
	public function new(){
		super();
	}
	override function create(){
		var transbg:FlxSprite = new FlxSprite(0, 0).makeGraphic( FlxG.width, FlxG.height, 0xFF000000);
		transbg.alpha = 0.6;
		add(transbg);
		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);
		controlsStrings = CoolUtil.coolTextFile(Paths.txt('controls'));
		for (i in 0...controlsStrings.length)
		{
			if (controlsStrings[i].indexOf('set') != -1)
			{
				var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i].substring(3), true, false);
				controlLabel.isMenuItem = true;
				var label2:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i + 1], false, false);
				label2.isMenuItem = true;
				controlLabel.targetY = i;
				label2.targetY = i + 1;
				//controlLabel.x += 50;
				grpControls.add(label2);
				grpControls.add(controlLabel);
			}
		}
	}
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ESCAPE){
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.DOWN){
			changeSelection(1);
		}
		if (FlxG.keys.justPressed.UP){
			changeSelection(-1);
		}
		if (FlxG.keys.justReleased.ENTER && !Options.SettingsMap.exists(grpControls.members[curSelected]._curText)){
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