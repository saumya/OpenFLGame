// Factory 
// provides us shapes
package utils;

import openfl.display.Shape;
import openfl.display.Graphics;

import openfl.geom.Point;

class ShapeUtil {

	private var maxColorValue:UInt;
	private var bgSize:Point;

	public function new() {
		this.maxColorValue = 256*256*256;
		this.bgSize = new Point(1017,800);
	}
	public function getBackground():Shape{
		var s:Shape = new Shape();
		var g:Graphics = s.graphics;
		var c:UInt = Math.round(Math.random()*this.maxColorValue);
		g.beginFill(c,1.0);
		g.drawRect(0,0,bgSize.x,bgSize.y);
		g.endFill();
		return s;
	}
	public function getCircle(radius:UInt):Shape{
		var s:Shape = new Shape();
		var g:Graphics = s.graphics;
		g.beginFill(getARandomColor(),1.0);
		g.drawCircle(0,0,radius);
		g.endFill();
		return s;
	}
	public function getARandomColor():UInt{
		var i:Float = Math.random()*this.maxColorValue;
		var j:UInt = Math.round(i);
		return j;
	}
}