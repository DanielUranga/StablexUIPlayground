package ;

import ru.stablex.ui.widgets.*;
import flash.events.*;
import flash.net.*;
import flash.display.*;
import flash.utils.ByteArray;

class UrlBmp extends Bmp {
	
	public var size(default, set) : Float;
	public var url(default, set) : String;

	public function new() {
		super();
		this.autoSize = true;
		this.size = 100;
	}

	function set_size(size : Float) : Float {
		this.size = size;
		var gfx = this.graphics;
		gfx.clear();
		gfx.beginFill(0x222222);
		gfx.drawRect(0, 0, size, size);
		gfx.endFill();
		_width = _height = size;
		return size;
	}

	function set_url(url : String) : String {
		this.url = url;
		var req = new URLRequest(url);
		var ldr = new URLLoader();
		if (url!=null) {
			ldr.addEventListener(Event.COMPLETE, onLoadComplete);
			ldr.load(req);
		}
		return url;
	}

	function onLoadComplete(e : Event) {
		
		var b : String = e.target.data;
		var arr = new ByteArray();
		arr.writeUTFBytes(b);
		if (arr.length==0) {
			return;
		}
		var bmpData : BitmapData = BitmapData.loadFromBytes(arr);
		this.bitmapData = bmpData;

		this.refresh();

		if (bmpData.width!=0) {
			this.scaleX = size / bmpData.width;
		}

		if (bmpData.height!=0) {
			this.scaleY = size / bmpData.height;
		}
		_width = bmpData.width * scaleX;
		_height = bmpData.height * scaleY;

	}

}
