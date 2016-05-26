//
package game;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.system.Capabilities;
import openfl.Assets;
import openfl.Lib;

import openfl.display.Graphics;
import openfl.display.Shape;

import utils.ShapeUtil;
import utils.ButtonFactory;

class Game extends Sprite {
	
	private var shapeUtil:ShapeUtil;
	private var buttonFactory:ButtonFactory;

	private var background:Shape;
	private var shapeContainer:Sprite;

	public var currentScale:Float;


	public function new(){
		super();
		init();
	}
	public function init():Void{
		this.shapeUtil = new ShapeUtil();
		this.buttonFactory = new ButtonFactory();
		construct();
	}
	public function construct():Void{

		this.background = this.shapeUtil.getBackground();
		this.addChild(this.background);

		this.shapeContainer = new Sprite();
		this.addChild(this.shapeContainer);

		var b:Sprite = this.buttonFactory.getQuickButton();
		this.addChild(b);

		

		this.addEventListener(Event.ENTER_FRAME,render);
	}
	
	public function render(e:Event):Void{
		
		//this.shapeContainer.removeChildren();
		var n:Int = this.shapeContainer.numChildren;
		if(n>=1000){
			this.shapeContainer.removeChildren();
		}

		//var s = shapeUtil.getCircle(Math.round(Math.random()*50));
		//var s = shapeUtil.getSquare(Math.round(Math.random()*50));
		//var n:UInt = Math.round(Math.random()*50);
		//var s = shapeUtil.getRandomShape(n);

		var s = shapeUtil.getRandomShapeSizeColor(50);

		s.x = this.background.width*Math.random();
		s.y = this.background.height*Math.random();

		this.shapeContainer.addChild(s);

		
	}

	public function resize(newWidth:Int, newHeight:Int):Void {
		var maxWidth = newWidth * 0.90;
		var maxHeight = newHeight * 0.86;
		
		currentScale = 1;
		scaleX = 1;
		scaleY = 1;
		
		var currentWidth = width;
		var currentHeight = height;
		
		if (currentWidth > maxWidth || currentHeight > maxHeight) {
			
			var maxScaleX = maxWidth / currentWidth;
			var maxScaleY = maxHeight / currentHeight;
			
			if (maxScaleX < maxScaleY) {
				currentScale = maxScaleX;
			} else {
				currentScale = maxScaleY;
			}
			
			scaleX = currentScale;
			scaleY = currentScale;
			
		}
		
		x = newWidth / 2 - (currentWidth * currentScale) / 2;
	}
}