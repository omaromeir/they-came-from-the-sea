package collectables 
{
	/**
	 * ...
	 * @author Omar
	 */
	import org.flixel.*;
	
	public class Food extends Loot
	{
		private var lifeCount:Number = 0;
		public function Food(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(GraphicsData.foodPNG, false, false, 16, 16, false);
		}
		
		override public function update():void
		{
			super.update();
			lifeCount += FlxG.elapsed;
			FlxG.log(lifeCount);
			if (lifeCount > 5)
			{
				exists = false;
			}
		}
		
	}

}