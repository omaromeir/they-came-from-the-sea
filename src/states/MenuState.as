package states
{
	import cutscenes.Intro;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	
	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;
		//private var text:FlxText; //English version
		private var text:FlxSprite; //Arabic version
		private var text2:FlxText;
		private var counter:Number = 0;
		private var bg:FlxSprite;
		private var logo:FlxSprite;
		private var instructions:FlxSprite;

		public function MenuState()
		{
		}

		override public function create():void
		{
			
			FlxG.bgColor = 0xfff8f8f8;
			
			bg = new FlxSprite(0, 0, GraphicsData.mainPNG);
			bg.loadGraphic(GraphicsData.mainPNG, true, false, 256, 144, true);
			bg.addAnimation("main", [0], 0, false);
			bg.addAnimation("main2", [1], 0, false);
			bg.play("main");
			if (Registry.gameEnd) {
				bg.play("main2");
			}
			logo = new FlxSprite(25, 10, GraphicsData.logoPNG);
			logo.loadGraphic(GraphicsData.logoPNG, true, false, 204, 63);
			logo.addAnimation("shimmer", [0, 1, 0], 3, false);
			logo.play("shimmer");
			
			Registry.level = 1;
			
			/*text = new FlxText(0, 100, 256);
			text.color = 0xff000000;
			text.scrollFactor.x = 0;
			text.scrollFactor.y = 0;
			text.scale.x = 1;
			text.scale.y = 1;
			text.text = "-Press ENTER to start-";
			text.alignment = "center";
			text.exists = false;*/
			
			text = new FlxSprite(0, 105, GraphicsData.enterPNG);
			text.loadGraphic(GraphicsData.enterPNG, true, false, 256, 48);
			text.addAnimation("easy", [0], 0, false);
			text.addAnimation("hard", [1], 0, false);
			text.play("easy");
			text.exists = false;
			
			instructions = new FlxSprite(0, 0, GraphicsData.instructionsPNG);
			instructions.exists = false;

			add(bg);
			add(logo);
			add(text);
			add(text2);
			add(instructions);
		}
		
		override public function update():void
		{
			super.update();
			counter += FlxG.elapsed;
			if (counter >= 2)
			{
				logo.play("shimmer");
				text.exists = true;
				if (FlxG.keys.ENTER) {
					startGame();
				}
				if (FlxG.keys.justPressed("ESCAPE")) {
					toggleInstructions();
				}
				if (FlxG.keys.justPressed("UP")||FlxG.keys.justPressed("DOWN")) {
					toggleEasy();
				}
			}
		}

		private function startGame():void
		{
			FlxG.switchState(new Intro);
		}
		
		private function toggleInstructions():void
		{
			instructions.exists = !instructions.exists;
		}
		
		private function toggleEasy():void
		{
			if (Registry.easyMode) {
				Registry.easyMode = false;
				text.play("hard");
			}
			else {
				Registry.easyMode = true;
				text.play("easy");
			}
		}
	}
}