package debug;

import openfl.system.System;
#if hl
import hl.Gc;
#end
import openfl.text.TextField;
import openfl.text.TextFormat;

class MemoryCounter extends TextField
{
	public var currentFPS(default, null):Int;
	private var memPeak:Float = 0;
	
	@:noCompletion private var cacheCount:Int;
	@:noCompletion private var currentTime:Float;
	@:noCompletion private var times:Array<Float>;

	static final BYTES_PER_MEG:Float = 1024 * 1024;
	static final ROUND_TO:Float = 1 / 100;

	public function new(x:Float = 10, y:Float = 10, color:Int = 0x000000)
	{
		super();

		this.x = x;
		this.y = y;
		currentFPS = 0;
		this.width = 500;
		this.selectable = false;
		this.mouseEnabled = false;
		defaultTextFormat = new TextFormat("_sans", 12, color);
		text = "RAM: ";

		#if flash
		addEventListener(Event.ENTER_FRAME, function(e)
		{
			var time = Lib.getTimer();
			__enterFrame(time - currentTime);
		});
		#end
	}

	// Event Handlers
	@:noCompletion
	private #if !flash override #end function __enterFrame(deltaTime:Float):Void
	{
		var currentCount = times.length;
		currentFPS = Math.round((currentCount + cacheCount) / 2);
		
		var mem:Float = Math.round(#if !hl System.totalMemory #else Gc.stats().currentMemory #end / BYTES_PER_MEG / ROUND_TO) * ROUND_TO;

		if (mem > memPeak)
			memPeak = mem;
			text = "FPS: " + currentFPS;
			text = 'RAM: ${mem}mb / ${memPeak}mb';
	}
}
