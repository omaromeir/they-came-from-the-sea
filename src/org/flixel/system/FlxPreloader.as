package org.flixel.system
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	import flash.utils.getTimer;
	
	import org.flixel.FlxG;

	/**
	 * This class handles the 8-bit style preloader.
	 */
	public class FlxPreloader extends MovieClip
	{
		[Embed(source='../../../assets/Other/logoPreloader.png')] protected var ImgLogo:Class;
		[Embed(source = '../../../assets/Other/preloaderText.png')] protected var ImgAText:Class;

		/**
		 * @private
		 */
		protected var _init:Boolean;
		/**
		 * @private
		 */
		protected var _buffer:Sprite;
		/**
		 * @private
		 */
		protected var _bmpBar:Bitmap;
		protected var _bmpBarFull:Bitmap;
		/**
		 * @private
		 */
		protected var _text:TextField;
		/**
		 * Useful for storing "real" stage width if you're scaling your preloader graphics.
		 */
		protected var _width:uint;
		/**
		 * Useful for storing "real" stage height if you're scaling your preloader graphics.
		 */
		protected var _height:uint;
		/**
		 * @private
		 */
		protected var _logo:Bitmap;
		protected var _aText:Bitmap;
		/**
		 * @private
		 */
		protected var _min:uint;

		/**
		 * This should always be the name of your main project/document class (e.g. GravityHook).
		 */
		public var className:String;
		/**
		 * Set this to your game's URL to use built-in site-locking.
		 */
		public var myURL:String;
		/**
		 * Change this if you want the flixel logo to show for more or less time.  Default value is 0 seconds.
		 */
		public var minDisplayTime:Number;
		
		/**
		 * Constructor
		 */
		public function FlxPreloader()
		{
			minDisplayTime = 0;
			
			stop();
            stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			//Check if we are on debug or release mode and set _DEBUG accordingly
            try
            {
                throw new Error("Setting global debug flag...");
            }
            catch(E:Error)
            {
                var re:RegExp = /\[.*:[0-9]+\]/;
                FlxG.debug = re.test(E.getStackTrace());
            }
			
			var tmp:Bitmap;
			if(!FlxG.debug && (myURL != null) && (root.loaderInfo.url.indexOf(myURL) < 0))
			{
				tmp = new Bitmap(new BitmapData(stage.stageWidth,stage.stageHeight,true,0xFFF8F8F8));
				addChild(tmp);
				
				var format:TextFormat = new TextFormat();
				format.color = 0x000000;
				format.size = 16;
				format.align = "center";
				format.bold = true;
				format.font = "system";
				
				var textField:TextField = new TextField();
				textField.width = tmp.width-16;
				textField.height = tmp.height-16;
				textField.y = 8;
				textField.multiline = true;
				textField.wordWrap = true;
				textField.embedFonts = true;
				textField.defaultTextFormat = format;
				textField.text = "Hi there!  It looks like somebody copied this game without my permission.  Just click anywhere, or copy-paste this URL into your browser.\n\n"+myURL+"\n\nto play the game at my site.  Thanks, and have fun!";
				addChild(textField);
				
				textField.addEventListener(MouseEvent.CLICK,goToMyURL);
				tmp.addEventListener(MouseEvent.CLICK,goToMyURL);
				return;
			}
			this._init = false;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function goToMyURL(event:MouseEvent=null):void
		{
			navigateToURL(new URLRequest("http://"+myURL));
		}
		
		private function onEnterFrame(event:Event):void
        {
			if(!this._init)
			{
				if((stage.stageWidth <= 0) || (stage.stageHeight <= 0))
					return;
				create();
				this._init = true;
			}
            graphics.clear();
			var time:uint = getTimer();
            if((framesLoaded >= totalFrames) && (time > _min))
            {
                removeEventListener(Event.ENTER_FRAME, onEnterFrame);
                nextFrame();
                var mainClass:Class = Class(getDefinitionByName(className));
	            if(mainClass)
	            {
	                var app:Object = new mainClass();
	                addChild(app as DisplayObject);
	            }
                destroy();
            }
            else
			{
				var percent:Number = root.loaderInfo.bytesLoaded/root.loaderInfo.bytesTotal;
				var part:int = root.loaderInfo.bytesLoaded / 1024;
				var total:int = root.loaderInfo.bytesTotal / 1024;
            	update(percent, part, total);
			}
        }
		
		/**
		 * Override this to create your own preloader objects.
		 * Highly recommended you also override update()!
		 */
		protected function create():void
		{
			_min = 0;
			if(!FlxG.debug)
				_min = minDisplayTime*1000;
			_buffer = new Sprite();
			_buffer.scaleX = 2;
			_buffer.scaleY = 2;
			addChild(_buffer);
			_width = stage.stageWidth/_buffer.scaleX;
			_height = stage.stageHeight/_buffer.scaleY;
			_buffer.addChild(new Bitmap(new BitmapData(_width,_height,false,0xf8f8f8)));
			_bmpBarFull = new Bitmap(new BitmapData(1,7,false,0x000000));
			_bmpBarFull.x = _width / 4;
			_bmpBarFull.y = _height / 2;
			_buffer.addChild(_bmpBarFull);
			_bmpBar = new Bitmap(new BitmapData(1,7,false,0xc0aec7));
			_bmpBar.x = _width / 4;
			_bmpBar.y = _height / 2;
			_buffer.addChild(_bmpBar);
			_text = new TextField();
			_text.defaultTextFormat = new TextFormat("system",8,0x000000);
			_text.embedFonts = true;
			_text.selectable = false;
			_text.multiline = false;
			_text.x = 2;
			_text.y = 130;
			_text.width = 80;
			_buffer.addChild(_text);
			_logo = new ImgLogo();
			_logo.x = (_width-_logo.width)/2;
			_logo.y = (_height-_logo.height)/3;
			_buffer.addChild(_logo);
			_aText = new ImgAText();
			_aText.x = (_width-_aText.width)/2;
			_aText.y = (_height-_aText.height)/1.5;
			_buffer.addChild(_aText);
		}
		
		protected function destroy():void
		{
			removeChild(_buffer);
			_buffer = null;
			_bmpBar = null;
			_text = null;
			_logo = null;
		}
		
		/**
		 * Override this function to manually update the preloader.
		 * 
		 * @param	Percent		How much of the program has loaded.
		 */
		protected function update(Percent:Number, p:Number, t:Number):void
		{
			_bmpBarFull.scaleX = (_width) / 2;
			_bmpBar.scaleX = Percent*(_width)/2;
			/*_text.text = p+"/"+t+" KB";
			_text.setTextFormat(_text.defaultTextFormat);*/
			_logo.alpha = 1;
			if(Percent > 0.9)
			{
				_buffer.alpha = 1-(Percent-0.9)/0.1;
			}
		}
	}
}
