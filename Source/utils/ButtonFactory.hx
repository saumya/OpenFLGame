//
package utils;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.Graphics;
import openfl.geom.Point;

class ButtonFactory {
	
	private var maxColorValue:UInt;

	public function new() {
		this.maxColorValue = 256*256*256;
	}

	public function getButton():Sprite{
		var s:Sprite = this.getRectangle();
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