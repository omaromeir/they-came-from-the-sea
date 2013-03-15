package cutscenes 
{
	import org.flixel.*;
	import states.PlayState;
	/**
	 * ...
	 * @author Omar
	 */
	public class Intro extends FlxState
	{
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame00.png')] private var frame00PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame01.png')] private var frame01PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame02.png')] private var frame02PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/bubbleSprite.png')] private var bubblePNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/playerFace.png')] private var playerFacePNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame03.png')] private var frame03PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame01_questionMark.png')] private var qMarkPNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame04.png')] private var frame04PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/playerx2Sprite.png')] private var player2xPNG:Class;
		[Embed(source='../assets/cutscenes/Intro/Intro_frame05.png')]  private var frame05PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/sadFace.png')] private var sadFacePNG:Class;
		[Embed(source='../assets/cutscenes/Intro/Intro_frame06.png')] private var frame06PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame07.png')] private var frame07PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/Intro_frame08.png')] private var frame08PNG:Class;
		[Embed(source = '../assets/cutscenes/Intro/angryFace.png')] private var angryFacePNG:Class;
		
		private var frame0:FlxSprite;
		private var playerFace:FlxSprite;
		private var frame1:FlxSprite;
		private var eggs:FlxGroup;
		private var bubble:FlxSprite;
		private var frame2:FlxSprite;
		private var frame3:FlxSprite;
		private var qMark:FlxSprite;
		private var frame4:FlxSprite;
		private var player2x:FlxSprite;
		private var frame5:FlxSprite;
		private var sadFace:FlxSprite;
		private var frame6:FlxSprite;
		private var frame7:FlxSprite;
		private var frame8:FlxSprite;
		private var angryFace:FlxSprite;
		
		private var counter:Number = 0;
		
		private var shake:Boolean = true;
		private var addEggs:Boolean = true;
		
		public function Intro() 
		{
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xfff8f8f8;
			frame0 = new FlxSprite(0, 0, frame00PNG);
			playerFace = new FlxSprite(55, 17, playerFacePNG);
			playerFace.loadGraphic(playerFacePNG, true, false, 144, 110);
			playerFace.addAnimation("blink", [0, 1, 0, 1], 4, false);
			playerFace.play("blink");
			frame1 = new FlxSprite(0, 0, frame01PNG);
			eggs = new FlxGroup();
			bubble = new FlxSprite(105, 20);
			bubble.loadGraphic(bubblePNG, true, false, 122, 63);
			bubble.addAnimation("appear", [0, 1, 2, 3, 4, 5], 2, false);
			bubble.play("appear");
			frame2 = new FlxSprite(0, 0, frame02PNG);
			frame3 = new FlxSprite(0, 0, frame03PNG);
			qMark = new FlxSprite(40, 60, qMarkPNG);
			qMark.velocity.y = -200;
			frame4 = new FlxSprite(0, 0, frame04PNG);
			player2x = new FlxSprite(129, 85, player2xPNG);
			player2x.loadGraphic(player2xPNG, true, false, 16, 18);
			player2x.addAnimation("walk", [0, 1, 0, 2], 4, true);
			player2x.addAnimation("walk_side", [3, 4, 3, 5], 4, true);
			player2x.addAnimation("idle", [0], 0, false);
			player2x.play("walk");
			player2x.scale = new FlxPoint(2, 2);
			player2x.velocity.y = -10;
			frame5 = new FlxSprite(0, 0, frame05PNG);
			sadFace = new FlxSprite(205, 75, sadFacePNG);
			sadFace.velocity.y = -200;
			frame6 = new FlxSprite(0, 0, frame06PNG);
			frame7 = new FlxSprite(0, 0, frame07PNG);
			frame8 = new FlxSprite(0, 0, frame08PNG);
			angryFace = new FlxSprite(190, 75, angryFacePNG);
			angryFace.velocity.y = -200;
		}
		
		override public function update():void
		{
			super.update();
			counter += FlxG.elapsed;
			if (counter >= 1){
				add(frame0);
				add(playerFace);
			}
			if (counter >= 3) {
				remove(frame0);
				remove(playerFace);
			}
			if (counter >= 4) {
				if (addEggs) {
					eggs.add(new Egg(2, 2));
					eggs.add(new Egg(2, 4));
					eggs.add(new Egg(3, 3));
					eggs.add(new Egg(1, 3));
					eggs.add(new Egg(1, 1));
					eggs.add(new Egg(3, 1));
					addEggs = false;
				}
				add(frame1);
				add(eggs);
			}
			if (counter >= 6) {
				remove(frame1);
				add(frame2);
				add(bubble);
			}
			if (counter >= 10) {
				remove(frame2);
				remove(eggs);
				remove(bubble);
			}
			if (counter >= 11) {
				add(frame3);
			}
			if (counter >= 12) {
				add(qMark);
				if (qMark.y <= 30) {
					qMark.velocity.y = 0;
				}
			}
			if (counter >= 13) {
				remove(frame3);
				add(frame4);
				add(player2x);
				if (player2x.y <= 50) {
					player2x.velocity.y = 0;
					player2x.play("idle");
				}
			}
			if (counter >= 17) {
				remove(frame4);
				add(frame5);
			}
			if (counter >= 18) {
				add(sadFace);
				if (sadFace.y <= 30) {
					sadFace.velocity.y = 0;
				}
			}
			if (counter >= 19) {
				remove(sadFace, true);
				remove(qMark, true);
				remove(frame5, true);
				remove(player2x);
			}
			if (counter >= 20) {
				add(frame6);
				if(shake){
					FlxG.shake(0.05, 0.1);
					shake = false;
				}
			}
			if (counter >= 21) {
				remove(frame6);
				add(frame7);
			}
			if (counter >= 22) {
				remove(frame7);
				add(frame8);
			}
			if (counter >= 23) {
				add(angryFace);
				if (angryFace.y <= 30) {
					angryFace.velocity.y = 0;
				}
			}
			if (counter >= 24) {
				FlxG.fade(0xfff8f8f8, 1, changeState);
			}
		}
		
		private function changeState():void {
			FlxG.switchState(new PlayState);
		}
		
	}

}