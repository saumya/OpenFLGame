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
	private var btnPause:QuickButtonWithBgColor;

	public function new() {
		super();
		this.btnFactory = new ButtonFactory();
		construct();
	}

	public function setPauseButtonLabel(label:String):Void{
		trace("TODO");
	}

	private function construct():Void{
		makeBg();
		//
		var leftPadding :UInt = 12;

		var btnRestart:QuickButtonWithBgColor = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"RESTART",42);
		btnRestart.addEventListener("click",onRestart);
		btnRestart.x = leftPadding;
		btnRestart.y = 2;
	
		var btnNew:QuickButtonWithBgColor = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"NEW",42);
		btnNew.addEventListener("click",onNew);
		btnNew.x = leftPadding;
		btnNew.y = btnRestart.y + btnRestart.height + 4;

		this.btnPause = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"PAUSE",42);
		btnPause.addEventListener("click",onPause);
		btnPause.x = leftPadding + btnNew.x+btnNew.width;
		btnPause.y = btnNew.y;

		this.addChild(btnRestart);
		this.addChild(btnNew);
		this.addChild(btnPause);
	}
	private function makeBg():Void{
		// The values are set in Project.xml
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(0xAAAAAA,1.0);
		g.drawRect(0,0,700,120);
		g.endFill();
	}
	//
	private function onRestart(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_RESTART);
		dispatchEvent(newEvent);
	}
	private function onNew(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_NEW_PATTERN);
		dispatchEvent(newEvent);
	}
	private function onPause(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_PAUSE);
		dispatchEvent(newEvent);
	}
}