package enemies 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class Enemy extends FlxSprite
	{
		
		public function Enemy(X:Number, Y:Number) 
		{
			super(X*16, Y*16);
			makeGraphic(16, 16, 0xff000000, false);
			velocity.x = -10;
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}