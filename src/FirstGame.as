package
{
	import org.flixel.FlxGame;
	import states.*;
	import cutscenes.*;
	
	public class FirstGame extends FlxGame
	{
		public function FirstGame()
		{
			super(256, 144, Splash, 2, 60, 60);
			//forceDebugger = true;
		}
	}
}