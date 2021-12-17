package;
import haxe.Json;
import sys.FileSystem;
import lime.utils.Assets;
typedef ModJson = {
    var Songs:Array<String>;
    var OverrideSplash:Bool;
}
typedef SongStuff = {
    var SongName:String;
    var modDirectory:String;
}
class Mods{
    public static var Songs:Array<SongStuff> = [];
    public static function init(){
        for(file in FileSystem.readDirectory("mods/")){
            trace("mods/" + file);
            if(Assets.exists("mods/" + file + "/pack.json")){
                var json:ModJson = Json.parse(Assets.getText("mods/" + file + "/pack.json"));
                for(song in 0...json.Songs.length){
                    var songshit:SongStuff = {
                        SongName: json.Songs[song],
                        modDirectory: file
                    };
                    Songs.push(songshit);

                }
            }
        }
    }   
}