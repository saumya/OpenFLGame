//
package utils.button;

import utils.button.QuickButton;

import openfl.display.Graphics;

class QuickButtonWithBgColor extends QuickButton {
	
	private var bgColor:UInt;

	public function new(name:String="Saumya",h:Int=20,backgroundColor:UInt=0xFFFFFF) {
		this.bgColor = backgroundColor;
		// last call
		super(name,h);
	}
	
	/*
	override private function construct():Void{
		super.construct();
	}
	*/

	override private function drawBackground(w:Float,h:Float,margin:Float):Void{
		//trace(this.bgColor);
		//super.drawBackground(w,h,margin);
		var widthX:Float = w + (2*margin);
		var g:Graphics = this.graphics;
		//var c:UInt = Math.round(Math.random()*this.maxColorValue);
		var c:UInt = this.bgColor;
		g.beginFill(c,1.0);
		g.drawRect(0,0,widthX,h);
		g.endFill();
	}
}