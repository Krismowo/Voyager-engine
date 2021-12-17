package;
import haxe.Json;
import sys.FileSystem;
import lime.utils.Assets;
typedef ModJson = {
    var Songs:Array<String>;
    var OverrideSplash:Bool;
    var Icons:Array<String>;
}
typedef SongStuff = {
    var SongNames:Array<String>;
    var modDirectory:String;
    var Icons:Array<String>;
}
class Mods{
    public static var Songs:Array<SongStuff> = [];
    public static function init(){
        for(file in FileSystem.readDirectory("mods/")){
            trace("mods/" + file);
            if(Assets.exists("mods/" + file + "/pack.json")){
                var json:ModJson = Json.parse(Assets.getText("mods/" + file + "/pack.json"));
            
                var songshit:SongStuff = {
                    SongNames: json.Songs,
                    modDirectory: file,
                    Icons: json.Icons
                };
                Songs.push(songshit);
                }
            }
    }
}   