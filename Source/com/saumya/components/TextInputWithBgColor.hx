
package com.saumya.components;

import openfl.display.Sprite;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.Graphics;
import openfl.geom.Point;

import openfl.text.TextField;
import flash.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextFieldAutoSize;

import openfl.Assets;
import openfl.Lib;

import com.saumya.components.TextInputWithRandomColor;


class TextInputWithBgColor extends TextInputWithRandomColor {

	private var bgColor:UInt = 0xFF0000;

	public function new(name:String="Saumya",h:Int=20,w:UInt=220,backgroundColor:UInt=0xFFFFFF) {
		bgColor = backgroundColor;
		super(name,h,w);
	} //new

	override private function drawBackground(w:Float,h:Float,margin:Float):Void{
		var widthX:Float = w + (2*margin);
		var g:Graphics = this.graphics;
		//var c:UInt = Math.round(Math.random()*this.maxColorValue);
		var c = bgColor;
		g.beginFill(c,1.0);
		g.drawRect(0,0,widthX,h);
		g.endFill();

		g.lineStyle(2,0x000000,1.0);
		g.moveTo(0,h-4);
		g.lineTo(widthX,h-4);
	}//drawBackground
	
}