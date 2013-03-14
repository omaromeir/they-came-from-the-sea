package enemies 
{
	/**
	 * ...
	 * @author Omar
	 */
	import org.flixel.*;
	
	public class Snake extends Enemy
	{
		private var digTime:Number=0;
		
		public function Snake(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(GraphicsData.snakePNG, true, false, 16, 16);
			addAnimation("dig", [0, 1], 6, true);
			addAnimation("walk", [2, 3], 6, true);
			play("dig");
			health = 2;
		}
		
		override public function update():void
		{
			super.update();
			digTime += FlxG.elapsed;
			if (digTime > 1) {
				play("walk");
			}
		}
		
	}

}