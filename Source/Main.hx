package;


import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.system.Capabilities;
import openfl.Assets;
import openfl.Lib;

import game.Game;


class Main extends Sprite {

	private var Background:Bitmap;
	private var game:Game;
	
	public function new () {
		super ();
		addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}

	private function onAddedToStage(event:Event):Void{
		removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		initialize();
	}

	private function construct ():Void {
		addChild(Background);
		addChild (game);
	}

	private function initialize ():Void {
		stage.addEventListener (Event.RESIZE, stage_onResize);
		Background = new Bitmap (Assets.getBitmapData ("images/background_tile.png"));
		//Footer = new Bitmap (Assets.getBitmapData ("images/center_bottom.png"));
		game = new Game ();
		construct();
	}

	private function resize (newWidth:Float, newHeight:Float):Void {
		
		Background.width = newWidth;
		Background.height = newHeight;
		
		game.resize (newWidth, newHeight);
		
		//Footer.scaleX = Game.currentScale;
		//Footer.scaleY = Game.currentScale;
		//Footer.x = newWidth / 2 - Footer.width / 2;
		//Footer.y = newHeight - Footer.height;
		
	}
	
	
	private function stage_onResize (event:Event):Void {
		resize (stage.stageWidth, stage.stageHeight);
	}
	
	
}