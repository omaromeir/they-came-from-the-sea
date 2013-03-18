package levels
{
	import org.flixel.*;
	import enemies.*;
	import players.*;

	public class Level02 extends Level
	{

		
		public function Level02()
		{
			super();
			
			timeLimit = 60;
			enemyLimit = 45;
			landWidth = 5;
			eggs = 5;
			
			levelNumber = 2;
			
			map = new FlxTilemap;
			
			map.loadMap(new CSVData.map2CSV, GraphicsData.mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			Registry.map = map;
			
			map.setTileProperties(1, FlxObject.NONE, null, null, 6);

			width = map.width;
			height = map.height;
			
			Registry.map = map;
			
			add(map);
			
		}
	}

}