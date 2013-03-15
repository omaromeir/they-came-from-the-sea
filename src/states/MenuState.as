package states
{
	import cutscenes.Intro;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	
	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		private var text:FlxText;
		private var text2:FlxText;
		private var counter:Number = 0;
		private var logo:FlxSprite;

		public function MenuState()
		{
		}

		override public function create():void
		{
			
			FlxG.bgColor = 0xfff8f8f8;

			logo = new FlxSprite(25, 20, GraphicsData.logoPNG);
			logo.loadGraphic(GraphicsData.logoPNG, true, false, 204, 63);
			logo.addAnimation("shimmer", [0, 1, 0], 3, false);
			logo.play("shimmer");
			
			text = new FlxText(0, 100, 256);
			text.color = 0xff000000;
			text.scrollFactor.x = 0;
			text.scrollFactor.y = 0;
			text.scale.x = 1;
			text.scale.y = 1;
			text.text = "-Press ENTER to start-";
			text.alignment = "center";
			text.exists = false;
			
			text2 = new FlxText(0, 220, 256);
			text2.color = 0xff000000;
			text2.scrollFactor.x = 0;
			text2.scrollFactor.y = 0;
			text2.text = "Copy rights 2013 Khawariz Games";
			text2.alignment = "center";

			add(logo);
			add(text);
			add(text2);
		}
		
		override public function update():void
		{
			super.update();
			counter += FlxG.elapsed;
			if (counter >= 2)
			{
				logo.play("shimmer");
				text.exists = true;
				if (FlxG.keys.ENTER) {
					startGame();
				}
			}
		}

		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new Intro);
		}
	}
}