package levels
{
	import org.flixel.*;
	import enemies.*;
	import players.*;

	public class Level05 extends Level
	{

		
		public function Level05()
		{
			super();
			
			timeLimit = 90;
			enemyLimit = 50;
			landWidth = 4;
			eggs = 5;
			
			levelNumber = 5;
			
			map = new FlxTilemap;
			
			map.loadMap(new CSVData.map1CSV, GraphicsData.mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			Registry.map = map;
			
			map.setTileProperties(1, FlxObject.NONE, null, null, 6);

			width = map.width;
			height = map.height;
			
			Registry.map = map;
			
			add(map);
			
		}
	}

}