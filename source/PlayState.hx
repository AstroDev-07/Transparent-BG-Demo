package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

// window imports
import lime.app.Application;
import lime.ui.Window;
import FlxTransWindow;

class PlayState extends FlxState
{
    private var dialog:Array<String>;
    private var dialogIndex:Int;
    private var dialogText:FlxText;
    private var char:FlxSprite;
	private var bg:FlxSprite;

    override public function create():Void
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

		var bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.fromRGB(1, 1, 1));
		add(bg);

        var charPath = Paths.loadImage("chara");
        char = new FlxSprite(500, 275, charPath);
        add(char);

        dialogText = new FlxText(525, 525, 0, dialog[dialogIndex]);
        dialogText.setFormat(null, 32, 0xFFFFFF, "center");
        add(dialogText);
    }

    override public function update(elapsed:Float):Void
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
       FlxTransWindow.getWindowsTransparent();
    }
}
