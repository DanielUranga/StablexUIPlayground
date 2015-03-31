package;

import flash.events.Event;
import openfl.display.Sprite;
import openfl.Lib;
import ru.stablex.ui.widgets.Widget;
import ru.stablex.ui.UIBuilder;

class Main extends Sprite {

	var leaderboard : Widget;

	public function new() {
		super();
		UIBuilder.setTheme('ru.stablex.ui.themes.android4');
		UIBuilder.init('ui/defaults.xml');
		UIBuilder.regClass('UrlBmp');
		
		leaderboard = UIBuilder.buildFn('ui/leaderboard.xml')();
		/*
		var title = UIBuilder.buildFn('ui/leaderboardtitle.xml')();
		cast(leaderboard.getChildByName("main_area"), Widget).addChild(title);
		*/
		this.addChild(leaderboard);

		Lib.current.stage.addEventListener(Event.RESIZE, onResize);
		this.addEventListener(Event.ADDED_TO_STAGE, onResize);

		Lib.current.addChild(this);

	}

	function onResize(_) {
		var w = Lib.current.stage.stageWidth;
		var h = Lib.current.stage.stageHeight;
		//var root = leaderboard.getChild("base_root");
		leaderboard.w = w;
		leaderboard.h = h;
		leaderboard.refresh();

	}

}
