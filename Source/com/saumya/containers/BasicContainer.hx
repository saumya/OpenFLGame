
package com.saumya.containers;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.display.DisplayObject;

import openfl.errors.Error;


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

	override public function addChild(child:DisplayObject):DisplayObject{
		trace('BasicContainer : addChild : ');

		var e:Error = new Error("BasicContainer, Error in handling content. Instead of addChild(), use addContent().",2001);
		throw e;

		return child;
	}
}