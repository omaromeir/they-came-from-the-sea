package  
{
	/**
	 * ...
	 * @author Omar
	 */
	public class GraphicsData 
	{
		[Embed(source = 'assets/playerSpriteSheet.png')] public static var playerPNG:Class; 
		[Embed(source = "assets/maptileSet01.png")] public static var mapTilesPNG:Class;
		[Embed(source = 'assets/stickSpriteSheet.png')] public static var stickPNG:Class;
		[Embed(source = 'assets/crabSpriteSheet.png')] public static var crabPNG:Class;
		[Embed(source = 'assets/logo.png')] public static var logoPNG:Class;
		
		public function GraphicsData() 
		{
			
		}
		
	}

}