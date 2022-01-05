package;
import sys.io.File;
import haxe.Json;
import sys.FileSystem;
typedef ModJson = {
    var Songs:Array<String>;
    var AddsSplashes:Bool;
    var Icons:Array<String>;
    var Stages:Array<String>;
    var Characters:Array<String>;
}
typedef SongStuff = {
    var SongNames:Array<String>;
    var modDirectory:String;
    var Icons:Array<String>;
}
class Mods{
    public static var Songs:Array<SongStuff> = [];
    public static var Splashes:Array<Array<String>> = [];
    public static var Stages:Array<String> = [];
    public static var Characters:Array<String> = [];
    public static function init(){
        for(file in FileSystem.readDirectory("mods/")){
            trace("mods/" + file);
            if(FileSystem.exists("mods/" + file + "/pack.json")){
                var json:ModJson = Json.parse(File.getContent("mods/" + file + "/pack.json"));
            
                var songshit:SongStuff = {
                    SongNames: json.Songs,
                    modDirectory: file,
                    Icons: json.Icons
                };
                Songs.push(songshit);
                if(json.AddsSplashes){
                    var splashes = File.getContent("mods/" + file + "/Splashes.txt").split("\n");
                    for(i in splashes){
                        Splashes.push(i.split("--"));
                    }
                }
               for (i in json.Stages){
                   Stages.push(i);
               }
               for (i in json.Characters){
                   Characters.push(i);
               }
            }
        }
    }
}   