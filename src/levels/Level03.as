package levels
{
	import org.flixel.*;
	import enemies.*;
	import players.*;

	public class Level03 extends Level
	{

		
		public function Level03()
		{
			super();
			
			timeLimit = 90;
			landWidth = 7;
			eggs = 5;
			
			levelNumber = 3;
			
			map = new FlxTilemap;
			
			map.loadMap(new CSVData.map3CSV, GraphicsData.mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			Registry.map = map;
			
			map.setTileProperties(1, FlxObject.NONE, null, null, 6);

			width = map.width;
			height = map.height;
			
			Registry.map = map;
			
			add(map);
			
		}
	}

}