
package com.saumya.containers;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.display.DisplayObject;

import openfl.errors.Error;


class BasicContainer extends Sprite {

	private var widthX:Float = 0;
	private var heightX:Float = 0;

	private var containerClip:Sprite;
	private var maskClip:Sprite;

	public function new(fWidth:Float=200,fHeight:Float=100) {
		super();
		widthX = fWidth;
		heightX = fHeight;

		construct();
	}
	private function construct():Void{

		this.containerClip = new Sprite();
		this.maskClip = new Sprite();

		super.addChild(this.containerClip);
		super.addChild(this.maskClip);

		render();
	}
	private function render():Void{
		// bg
		var g:Graphics = this.graphics;
		g.beginFill(0xFFFFFF,1.0);
		g.drawRect(0,0,widthX,heightX);
		g.endFill();
		// container
		// mask
		var g1:Graphics = this.maskClip.graphics;
		g1.beginFill(0xFFFFFF,1.0);
		g1.drawRect(0,0,widthX,heightX);
		g1.endFill();
		//
		this.mask = this.maskClip;

		//trace(this.width,this.height);

		// this will be used to scroll
		//this.containerClip.y = -100;
	}

	// Not allowed in container
	override public function addChild(child:DisplayObject):DisplayObject{
		trace('BasicContainer : addChild : ');

		var e:Error = new Error("BasicContainer, Error in handling content. Instead of addChild(), use addContent().",2001);
		throw e;

		return child;
	}
	//
	public function addContent(child:DisplayObject):DisplayObject{
		//super.addChild(child);
		this.containerClip.addChild(child);

		return child;
	}
}