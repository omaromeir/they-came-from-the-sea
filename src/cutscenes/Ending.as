package cutscenes 
{
	import org.flixel.*;
	import states.MenuState;
	import states.PlayState;
	/**
	 * ...
	 * @author Omar
	 */
	public class Ending extends FlxState
	{
		[Embed(source='../assets/cutscenes/Ending/Ending_fram00.png')] private var frame00PNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/Ending_fram01.png')] private var frame01PNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/eggHatchSpriteSheet.png')] private var hatchPNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/Ending_fram02.png')] private var frame02PNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/excMark.png')] private var excMarkPNG:Class;
		[Embed(source='../assets/cutscenes/Ending/Ending_fram03.png')] private var frame03PNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/Ending_fram04.png')] private var frame04PNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/playerHopSpriteSheet.png')] private var playerHopPNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/laugh.png')] private var laughPNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/duckPlayerSpriteSheet.png')] private var duckPlayerPNG:Class;
		[Embed(source = '../assets/cutscenes/Ending/credits.png')] private var creditsPNG:Class;
		
		private var frame0:FlxSprite;
		private var frame1:FlxSprite;
		private var egg:FlxSprite;
		private var excMark:FlxSprite;
		private var frame2:FlxSprite;
		private var frame3:FlxSprite;
		private var frame4:FlxSprite;
		private var playerHop:FlxSprite;
		private var laugh:FlxSprite;
		private var duckPlayer:FlxSprite;
		private var credits:FlxSprite;
		
		private var counter:Number = 0;
		
		private var hatch:Boolean = true;
		
		public function Ending() 
		{
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xfff8f8f8;
			frame0 = new FlxSprite(0, 0, frame00PNG);

			frame1 = new FlxSprite(0, 0, frame01PNG);
			
			egg = new FlxSprite(120, 30, hatchPNG);
			egg.loadGraphic(hatchPNG, true, false, 16, 16, false);
			egg.addAnimation("crack", [0, 1], 2, false);
			egg.addAnimation("hatch", [1, 2, 3, 4, 5, 6, 7], 2, false);
			egg.scale = new FlxPoint(5, 5);
			egg.play("crack");
			
			frame2 = new FlxSprite(0, 0, frame02PNG);
			
			excMark = new FlxSprite(225, 90, excMarkPNG);
			excMark.velocity.y = -200;
			
			frame3 = new FlxSprite(0, 0, frame03PNG);
			
			frame4 = new FlxSprite(0, 0, frame04PNG);
			
			playerHop = new FlxSprite(215, 90, playerHopPNG);
			playerHop.loadGraphic(playerHopPNG, true, false, 16, 18, false);
			playerHop.addAnimation("hop", [0, 1], 2, true);
			playerHop.play("hop");
			
			laugh = new FlxSprite(220, 100, laughPNG);
			laugh.velocity.y = -200;
			
			duckPlayer = new FlxSprite(5, 120, duckPlayerPNG);
			duckPlayer.loadGraphic(duckPlayerPNG, true, false, 32, 18, false);
			duckPlayer.addAnimation("walk", [0, 1], 2, true);
			duckPlayer.play("walk");
			
			credits = new FlxSprite(0, 144, creditsPNG);
			credits.velocity.y = -10;
			
			Registry.gameEnd = true;
		}
		
		override public function update():void
		{
			super.update();
			counter += FlxG.elapsed;
			if (counter >= 1){
				add(frame0);
			}
			if (counter >= 3) {
				remove(frame0);
				add(frame1);
				add(egg);
			}
			if (counter >= 5) {
				remove(frame1);
				add(frame2);
				add(excMark);
				if (excMark.y <= 75)
				{
					excMark.velocity.y = 0;
				}
			}
			if (counter >= 7) {
				remove(frame2);
				remove(egg);
				remove(excMark);
				add(frame3);
				egg.y = 60;
				egg.x = 80;
				add(egg);
				if(hatch){
					egg.play("hatch");
					hatch = false;
				}
			}
			if (counter >= 11) {
				remove(frame3);
				add(frame4);
				add(playerHop);
			}
			if (counter >= 11) {
				add(laugh);
				if (laugh.y <= 85)
				{
					laugh.velocity.y = 0;
				}
			}
			if (counter >= 14) {
				remove(egg);
				remove(laugh);
				remove(playerHop);
				remove(frame4);
			}
			if (counter >= 15) {
				add(credits);
				add(duckPlayer);
				if (credits.y <= 0) {
					credits.velocity.y = 0;
				}
			}
			if (counter >= 35) {
				FlxG.fade(0xfff8f8f8, 1, changeState);
			}
		}
		
		private function changeState():void {
			FlxG.switchState(new MenuState);
		}
		
	}

}