package weapons 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Omar
	 */
	public class Fire extends FlxSprite
	{
		private var thrown:Boolean = false;
		private var fireTimer:Number = 0;
		
		public function Fire() 
		{
			super(Registry.player.x, Registry.player.y);
			loadGraphic(GraphicsData.firePNG, true, false, 16, 16, true);
			addAnimation("sizzle", [0, 1], 4, true);
			play("sizzle");
			visible = false;
		}
		
		override public function update():void
		{
			super.update();
			fireTimer += FlxG.elapsed;
			if (FlxG.keys.justPressed("S") && fireTimer >= 10) {
				FlxG.play(SoundData.fireSFX);
				fire();
			}
			if (thrown) 
			{
				burn();
				thrown = false;
				fireTimer = 0;
			}
			
			if (fireTimer >= 2) {
				visible = false;
			}
		}
		
		public function fire():void
		{
			thrown = true;
		}
		
		public function burn():void 
		{
			visible = true;
			if (Registry.player.facing == FlxObject.RIGHT) {
				x = Registry.player.x + 32;
				y = Registry.player.y;
			}
			else if (Registry.player.facing == FlxObject.LEFT) {
				x = Registry.player.x - 32;
				y = Registry.player.y;
			}
			else if (Registry.player.facing == FlxObject.UP) {
				y = Registry.player.y - 32;
				x = Registry.player.x;
			}
			else if (Registry.player.facing == FlxObject.DOWN) {
				y = Registry.player.y + 32;
				x = Registry.player.x;
			}
		}
	}

}