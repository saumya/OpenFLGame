
package com.saumya.containers;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.display.DisplayObject;

import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.events.TouchEvent;

#if flash
import flash.events.GestureEvent;
import flash.events.TransformGestureEvent;
#end

import openfl.errors.Error;


class BasicContainer extends Sprite {

	private var widthX:Float = 0;
	private var heightX:Float = 0;

	private var containerClip:Sprite;
	private var maskClip:Sprite;

	// gesture
	private var initX:Float = 0;
	private var initY:Float = 0;

	//

	public function new(fWidth:Float=200,fHeight:Float=100) {
		trace("BasicContainer : new :");

		super();
		widthX = fWidth;
		heightX = fHeight;

		construct();
	}
	private function construct():Void{
		trace("BasicContainer : construct :");

		this.containerClip = new Sprite();
		this.maskClip = new Sprite();

		super.addChild(this.containerClip);
		super.addChild(this.maskClip);
		
		/*
		#if flash
		this.addEventListener(GestureEvent.GESTURE_TWO_FINGER_TAP,onGestureTwoFingureTap);
		this.addEventListener(TransformGestureEvent.GESTURE_PAN,onGesturePan);
		this.addEventListener(TransformGestureEvent.GESTURE_SWIPE,onGestureSwipe);
		#end
		*/
		

		this.containerClip.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);

		render();
	}
	private function render():Void{
		trace("BasicContainer : render :");

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
		trace("BasicContainer : addContent :");

		//super.addChild(child);
		this.containerClip.addChild(child);

		return child;
	}
	// Event handler
	private function onAddedToStage(e:Event):Void{
		trace("BasicContainer : onAddedToStage :");
		//this.stage.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
		#if desktop
			this.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
		#else 
			this.addEventListener(TouchEvent.TOUCH_BEGIN,onTouchStart);
			this.addEventListener(TouchEvent.TOUCH_MOVE,onTouchMove);
			this.addEventListener(TouchEvent.TOUCH_END,onTouchEnd);
		#end
	}
	private function onMouseWheel(e:MouseEvent):Void{
		trace("onMouseWheel");
		trace(e.delta);
		trace(e.localX,e.localY);
		
		this.containerClip.y += (1*e.delta);

	}
	//
	private function onTouchStart(e:TouchEvent):Void{
		trace("onTouchStart");
		trace(e.localX,e.localY);
		initX = e.localX;
		initY = e.localY;
	}
	private function onTouchMove(e:TouchEvent):Void{
		//trace("onTouchMove");
		trace(e.localX,e.localY);
		
		var min = (this.containerClip.y - this.containerClip.height);
		var max = (this.containerClip.y + this.containerClip.height);

		//this.containerClip.y = e.localY;
		//this.containerClip.y = e.localY - this.initY;
		
		this.containerClip.y = this.containerClip.y + (e.localY - this.initY);

		if(max <= 10){
			this.containerClip.y = max;
		}else if(this.containerClip.y >= 0){
			this.containerClip.y = 0;
		}else{
			//this.containerClip.y = this.containerClip.y + (e.localY - this.initY);
		}
		
		//trace(e.localX,e.localY);
	}
	private function onTouchEnd(e:TouchEvent):Void{
		trace("onTouchEnd");
	}
	
	#if flash
	private function onGestureTwoFingureTap(e:GestureEvent):Void{
		trace("onGestureTwoFingureTap");
	}
	private function onGesturePan(e:GestureEvent):Void{
		trace("onGesturePan");
	}
	private function onGestureSwipe(e:GestureEvent):Void{
		trace("onGestureSwipe");
	}
	#end
}