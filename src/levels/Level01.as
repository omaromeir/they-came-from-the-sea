package levels
{
	import org.flixel.*;
	import enemies.*;
	import players.*;

	public class Level01 extends Level
	{

		
		public function Level01()
		{
			super();
			
			timeLimit = 30;
			enemyLimit = 20;
			landWidth = 5;
			eggs = 5;
			
			levelNumber = 1;
			
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