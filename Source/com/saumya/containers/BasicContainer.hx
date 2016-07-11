
package com.saumya.containers;

import openfl.display.Sprite;
import openfl.display.Graphics;


class BasicContainer extends Sprite {

	private var widthX:Float = 0;
	private var heightX:Float = 0;

	public function new(fWidth:Float=200,fHeight:Float=100) {
		super();
		widthX = fWidth;
		heightX = fHeight;

		construct();
	}
	private function construct():Void{

		render();
	}
	private function render():Void{
		var g:Graphics = this.graphics;
		g.beginFill(0xFFFFFF,1.0);
		g.drawRect(0,0,widthX,heightX);
		g.endFill();

		//trace(this.width,this.height);
	}
}