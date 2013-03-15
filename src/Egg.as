package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class Egg extends FlxSprite
	{
		
		public function Egg(X:int, Y:int) 
		{
			super(X*16, Y*16, GraphicsData.eggPNG);
			loadGraphic(GraphicsData.eggPNG, true, true, 16, 16);
			addAnimation("hop", [0, 1], 2, true);
			play("hop");
		}
		
	}

}