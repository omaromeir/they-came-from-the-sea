package weapons 
{
	import org.flixel.*;

	public class Stick extends FlxSprite
	{
		public var damage:int = 1;
		public function Stick() 
		{
			super(Registry.player.x, Registry.player.y);
			loadGraphic(GraphicsData.stickPNG, true, false, 12, 12);
			addAnimation("swing_up", [0], 6, false);
			addAnimation("swing_down", [1], 6, false);
			addAnimation("swing_left", [2], 6, false);
			addAnimation("swing_right", [3], 6, false);
		}
		
		override public function update():void
		{
			super.update();
			x = Registry.player.x;
			y = Registry.player.y;
			visible = false;
			if (FlxG.keys.SPACE) {
				swing();
			}
		}
		
		public function swing():void
		{
			visible = true;
			if (Registry.player.facing == FlxObject.RIGHT) {
				play("swing_right");
				x = Registry.player.x + 15;
			}
			else if (Registry.player.facing == FlxObject.LEFT) {
				play("swing_left");
				x = Registry.player.x - 10;
			}
			else if (Registry.player.facing == FlxObject.UP) {
				play("swing_up");
				y = Registry.player.y - 10;
			}
			else if (Registry.player.facing == FlxObject.DOWN) {
				play("swing_down");
				y = Registry.player.y + 15;
			}
		}
	}

}