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
	public function getSquare(length:UInt):Shape{
		var s:Shape = new Shape();
		var g:Graphics = s.graphics;
		g.beginFill(getARandomColor(),1.0);
		g.drawRect(0,0,length,length);
		g.endFill();
		return s;
	}
	public function getRandomShape(n:UInt):Shape{
		var a = Math.round(Math.random()*2); // 2 : as we have circle,rectangle
		var s:Shape;
		switch (a) {
			case 1:
				s = getCircle(n);
			
			case 2:
				s = getSquare(n);
			
			default:
				s = getCircle(n);
			
		}
		return s;
	}
	//
	public function getARandomColor():UInt{
		var i:Float = Math.random()*this.maxColorValue;
		var j:UInt = Math.round(i);
		return j;
	}
}