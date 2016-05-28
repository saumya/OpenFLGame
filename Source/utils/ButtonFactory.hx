//
package utils;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.Graphics;
import openfl.geom.Point;

import utils.button.QuickButton;
import utils.button.QuickButtonWithBgColor;

class ButtonFactory {
	
	private var maxColorValue:UInt;

	public function new() {
		this.maxColorValue = 256*256*256;
	}

	public function getQuickButton(name:String="Saumya",height:Int=40):QuickButton{
		var qb:QuickButton = new QuickButton(name,height);
		return qb;
	}

	public function getQuickButtonWithBgColor(bgColor:UInt,name:String="Saumya",height:Int=40):QuickButtonWithBgColor{
		var qb:QuickButtonWithBgColor = new QuickButtonWithBgColor(name,height,bgColor);
		return qb;
	}

	private function getRectangle(w:Float,h:Float,margin:Float):Shape {
		var width:Float = w + (2*margin);
		var s:Shape = new Shape();
		var g:Graphics = s.graphics;
		var c:UInt = Math.round(Math.random()*this.maxColorValue);
		g.beginFill(c,1.0);
		g.drawRect(0,0,width,h);
		g.endFill();
		return s;
	}
}