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
		public static var score:int = 0;
		public static var total:int = 0;
		
		public static var worldsCompleted:int = 0;
		
		public static var lastWorld:int = 0;
		
		public function Registry() 
		{
			
		}
		
	}

}