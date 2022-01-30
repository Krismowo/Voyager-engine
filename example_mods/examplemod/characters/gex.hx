function init(){
	trace("nya we got it in examplemod");
    self.frames = Paths.getModSparrow("mods/examplemod/images/characters/DADDY_DEAREST");
    self.animation.addByPrefix('idle', 'Dad idle dance', 24);
	self.animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
	self.animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
	self.animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
	self.animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

	self.addOffset("idle");
	self.addOffset("singUP", -6, 50);
	self.addOffset("singRIGHT", 0, 27);
	self.addOffset("singLEFT", -10, 10);
	self.addOffset("singDOWN", 0, -30);

	self.playAnim("idle");
	ChangeRez(500, 480, "FullScreen", ["Fill"]);
}
function playAnim(){
	trace("nya");
}