package game;

import openfl.display.Sprite;

class Game extends Sprite {

	private var gameWidth:Float;
	private var gameHeight:Float;

	public function new() {
		trace("Gmae:new:");
		super();
		initialise();
	}

	private function initialise():Void{
		trace("Gmae:initialise:");
		gameWidth = 400;
		gameHeight = 600;
		construct();
	}

	private function construct():Void{
		trace("Gmae:construct:");
		drawUI();
	}

	public function resize(newWidth:Float,newHeight:Float):Void{
		trace("Gmae:resize:");
		gameWidth = newWidth;
		gameHeight = newHeight;

		removeChildren();
		drawUI();
	}

	private function drawUI():Void{
		trace("Gmae:drawUI:");
	}
}