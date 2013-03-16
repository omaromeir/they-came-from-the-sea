package enemies 
{
	/**
	 * ...
	 * @author Omar
	 */
	public class Merman extends Enemy
	{
		
		public function Merman(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(GraphicsData.mermanPNG, true, false, 16, 24);
			addAnimation("walk", [9, 10, 11], 6, true);
			addAnimation("swim", [8], 0, false);
			health = 5;
			ID = 2;
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