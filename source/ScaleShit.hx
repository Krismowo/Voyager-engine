package;

/**
 * ...
 * @author ...
 */
import flixel.FlxG;
import flixel.system.scaleModes.*;
class ScaleShit 
{

	public function new() 
	{
		
	}
	public static function ReScale(Width:Int, Height:Int, scaletype:String = "Base", OptionalShit:Array<Dynamic>){
		switch(scaletype){
			case "Base":
				FlxG.scaleMode = new BaseScaleMode();
			case "FullScreen":
				if(OptionalShit[0] != true){
					FlxG.fullscreen = true;
					ReScale(Width, Height, OptionalShit[0], [true]);
					return;
				}
			case "Ratio": //twitter
				FlxG.scaleMode = new RatioScaleMode(OptionalShit[0] );
			case "PixelPerfect":
				FlxG.scaleMode = new PixelPerfectScaleMode();
			case "Fixed":
				FlxG.scaleMode = new FixedScaleAdjustSizeScaleMode( OptionalShit[0], OptionalShit[1]);
			case "Fill":
				FlxG.scaleMode = new FillScaleMode();
			case "Relative":
				FlxG.scaleMode = new RelativeScaleMode( cast Width, cast Height);
		}
		//FlxG.scaleMode = new RatioScaleMode(true);
	
		for(i in FlxG.cameras.list){
			i.camera.zoom = 1280 / Width;
			
		}
		if(scaletype != "Fixed"){
			FlxG.resizeWindow(Width, Height);
			if (scaletype == "StageSize")
				FlxG.scaleMode = new StageSizeScaleMode();
			FlxG.resizeGame(Width, Height);		
		}
		//FlxCamera.defaultZoom = ();
	}
	
}