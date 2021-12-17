package;

import haxe.io.Path;
import Section.SwagSection;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;

using StringTools;

typedef SwagSong =
{
	var song:String;
	var notes:Array<SwagSection>;
	var bpm:Int;
	var needsVoices:Bool;
	var speed:Float;

	var player1:String;
	var player2:String;
	var validScore:Bool;
	var stage:String;
}

class Song
{
	public var song:String;
	public var notes:Array<SwagSection>;
	public var bpm:Int;
	public var needsVoices:Bool = true;
	public var speed:Float = 1;

	public var player1:String = 'bf';
	public var player2:String = 'dad';
	public var stage:String = "stage";

	public function new(song, notes, bpm)
	{
		this.song = song;
		this.notes = notes;
		this.bpm = bpm;
	}

	public static function loadFromJson(jsonInput:String, ?folder:String, ?mods:Bool = false, ?modfolder:String = ''):SwagSong
	{
		var startFolder = mods ? "mods" : "assets";
		var rawJson = Assets.getText(startFolder + modfolder + "/data/" + folder.toLowerCase() + '/' + jsonInput.toLowerCase() + ".json").trim();
		/*dumb explination here, first we have the game check through all da folders within the mods 
		folder then if it has the json we are looking for we break outta the loop with da json,
		if not it will end up with a normal game json from da files*/
		var modjson:Bool = false;
		/*
		for(i in sys.FileSystem.readDirectory("mods/") ){
			trace("mods/" + i + "/data/" + folder.toLowerCase() + "/" + jsonInput.toLowerCase() + ".json" + " " + Assets.exists("mods/" + i + "/data/" + folder.toLowerCase() + "/" + jsonInput.toLowerCase() + ".json"));
			if(Assets.exists("mods/" + i + "/data/" + folder.toLowerCase() + "/" + jsonInput.toLowerCase() + ".json")){
				rawJson = Assets.getText("mods/" + i + "/data/" + folder.toLowerCase() + "/" + jsonInput.toLowerCase() + ".json").trim();
				modjson = true;
				break;
			}else if(!modjson){
				if(Assets.exists("assets/data/" + folder.toLowerCase() + '/' + jsonInput.toLowerCase() + ".json"))
					rawJson = Assets.getText("assets/data/" + folder.toLowerCase() + '/' + jsonInput.toLowerCase() + ".json").trim();
			}else{
				trace("bitch");
			}
		}*/
		//if(Assets.exists("mods/"))
		while (!rawJson.endsWith("}"))
		{
			rawJson = rawJson.substr(0, rawJson.length - 1);
			// LOL GOING THROUGH THE BULLSHIT TO CLEAN IDK WHATS STRANGE
		}
		return parseJSONshit(rawJson);
	}

	public static function parseJSONshit(rawJson:String):SwagSong
	{
		var swagShit:SwagSong = cast Json.parse(rawJson).song;
		swagShit.validScore = true;
		return swagShit;
	}
}
