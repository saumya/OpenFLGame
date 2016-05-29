//
package utils;

import openfl.display.Sprite;
import openfl.geom.Point;

import utils.ShapeUtil;

class PatternFactory {
	
	private var patternContainer:Sprite;
	private var bgSize:Point;
	private var shapeUtil:ShapeUtil;

	private var patternIndex:UInt;

	public function new() {
		construct();
	}
	private function construct():Void{
		shapeUtil = new ShapeUtil();
		patternIndex = 0;
	}
	// First mathod to be called, before anything else
	public function setContainer(container:Sprite,backgroundSize:Point):Void{
		this.patternContainer = container;
		this.bgSize = backgroundSize;
	}

	public function nextPattern():Void{
		this.patternIndex = this.patternIndex+1;
	}

	public function renderPattern(num:UInt):Void{
		switch (num) {
			case 1:
				pattern_one();
			case 2:
				pattern_two();
			default:
				pattern_one();
		}
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