package players
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import weapons.*;

	public class Player extends FlxSprite
	{	
		private var lifeCount:Number = 0;
		
		public function Player(X:Number, Y:Number)
		{
			super(X*16, Y*16);

			loadGraphic(GraphicsData.playerPNG, true, true, 16, 18, true);
			
			width = 16;
			height = 16;
			offset.y = 2;
			
			health = 100;
			
			addAnimation("idle_down", [1], 0, false);
			addAnimation("idle_up", [5], 0, false);
			addAnimation("idle_side", [15], 0, false);
			addAnimation("walk", [1, 2, 1, 3], 8, true);
			addAnimation("walk_up", [5, 6, 5, 7], 8, true);
			addAnimation("walk_side", [15, 13, 15, 14], 8, true);
			addAnimation("swing_up", [4], 6, false);
			addAnimation("swing_down", [0], 6, false);
			addAnimation("swing_side", [12], 6, false);

			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_DECELERATES, 1, true, true);

			FlxControl.player1.setCursorControl(true, true, true, true);

			FlxControl.player1.setBounds(16, 0, Registry.map.width, Registry.map.height);

			FlxControl.player1.setMovementSpeed(50, 50, 50, 50);
		}
		
		override public function update():void
		{
			super.update();
			lifeCount += FlxG.elapsed;
			if (lifeCount >= 1)
			{
				health--;
				lifeCount = 0;
			}
			updateAnimations();
			if (FlxG.keys.SPACE) {
				swing();
			}
			if (FlxG.keys.justPressed("SPACE")) {
				FlxG.play(SoundData.swingSFX, 0.1);
			}
		}
		
		public function updateAnimations():void {
			if (velocity.y != 0)
			{
				if (velocity.y > 0 ) {
					play("walk");
				}
				if (velocity.y < 0 ) {
					play("walk_up");
				}
			}
			else if (velocity.x != 0)
			{
				play("walk_side");
			}
			else
			{
				if(facing == FlxObject.DOWN){
					play("idle_down");
				}
				else if(facing == FlxObject.UP){
					play("idle_up");
				}
				else if(facing == FlxObject.LEFT){
					play("idle_side");
				}
				else if(facing == FlxObject.RIGHT){
					play("idle_side");
				}
			}
		}
		
		public function swing():void
		{
			visible = true;
			if (Registry.player.facing == FlxObject.RIGHT) {
				play("swing_side");
			}
			else if (Registry.player.facing == FlxObject.LEFT) {
				play("swing_side");
			}
			else if (Registry.player.facing == FlxObject.UP) {
				play("swing_up");
			}
			else if (Registry.player.facing == FlxObject.DOWN) {
				play("swing_down");
			}
		}
	}
		
}