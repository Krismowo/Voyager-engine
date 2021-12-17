package;
import flixel.FlxSprite;
import flixel.FlxState;
import hscript.Interp;
import hscript.Parser;
class HscriptUtilities{
    public var interp:Interp;
    public var parser:Parser;
    public function init(Play:FlxState){ //haha im doing stuff that things like psych engine cant cus lua sucks and his lua things code is unreadable (the engine is still good i just hate how some things arent that readable LOL)
        interp = new Interp();
        parser = new Parser();
        set("PlayState", Play);
        set("SONG", PlayState.SONG);
        set("isStoryMode", PlayState.isStoryMode);
        set("curStage", PlayState.curStage);
        set("FlxSprite", FlxSprite);
        set("add", Play.add);
        set("Paths", Paths);
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
    //funny stuff will be added later lols
}