package game;

import openfl.display.Sprite;

import com.saumya.components.ButtonSample;
import com.saumya.components.ButtonWithRandomColor;
import com.saumya.components.ButtonWithBgColor;

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

		// component 
		//var b:ButtonWithBgColor = new ButtonWithBgColor("Login 2 Me 3",20,0xFFFF00);
		var b:ButtonSample = new ButtonSample("Login 2 Me",20);

		//position
		b.x = 10;
		b.y = 10;
		addChild(b);
	}
}