import flixel.FlxSprite;

var nyah = new FlxSprite(0,0).loadGraphic(Paths.LoadImage("mods/" + ModFolder + "/images/EgStBvNXoAIvaGY.jpg"));
function init(){
    add(nyah);
}
function update(){
    trace("update lol");
    var curanim = self.dad.HscriptCharacter.interp.variables.get("curAnimName");
    if(curanim != null){

    }
}
function beatHit(){
    trace("beat hit lmao");
}
function stepHit(){
    trace("lol yall stepped");
}