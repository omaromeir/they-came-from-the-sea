package enemies 
{
	/**
	 * ...
	 * @author Omar
	 */
	import org.flixel.*;
	
	public class Snake extends Enemy
	{
		private var digTime:Number = 0;
		
		public function Snake(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(GraphicsData.snakePNG, true, true, 16, 16);
			addAnimation("dig", [0, 1], 6, true);
			addAnimation("walk", [2, 3], 6, true);
			play("dig");
			health = 2;
			speed = 20;
			velocity.x = -speed;
		}
		
		override public function update():void
		{
			super.update();
			digTime += FlxG.elapsed;
			if (digTime > 1) {
				play("walk");
			}
			if (Registry.map.getTile(x / 16, y / 16) == 10)
			{
				kill();
			}
		}
		
	}

}