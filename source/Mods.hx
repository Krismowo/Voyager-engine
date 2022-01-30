package;
import sys.io.File;
import haxe.Json;
import sys.FileSystem;
typedef ModJson = {
    var Songs:Array<SongsShiz>;
    var AddsSplashes:Bool;
    var Stages:Array<String>;
    var Characters:Array<String>;
    var GfVersions:Array<String>;
    var CustomDifficulties:Array<String>;
}
typedef SongStuff = {
    var SongNames:Array<String>;
    var modDirectory:String;
    var Icons:Array<String>;
}
typedef SongsShiz = {
	var SongName:String;
	var Icon:String; 
}
typedef ModItem = {
	var ItemName:String;
	var ModPath:String;
}
class Mods{
    public static var Songs:Array<SongStuff>;
    public static var Splashes:Array<Array<String>>;
    public static var Stages:Array<ModItem>;
    public static var Characters:Array<ModItem>;
    public static var GfVersions:Array<ModItem>;
    public static var CustomDifficulties:Array<String>;
	public static function GetPath(Name:String, ModArr:Array<ModItem>){
		for (i in ModArr){
			if (i.ItemName == Name ){
				return i;
			}
		}
		var nya:ModItem = {ItemName:"", ModPath:""};
		return nya;
	}
    public static function init(){
        Songs = [];
        Splashes = [];
        Stages = [];
        Characters = [];
        GfVersions = [];
        CustomDifficulties = [];
        for(file in FileSystem.readDirectory("mods/")){
            trace("mods/" + file);
            if(FileSystem.exists("mods/" + file + "/pack.json")){
                var json:ModJson = Json.parse(File.getContent("mods/" + file + "/pack.json"));
				var actualsongs:Array<String> = [];
				for (song in 0...json.Songs.length){
					actualsongs.push(json.Songs[song].SongName);
				}
				var IconShit:Array<String> = [];
				for (song in 0...json.Songs.length){
					IconShit.push(json.Songs[song].Icon);
				}
            
                var songshit:SongStuff = {
                    SongNames: actualsongs,
                    modDirectory: file,
                    Icons:IconShit
                };
                Songs.push(songshit);
                if(json.AddsSplashes){
                    var splashes = File.getContent("mods/" + file + "/Splashes.txt").split("\n");
                    for(i in splashes){
                        Splashes.push(i.split("--"));
                    }
                }
                for (i in json.Stages){
				   var chrshi:ModItem = {ItemName:i,ModPath:file};
                   Stages.push(chrshi);
                }
                for (i in json.Characters){
				   var chrshi:ModItem = {ItemName:i,ModPath:file};
                   Characters.push(chrshi);
                }
                for (i in json.GfVersions){
				   var chrshi:ModItem = {ItemName:i,ModPath:file};
                   GfVersions.push(chrshi);
                }
                for (i in json.CustomDifficulties){
                   CustomDifficulties.push(i);
                } 
            }
        }
    }
}   