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
		
		buildDebugDisplay();
		
		function buildDebugDisplay()
   		{
  		    var fpsCounter = new FPS(10, 3, 0xFFFFFF);
 		     addChild(fpsCounter);

 		     var memoryCounter = new MemoryCounter(10, 13, 0xFFFFFF);
 		     addChild(memoryCounter);
   		}

		var fpsCounter = new FPS(10, 3, FlxColor.BLACK);
		addChild(fpsCounter);
	}
}
