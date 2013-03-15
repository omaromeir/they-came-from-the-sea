package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Omar
	 */
	public class Box extends FlxSprite
	{
		
		public function Box(X:int, Y:int) 
		{
			super(X*16, Y*16, GraphicsData.boxPNG);
			loadGraphic(GraphicsData.boxPNG, false, false, 16, 16);
			drag.x = 600;
			drag.y = 600;
		}
		
	}

}