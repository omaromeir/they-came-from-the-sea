package enemies 
{
	/**
	 * ...
	 * @author Omar
	 */
	public class Crab extends Enemy
	{
		
		public function Crab(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(GraphicsData.crabPNG, true, false, 16, 16);
			addAnimation("walk", [1, 2, 3], 6, true);
			addAnimation("swim", [0], 0, false);
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
		}
		
	}

}