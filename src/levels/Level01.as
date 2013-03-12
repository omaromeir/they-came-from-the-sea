package levels
{
	import org.flixel.*;
	import enemies.*;
	import players.*;

	public class Level01 extends FlxGroup
	{
		
		
		public var map:FlxTilemap;
		
		public var width:int;
		public var height:int;
		
		public function Level01()
		{
			super();
			
			map = new FlxTilemap;
			
			map.loadMap(new CSVData.mapCSV, GraphicsData.mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			Registry.map = map;
			
			map.setTileProperties(1, FlxObject.NONE, null, null, 6);

			width = map.width;
			height = map.height;
			
			Registry.map = map;
			
			add(map);
			
		}
	}

}