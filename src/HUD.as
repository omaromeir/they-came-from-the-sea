package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class HUD extends FlxSprite
	{
		private var timer:Number = 0;
		private var isFull:Boolean = false;
		
		public function HUD() 
		{
			super(205, 3, GraphicsData.hudPNG);
			loadGraphic(GraphicsData.hudPNG, true, false, 50, 18, true);
			addAnimation("full", [0], 0, false);
			addAnimation("out", [1], 0, false);
			scrollFactor.x = 0;
			scrollFactor.y = 0;
			play("out");
		}
		
		override public function update():void {
			timer += FlxG.elapsed;
			if (timer >= 10) {
				play("full");
				isFull = true;
			}
			if (FlxG.keys.justPressed("S") && isFull) {
				play("out");
				timer = 0;
				isFull = false;
			}
		}
		
	}

}