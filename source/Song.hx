package;

import sys.io.File;
import haxe.io.Path;
import Section.SwagSection;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;
import sys.FileSystem;

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
	var gfVersion:String;
	var validScore:Bool;
	var stage:String;
	var difficulty:String;
}

typedef SongData =
{
	var isModSong:Bool;
	var Directory:String;
	var SongName:String;
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
	public var gfVersion:String = 'gf';
	public var stage:String = "stage";
	public var difficulty = '';

	public function new(song, notes, bpm)
	{
		this.song = song;
		this.notes = notes;
		this.bpm = bpm;
	}

	public static function getSongData(daSong:String):SongData
	{
		var balls:SongData = {
			isModSong: false,
			Directory: '',
			SongName: daSong
		}
		for (i in Mods.Songs){
			for (j in i.SongNames)
				if (daSong == j && FileSystem.exists("mods/" + i.modDirectory + "/songs/" + j + "/Inst.ogg"))
				{
					balls.isModSong = true;
					balls.Directory = i.modDirectory;
					return balls;
				}
		}
		return balls;
	}

	public static function loadFromJson(jsonInput:String, ?songName:String):SwagSong
	{
		var modSong:SongData = getSongData(songName);
		var modfolder:String = '';
		var startFolder:String = modSong.isModSong ? "mods" : "assets";
		if(startFolder == 'mods'){
			PlayState.curmodfolder = modSong.Directory;
			modfolder = "/" + modSong.Directory;
			PlayState.modsongs = true;
		}else{
			PlayState.modsongs = false;
		}
		var rawJson = File.getContent(startFolder + modfolder + "/data/" + songName.toLowerCase() + '/' + jsonInput.toLowerCase() + ".json").trim();
		var modjson:Bool = false;
		
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
