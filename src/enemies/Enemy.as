package enemies 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class Enemy extends FlxSprite
	{
		public var speed:int=10;
		public function Enemy(X:Number, Y:Number) 
		{
			super(X*16, Y*16);
			makeGraphic(16, 16, 0xff000000, false);
			velocity.x = -speed;
		}
		
		override public function update():void
		{
			super.update();
		}
		
		protected function turnAround(speed:int):void {
			if (facing == FlxObject.RIGHT)
			{
				facing = FlxObject.LEFT;
				
				velocity.x = speed;
			}
			else
			{
				facing = FlxObject.RIGHT;
				
				velocity.x = -speed;
			}
		}
		
	}

}