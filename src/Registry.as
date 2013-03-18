package  
{
	
	import org.flixel.*;
	import players.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class Registry 
	{
		public static var map:FlxTilemap;
		public static var player:Player;
		public static var level:int = 1;
		public static var gameEnd:Boolean = false;
		public static var easyMode:Boolean = true;
		
		public function Registry() 
		{
			
		}
		
	}

}