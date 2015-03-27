package;

import openfl.display.Sprite;
import openfl.Lib;
import ru.stablex.ui.widgets.Widget;
import ru.stablex.ui.UIBuilder;

class Main extends Sprite {

	public function new () {
		super();
		UIBuilder.init();
		UIBuilder.regClass('UrlBmp');
		
		var leaderboard = UIBuilder.buildFn('ui/leaderboard.xml')();
		var title = UIBuilder.buildFn('ui/leaderboardtitle.xml')();

		cast(leaderboard.getChildByName("main_area"), Widget).addChild(title);
		this.addChild(leaderboard);

		Lib.current.addChild(this);
	}

}
