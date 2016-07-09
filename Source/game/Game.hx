package game;

import openfl.display.Sprite;

import com.saumya.components.ButtonSample;
import com.saumya.components.ButtonWithRandomColor;
import com.saumya.components.ButtonWithBgColor;
import com.saumya.components.ButtonWithFixedWidth;

import com.saumya.components.TextInputWithRandomColor;
import com.saumya.components.TextInputWithBgColor;

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
		var b:ButtonWithFixedWidth = new ButtonWithFixedWidth("Login",12,80,0xFFFF00,true);
		var b1:ButtonWithFixedWidth = new ButtonWithFixedWidth("Register",12,80,0xFFFF00);

		var t1:TextInputWithRandomColor = new TextInputWithRandomColor("input output",20,120);
		var t2:TextInputWithBgColor = new TextInputWithBgColor("T2 T2 T2 T2 T2 T2 T2 T2 T2 T2 T2",20,350,0xFF00FF);
		
		//var b:ButtonWithBgColor = new ButtonWithBgColor("Button",12,0xFFFF00);
		//var b:ButtonSample = new ButtonSample("Login 2 Me",20);

		//position
		b.x = 10;
		b.y = 10;
		addChild(b);

		b1.x = 10;
		b1.y = b.y+b.height+2;
		addChild(b1);

		t1.x = 10;
		t1.y = b1.y + b1.height+2;
		addChild(t1);

		t2.x = 10;
		t2.y = t1.y + t1.height + 2;
		addChild(t2);

		trace(b.height,b1.height);

	}
}