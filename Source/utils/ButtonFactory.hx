//
package utils;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.Graphics;
import openfl.geom.Point;

import utils.button.QuickButton;

class ButtonFactory {
	
	private var maxColorValue:UInt;

	public function new() {
		this.maxColorValue = 256*256*256;
	}

	public function getQuickButton():Sprite{
		var qb:QuickButton = new QuickButton();
		return qb;
	}

	private function getRectangle(w:Float,h:Float,margin:Float):Sprite {
		var width:Float = w + (2*margin);

		var s:Sprite = new Sprite();
		var g:Graphics = s.graphics;
		var c:UInt = Math.round(Math.random()*this.maxColorValue);
		g.beginFill(c,1.0);
		g.drawRect(0,0,width,h);
		g.endFill();
		return s;
	}
}