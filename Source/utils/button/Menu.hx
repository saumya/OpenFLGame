//
package utils.button;

import openfl.display.Graphics;
import openfl.display.Sprite;

import utils.button.QuickButtonWithBgColor;

class Menu extends Sprite {

	public function new() {
		super();
		construct();
	}

	private function construct():Void{
		makeBg();
	}
	private function makeBg():Void{
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(0xAAAAAA,1.0);
		g.drawRect(0,0,400,60);
		g.endFill();
	}
}