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
		//this.bgSize = new Point(1017,800);
		this.bgSize = new Point(400,600);// The values are set in Project.xml
	}
	public function getBackground(width:UInt=400,height:UInt=600):Shape{
		this.bgSize = new Point(width,height);

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
	// Returns a Random shape
	// n is 
	// radius of the circle
	// length of a side of the square
	public function getRandomShape(n:UInt):Shape{
		var a = Math.round(Math.random()*2); // 2 : as we have circle,rectangle
		var s:Shape;
		switch (a) {
			case 1:
				s = getCircle(n);
			case 2:
				s = getSquare(n);
				// incase random rotation is required
				//var r1:UInt = Math.round(Math.random()*90);
				//s.rotation = r1;
			default:
				s = getCircle(n);
		}
		return s;
	}
	public function getRandomShapeSizeColor(maxSize:UInt):Shape{
		var randomSize:UInt = Math.round(Math.random()*maxSize);
		var s = getRandomShape(randomSize);
		return s;
	}
	//
	public function getARandomColor():UInt{
		var i:Float = Math.random()*this.maxColorValue;
		var j:UInt = Math.round(i);
		return j;
	}
}