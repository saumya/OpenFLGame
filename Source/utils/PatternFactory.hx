//
package utils;

import openfl.display.Sprite;
import openfl.geom.Point;

import utils.ShapeUtil;

class PatternFactory {
	
	private var patternContainer:Sprite;
	private var bgSize:Point; // width, height . Saved as a point for easy reference
	private var shapeUtil:ShapeUtil;

	private var patternIndex:UInt;

	public function new() {
		construct();
	}
	private function construct():Void{
		shapeUtil = new ShapeUtil();
		patternIndex = 1;
	}
	// First mathod to be called, before anything else
	public function setContainer(container:Sprite,backgroundSize:Point):Void{
		this.patternContainer = container;
		this.bgSize = backgroundSize;
	}

	// internal
	private function clearContainer():Void{
		var n:Int = this.patternContainer.numChildren;
		if(n>=1000){
			this.patternContainer.removeChildren();
		}
	}
	private function get_RandomPosition_InsideContainer():Point{
		var p:Point = new Point();
		p.x = this.bgSize.x*Math.random();
		p.y = this.bgSize.y*Math.random();
		return p;
	}
	private function get_CenterPosition_InsideContainer():Point{
		var p:Point = new Point();
		p.x = this.bgSize.x / 2;
		p.y = this.bgSize.y / 2;
		return p;
	}

	// API
	public function nextPattern():Void{
		this.patternIndex = this.patternIndex+1;
	}

	public function renderPattern():Void{
		//
		var n:Int = this.patternContainer.numChildren;
		if(n>=1000){
			this.patternContainer.removeChildren();
		}
		/*
		switch (this.patternIndex) {
			case 1:
				pattern_one();
			case 2:
				pattern_two();
			case 3:
				pattern_three();
			case 4:
				pattern_4();
			case 5:
				pattern_5();
			case 6:
				pattern_6();
			default:
				pattern_one();
		}
		*/
		pattern_6();
	}

	public function pattern_one():Void{
		clearContainer();
		/*
		this.patternContainer.removeChildren();
		
		var n:Int = this.patternContainer.numChildren;
		if(n>=1000){
			this.patternContainer.removeChildren();
		}
		*/
		//var s = shapeUtil.getCircle(Math.round(Math.random()*50));
		//var s = shapeUtil.getSquare(Math.round(Math.random()*50));
		//var n:UInt = Math.round(Math.random()*50);
		//var s = shapeUtil.getRandomShape(n);

		var s = shapeUtil.getRandomShapeSizeColor(50);
		/*
		s.x = this.bgSize.x*Math.random();
		s.y = this.bgSize.y*Math.random();
		*/
		s.x = get_RandomPosition_InsideContainer().x;
		s.y = get_RandomPosition_InsideContainer().y;
		this.patternContainer.addChild(s);
	}

	public function pattern_two():Void{
		clearContainer();
		var s = shapeUtil.getCircle(30);
		s.x = get_RandomPosition_InsideContainer().x;
		s.y = get_RandomPosition_InsideContainer().y;
		this.patternContainer.addChild(s);
	}
	public function pattern_three():Void{
		clearContainer();
		var s = shapeUtil.getSquare(30);
		s.x = get_RandomPosition_InsideContainer().x;
		s.y = get_RandomPosition_InsideContainer().y;
		this.patternContainer.addChild(s);
	}
	public function pattern_4():Void{
		clearContainer();
		
		var s = shapeUtil.getCircle(14);
		//var s = shapeUtil.getSquare(30);

		//s.x = get_CenterPosition_InsideContainer().x;
		//s.y = get_CenterPosition_InsideContainer().y;
		
		//s.x = get_CenterPosition_InsideContainer().x + Math.cos(patternContainer.numChildren)*(this.bgSize.x/2 - 30);
		//s.y = get_CenterPosition_InsideContainer().y + Math.sin(patternContainer.numChildren)*(this.bgSize.x/2 - 30);
		
		//s.x = get_CenterPosition_InsideContainer().x + Math.cos(n)*(this.bgSize.x/2 - 30);
		//s.y = get_CenterPosition_InsideContainer().y + Math.sin(n)*(this.bgSize.x/2 - 30);

		var n = patternContainer.numChildren;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/4)) ;

		patternContainer.addChild(s);
	}
	public function pattern_5():Void{
		var s = shapeUtil.getSquare(30);
		var n = patternContainer.numChildren;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/4)) ;

		patternContainer.addChild(s);
	}
	public function pattern_6():Void{
		var s = shapeUtil.getSquare(30);
		var n = patternContainer.numChildren;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/4)) ;
		s.rotation = n;
		patternContainer.addChild(s);
	}
}