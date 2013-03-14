package enemies 
{
	/**
	 * ...
	 * @author Omar
	 */
	import org.flixel.FlxObject;
	
	public class Crab extends Enemy
	{	
		public function Crab(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(GraphicsData.crabPNG, true, true, 16, 16);
			addAnimation("walk", [1, 2, 3], 6, true);
			addAnimation("swim", [0], 0, false);
			health = 2;
			facing = FlxObject.RIGHT;
		}
		
		override public function update():void
		{
			super.update();
			
			if (Registry.map.getTile(x / 16, y / 16) == 10)
			{
				play("swim");
			}
			else {
				play("walk");
			}
			
			if (Registry.map.getTile(x / 16, y / 16) ==7) {
				turnAround(speed);
			}
		}
	}

}