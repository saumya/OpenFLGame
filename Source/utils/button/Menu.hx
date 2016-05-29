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
		var leftPadding :UInt = 2;
		var btnRestart:QuickButtonWithBgColor = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"RESTART",18);
		btnRestart.addEventListener("click",onRestart);
		btnRestart.x = leftPadding;
		btnRestart.y = 2;
	
		var btnNew:QuickButtonWithBgColor = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"NEW PATTERN",18);
		btnNew.addEventListener("click",onNew);
		btnNew.x = leftPadding;
		btnNew.y = btnRestart.y + btnRestart.height + 4;

		this.addChild(btnRestart);
		this.addChild(btnNew);
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
	private function onRestart(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_RESTART);
		dispatchEvent(newEvent);
	}
	private function onNew(e:flash.events.MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_NEW_PATTERN);
		dispatchEvent(newEvent);
	}
}