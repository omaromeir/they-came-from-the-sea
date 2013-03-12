package cutscenes 
{
	import org.flixel.*;
	import states.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class Splash extends FlxState
	{
		[Embed(source='../assets/cutscenes/splash.png')] private var splash:Class;
		private var frame1:FlxSprite;
		private var counter:Number = 0;
		
		public function Splash() 
		{
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			frame1 = new FlxSprite(0, 0, splash);
			add(frame1);
		}
		
		override public function update():void
		{
			super.update();
			counter += FlxG.elapsed;
			if (counter >= 2){
				FlxG.switchState(new MenuState);
			}
		}
		
		private function changePic(): void 
		{
			
		}
		
	}

}