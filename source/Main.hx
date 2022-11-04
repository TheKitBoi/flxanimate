package;

import debug.MemoryCounter;
import flixel.FlxGame;
import flixel.util.FlxColor;
import openfl.display.Sprite;
import openfl.display.FPS;

class Main extends Sprite
{
	var framerate:Int = #if web 60 #else 144 #end;

	public function new()
	{
		super();

		addChild(new FlxGame(1280, 720, PlayState, 1, framerate, framerate, true, false));
		
		function buildDebugDisplay()
   		{
 		     var memoryCounter = new MemoryCounter(10, 13, FlxColor.BLACK);
 		     addChild(memoryCounter);
   		}
		
		buildDebugDisplay();

		var fpsCounter = new FPS(10, 3, FlxColor.BLACK);
		addChild(fpsCounter);
	}
}
