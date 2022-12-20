package;

import flixel.FlxGame;
import flixel.util.FlxColor;
import openfl.display.Sprite;
import openfl.display.FPS;

class Main extends Sprite
{
	public static var fpsVar:FPS;
	var framerate:Int = #if web 60 #else 240 #end;

	public function new()
	{
		super();

		addChild(new FlxGame(1280, 720, PlayState, #if (flixel < "5.0.0") 1, #end framerate, framerate, true, false));

		#if !mobile
		fpsVar = new FPS(10, 3, 0xFFFFFF);
		addChild(fpsVar);
		#end
	}
}
