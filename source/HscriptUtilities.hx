package;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.system.scaleModes.*;
import hscript.Interp;
import hscript.Parser;
import openfl.display.StageScaleMode;
import sys.io.File;
import sys.FileSystem;
import flixel.util.FlxColor;
class HscriptUtilities{
    public var interp:Interp;
    public var parser:Parser;
    public function new(){};
    public function init(self:Dynamic){ 
        interp = new Interp();
        parser = new Parser();
        set("self", self);
        set("FlxG", FlxG);
        set("SONG", PlayState.SONG);
        set("isStoryMode", PlayState.isStoryMode);
        set("curStage", PlayState.curStage);
        set("ModFolder", PlayState.curmodfolder);
        set("ModFolder", PlayState.curmodfolder);
        set("FlxSprite", FlxSprite);
        set("ChangeRez", ScaleShit.ReScale);
        set("Paths", Paths);
        set('Math', Math);
        set('File', File);
        set('FileSystem', FileSystem);
	}
    public function execute(code:String){
        interp.execute( parser.parseString(code, ".hx") );
    }
    public function set(Key:String,Var:Dynamic){
        interp.variables.set(Key, Var);
    }
    public function RunFunct(Function:String){
        var func = interp.variables.get(Function);
        if(func != null){
            func();
        }
    }
    public function FunctExists(Function:String):Bool{
        var func = interp.variables.get(Function);
        if (func != null){
            return true;//why does this exist doe LOL
        }
        return false;
    }
    //funny stuff will be added later lols
}