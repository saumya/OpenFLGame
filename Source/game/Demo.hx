package game;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

import com.saumya.components.ButtonWithFixedWidth;
import com.saumya.containers.BasicContainer;

class Demo extends Sprite {

	private var gameWidth:Float;
	private var gameHeight:Float;

	private var container1:BasicContainer;


	public function new() {
		trace("Demo:new:");

		super();
		initialize();
	}
	private function initialize():Void{
		trace("Demo:initialize:");

		gameWidth = 400;
		gameHeight = 600;

		drawUI();
	}
	public function resize(newWidth:Float,newHeight:Float):Void{
		trace("Demo:resize:");

		gameWidth = newWidth;
		gameHeight = newHeight;

		removeChildren();
		drawUI();
	}

	private function drawUI():Void{
		trace("Demo:drawUI:");
		var margin = 10;
		var fullWidth = (gameWidth - (2*margin));
		var halfHeight = (gameWidth / 2);
		//var c1:BasicContainer = new BasicContainer(300,200);
		//var c1:BasicContainer = new BasicContainer(gameWidth - (2*10),gameHeight - (2*10));
		
		/*
		var c1:BasicContainer = new BasicContainer(fullWidth,halfHeight);
		c1.x = c1.y = margin ;
		addChild(c1);
		*/

		var b1:ButtonWithFixedWidth = new ButtonWithFixedWidth("Add",12,80,0xFFFF00,true);
		var b2:ButtonWithFixedWidth = new ButtonWithFixedWidth("Remove",12,80,0xFFFF00,true);
		b1.x = margin;
		b1.y = halfHeight + (2*margin);
		b2.x = (2*margin) + b1.width;
		b2.y = b1.y;
		addChild(b1);
		addChild(b2);

		b1.addEventListener(MouseEvent.CLICK,onAdd);
		b2.addEventListener(MouseEvent.CLICK,onRemove);

		container1 = new BasicContainer(fullWidth,halfHeight);
		container1.x = container1.y = margin ;
		addChild(container1);
		
		//c1.addContent(b1);
	}
	private function onAdd(e:MouseEvent):Void{
		var b1:ButtonWithFixedWidth = new ButtonWithFixedWidth("1",12,80,0x00FF00,true);
		trace(container1.getNumContent());
		b1.x = 10;
		b1.y = container1.getNumContent() * b1.height + 2;
		container1.addContent(b1);
	}
	private function onRemove(e:MouseEvent):Void{
		container1.removeLastContent();
	}
}