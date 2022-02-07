package;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.keyboard.FlxKey;
/**
 * ...
 * @author ...
 */
using StringTools;
class ControlSettings extends MusicBeatSubstate
{
	var curSelected:Int = 0;
	
	private var grpControls:FlxTypedGroup<Alphabet>;
	public var controlsStrings:Array<String>;
	public var awaitingkey:Bool = false;
	public function new(){
		super();
	}
	override function create(){

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);
		trace(CoolUtil.coolTextFile(Paths.txt('controls')));
		controlsStrings = CoolUtil.coolTextFile(Paths.txt('controls'));
		for (i in 0...controlsStrings.length)
		{
			var label2:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
			label2.ID = i;
			label2.isMenuItem = true;
			label2.targetX = 0;
			label2.targetX = 4.5;
			label2.scrollFactor.set( 0, 0.15);
			grpControls.add(label2);
		}
		changeSelection(0);
	}
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if(!awaitingkey){
			if (FlxG.keys.justPressed.ESCAPE){
				FlxG.state.closeSubState();
			}
			if (FlxG.keys.justPressed.DOWN){
				changeSelection(1);
			}
			if (FlxG.keys.justPressed.UP){
				changeSelection(-1);
			}
			if (FlxG.keys.justPressed.ENTER){ //&& !Options.SettingsMap.exists(grpControls.members[curSelected]._curText)){
				awaitingkey = true;
				
			}
		}else{
			
			if (FlxG.keys.justPressed.ESCAPE){
				FlxG.state.closeSubState();
			}
			var keyPressed:Int = FlxG.keys.firstJustPressed();
			if (keyPressed > -1) {
				Options.keyBinds.set(controlsStrings[curSelected].trim(), keyPressed);
				PlayerSettings.player1.setKeyboardScheme( Controls.KeyboardScheme.Custom);
				Options.saveKeys();
				awaitingkey = false;
			}
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
			}
			if (item.ID == curSelected){
				trace(item.getGraphicMidpoint().y);
			}
		}
	}
	
}