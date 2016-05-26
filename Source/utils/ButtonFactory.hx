//
package utils;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.Graphics;
import openfl.geom.Point;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;
import openfl.Lib;

class ButtonFactory {
	
	private var maxColorValue:UInt;

	public function new() {
		this.maxColorValue = 256*256*256;
	}

	public function getQuickButton():Sprite{
		var s:Sprite = this.getRectangle();
		// text formats
		//var font = Assets.getFont ("fonts/FreebooterUpdated.ttf");
		var font = Assets.getFont ("fonts/Archistico_Simple.ttf");
		var defaultFormat = new TextFormat (font.fontName, 100, 0x000000);
		defaultFormat.align = TextFormatAlign.CENTER;
		// text
		var t:TextField = new TextField();
		t.text = "Saumya";
		t.width = 300;
		t.height = 100;
		t.x = 0;
		t.y = -10; // A little upward is actually makes it look in CENTER
		t.defaultTextFormat = defaultFormat;
		t.embedFonts = true;
		t.selectable = false;
		// add the text
		s.addChild(t);
		return s;
	}

	private function getRectangle():Sprite {
		var s:Sprite = new Sprite();
		var g:Graphics = s.graphics;
		var c:UInt = Math.round(Math.random()*this.maxColorValue);
		g.beginFill(c,1.0);
		g.drawRect(0,0,300,100);
		g.endFill();
		return s;
	}
}