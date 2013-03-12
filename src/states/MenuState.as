package states
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	
	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		private var sub:FlxText;
		private var sub2:FlxText;
		private var counter:Number = 0;

		public function MenuState()
		{
		}

		override public function create():void
		{
			
			FlxG.bgColor = 0xfff8f8f8;

			sub = new FlxText(0, 100, 256);
			sub.color = 0xff000000;
			sub.scrollFactor.x = 0;
			sub.scrollFactor.y = 0;
			sub.scale.x = 1;
			sub.scale.y = 1;
			sub.text = "-Press ENTER to start-";
			sub.alignment = "center";
			sub.exists = false;
			
			sub2 = new FlxText(0, 220, 256);
			sub2.color = 0xff000000;
			sub2.scrollFactor.x = 0;
			sub2.scrollFactor.y = 0;
			sub2.text = "Copy rights 2013 Khawariz Games";
			sub2.alignment = "center";

			add(sub);
			add(sub2);
		}
		
		override public function update():void
		{
			super.update();
			counter += FlxG.elapsed;
			if (counter >= 2)
			{
				sub.exists = true;
				if (FlxG.keys.ENTER) {
					startGame();
				}
			}
			
		}

		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
	}
}