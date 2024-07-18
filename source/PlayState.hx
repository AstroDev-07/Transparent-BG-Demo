package;

import Sys;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSplash;
import flixel.text.FlxText;
import openfl.Lib;

class PlayState extends FlxState
{
	private var dialog:Array<String>;
	private var dialogIndex:Int;
	private var dialogText:FlxText;
	private var char:FlxSprite;

	override public function create()
	{
		super.create();

		dialog = [
			"Heya, Player.",
			"Wanna see something cool?",
			"I CONTROL THIS SYSTEM NOW",
			"Goodbye.",
			""
		];
		dialogIndex = 0;

		// create sprite
		char = new FlxSprite(500, 500);
		char.loadGraphic("assets/images/chara.png");
		add(char);

		// create dialog
		dialogText = new FlxText(525, 725, dialog[dialogIndex]);
		dialogText.setFormat(null, 32, 0xFFFFFF, "center");
		add(dialogText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if(FlxG.keys.justPressed.SPACE){
			dialogIndex++;
			if(dialogIndex < dialog.length){
				dialogText.text = dialog[dialogIndex];
			}
			if(dialogIndex == 2){
				makeStageTrans(); 
			}
			if(dialogIndex == 4){
				#if neko
				Sys.exit(0);
				#end 
				#if windows
				Sys.exit(0);
				#end
			}
		}
	}

	private function makeStageTrans():Void {
		Lib.current.stage.color = 0x000000;
		Lib.current.stage.alpha = 0;
	}
}
