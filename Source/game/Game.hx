package game;

import openfl.display.Sprite;

import openfl.ui.Multitouch;

import com.saumya.components.ButtonSample;
import com.saumya.components.ButtonWithRandomColor;
import com.saumya.components.ButtonWithBgColor;
import com.saumya.components.ButtonWithFixedWidth;
import com.saumya.components.ToggleButton;

import com.saumya.components.TextInputWithRandomColor;
import com.saumya.components.TextInputWithBgColor;

import com.saumya.containers.BasicContainer;

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

		trace("Gmae:initialise: Multitouch :   ==================");
		trace("Multitouch.supportsTouchEvents",Multitouch.supportsTouchEvents);
		trace("Multitouch.inputMode",Multitouch.inputMode);
		trace("Multitouch.maxTouchPoints",Multitouch.maxTouchPoints);
		trace("Multitouch.supportedGestures",Multitouch.supportedGestures);
		trace("Gmae:initialise: Multitouch : / ==================");

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

		// component ===================================
		
		//var b:ButtonWithBgColor = new ButtonWithBgColor("Button",12,0xFFFF00);
		//var b:ButtonSample = new ButtonSample("Login 2 Me",20);

		var b:ButtonWithFixedWidth = new ButtonWithFixedWidth("Login",12,80,0xFFFF00,true);
		var b1:ButtonWithFixedWidth = new ButtonWithFixedWidth("Register",12,80,0xFFFF00);

		var t1:TextInputWithRandomColor = new TextInputWithRandomColor("input output",12,120);
		var t2:TextInputWithBgColor = new TextInputWithBgColor("T2 T2 T2 T2 T2 T2 T2 T2 T2 T2 T2",20,350,0xFF00FF);
		
		var tb1:ToggleButton = new ToggleButton();

		var t3:TextInputWithBgColor = new TextInputWithBgColor("T2 T2 T2 T2 T2 T2 T2",18,220,0xFFFFFF,true);
		var t4:TextInputWithBgColor = new TextInputWithBgColor("T4 is TextInputWithBgColor",18,250,0xCCCCCC,false);
		var t5:TextInputWithBgColor = new TextInputWithBgColor("T5",18,250,0xCCCCCC,false);
		var t6:TextInputWithBgColor = new TextInputWithBgColor("T6",18,250,0xBBBBBB,false);
		var t7:TextInputWithBgColor = new TextInputWithBgColor("T7",18,250,0xAAAAAA,false);
		var t8:TextInputWithBgColor = new TextInputWithBgColor("T8",18,250,0xAAAAAA,false);
		var t9:TextInputWithBgColor = new TextInputWithBgColor("T9",18,250,0xAAAAAA,false);
		var t10:TextInputWithBgColor = new TextInputWithBgColor("T10",18,250,0xAAAAAA,false);

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

		tb1.x = 10;
		tb1.y = t2.y + t2.height + 2;
		addChild(tb1);






		t3.x = 10;
		//t3.y = t2.y + t2.height + 2;
		//addChild(t3);

		t4.x = 10;
		t4.y = t3.y + t3.height + 2;

		t5.x = 10;
		t5.y = t4.y + t4.height + 2;

		t6.x = 10;
		t6.y = t5.y + t5.height + 2;

		t7.x = 10;
		t7.y = t6.y + t6.height + 2;

		t8.x = 10;
		t8.y = t7.y + t7.height + 2;

		t9.x = 10;
		t9.y = t8.y + t8.height + 2;

		t10.x = 10;
		t10.y = t9.y + t9.height + 2;

		// continers ===================================

		var c1:BasicContainer = new BasicContainer(300,150);

		c1.x = 10;
		c1.y = 200;
		addChild(c1);

		//c1.addChild(t3); // Error
		c1.addContent(t3); // working
		c1.addContent(t4);
		c1.addContent(t5);
		c1.addContent(t6);
		c1.addContent(t7);
		c1.addContent(t8);
		c1.addContent(t9);
		c1.addContent(t10);
	}
}