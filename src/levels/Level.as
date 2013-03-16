package levels 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class Level extends FlxGroup
	{
		public var map:FlxTilemap;
		
		public var width:int;
		public var height:int;
		
		public var timeLimit:int;
		public var landWidth:int;
		public var eggs:int;
		
		public var levelNumber:int;
		
		public function Level() 
		{
			super();
		}
		
	}

}