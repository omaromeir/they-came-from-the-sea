package collectables
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Omar
	 */
	public class Loot extends FlxSprite
	{
		public function Loot(X:Number, Y:Number) 
		{
			super(X, Y);
			makeGraphic(16, 16, 0xff000000, false);
		}
	}
}