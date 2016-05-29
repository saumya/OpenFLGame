//
package utils.button;

import openfl.display.Graphics;
import openfl.display.Sprite;

import openfl.events.MouseEvent;
import openfl.events.Event;

import utils.ButtonFactory;
import utils.button.QuickButtonWithBgColor;
import utils.button.EventNames;

class Menu extends Sprite {

	private var btnFactory:ButtonFactory;

	public function new() {
		super();
		this.btnFactory = new ButtonFactory();
		construct();
	}

	private function construct():Void{
		makeBg();
		//
		var b1:QuickButtonWithBgColor = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"RESTART",18);
		b1.addEventListener("click",onButton1Click);
		this.addChild(b1);
	}
	private function makeBg():Void{
		// The values are set in Project.xml
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(0xAAAAAA,1.0);
		g.drawRect(0,0,400,60);
		g.endFill();
	}
	//
	private function onButton1Click(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_RESTART);
		dispatchEvent(newEvent);
	}
}