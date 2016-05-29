//
package utils;

import openfl.display.Sprite;
import openfl.geom.Point;

import utils.ShapeUtil;

class PatternFactory {
	
	private var patternContainer:Sprite;
	private var bgSize:Point;
	private var shapeUtil:ShapeUtil;

	public function new() {
		construct();
	}
	private function construct():Void{
		shapeUtil = new ShapeUtil();
	}
	// First mathod to be called, before anything else
	public function setContainer(container:Sprite,backgroundSize:Point):Void{
		this.patternContainer = container;
		this.bgSize = backgroundSize;
	}

	public function pattern_one():Void{
		//this.patternContainer.removeChildren();
		var n:Int = this.patternContainer.numChildren;
		if(n>=1000){
			this.patternContainer.removeChildren();
		}

		//var s = shapeUtil.getCircle(Math.round(Math.random()*50));
		//var s = shapeUtil.getSquare(Math.round(Math.random()*50));
		//var n:UInt = Math.round(Math.random()*50);
		//var s = shapeUtil.getRandomShape(n);

		var s = shapeUtil.getRandomShapeSizeColor(50);

		s.x = this.bgSize.x*Math.random();
		s.y = this.bgSize.y*Math.random();

		this.patternContainer.addChild(s);
	}

	public function pattern_two():Void{

	}
}