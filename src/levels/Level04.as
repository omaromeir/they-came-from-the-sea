package levels
{
	import org.flixel.*;
	import enemies.*;
	import players.*;

	public class Level04 extends Level
	{

		
		public function Level04()
		{
			super();
			
			timeLimit = 90;
			landWidth = 5;
			eggs = 5;
			
			levelNumber = 4;
			
			map = new FlxTilemap;
			
			map.loadMap(new CSVData.map4CSV, GraphicsData.mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			Registry.map = map;
			
			map.setTileProperties(1, FlxObject.NONE, null, null, 6);

			width = map.width;
			height = map.height;
			
			Registry.map = map;
			
			add(map);
			
		}
	}

}