package states 
{
	import collectables.Food;
	import collectables.Loot;
	import cutscenes.Ending;
	import cutscenes.levelIntro;
	import enemies.*;
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	import org.flixel.plugin.photonstorm.*;
	import levels.*;
	import players.*;
	import weapons.*;

	public class PlayState extends FlxState
	{
		private var player:Player;
		
		private var fire:Fire;
		private var stick:Stick;
		
		private var level:Level;
		private var spawnTimer:Number = 0;
		private var spawnTime:Number = 2;
		private var levelTimer:Number = 0;
		private var fadeTimer:Number = 0;
		private var resetSpawn:Boolean=false;
		private var _enemies:FlxGroup;
		private var _loot:FlxGroup;
		private var _eggs:FlxGroup;
		private var box:Box;
		
		private var timeLimit:int;
		
		private var loseScreen:FlxSprite;
		
		private var _enemyHit:Boolean = false;
		private var _lost:Boolean = false;
		
		//hud elements
		private var HPBar:FlxBar;
		private var wHUD:FlxSprite;
		private var score:FlxText;
		private var winScreen:FlxSprite;
		private var timer:FlxText;
		
		public function PlayState ()
		{
		}

		override public function create():void
		{  
			FlxG.bgColor = 0xff00006f;
			
			if(Registry.level==1){
				level = new Level01;
			}
			else if(Registry.level==2){
				level = new Level02;
			}
			else if(Registry.level==3){
				level = new Level03;
			}
			else if(Registry.level==4){
				level = new Level04;
			}
			else{
				level = new Level05;
			}
			
			timeLimit = level.timeLimit;
			
			var x:int;
			var y:int;
			
			x = 1;
			y = 5;

			player = new Player(x, y);
			Registry.player = player;
			
			_enemies = new FlxGroup();
			_loot = new FlxGroup();
			_eggs = new FlxGroup(7);
			_eggs.add(new Egg(0, 2));
			_eggs.add(new Egg(0, 3));
			_eggs.add(new Egg(0, 4));
			_eggs.add(new Egg(0, 5));
			_eggs.add(new Egg(0, 6));
			if (Registry.level == 3) {
				_eggs.add(new Egg(0, 1));
				_eggs.add(new Egg(0, 7));
			}
			
			stick = new Stick;
			fire = new Fire;
			
			score = new FlxText(0, 0, 100);
			score.color = 0xfff8f8f8;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "HP:";
			
			timer = new FlxText(0, 10, 100);
			timer.color = 0xfff8f8f8;
			timer.shadow = 0xff000000;
			timer.scrollFactor.x = 0;
			timer.scrollFactor.y = 0;
			timer.text = "TIME: 0";
			
			winScreen = new FlxSprite(0, 0, GraphicsData.winPNG);
			winScreen.alpha = 0;
			winScreen.exists = false;
			
			loseScreen = new FlxSprite(0, 0, GraphicsData.losePNG);
			loseScreen.alpha = 0;
			loseScreen.exists = false;
			
			
			
			add(level);
			
			box = new Box(2, 4);
			add(box);
			
			if (Registry.level == 1)
			{
				box.exists = false;
			}
			
			add(_loot);
			add(fire);
			add(_enemies);
			add(_eggs);
			add(stick);
			add(player);
			add(score);
			add(timer);
			
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			FlxG.camera.setBounds(0, 0, level.width, level.height);

			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN_TIGHT);
			
			FlxG.playMusic(SoundData.track1, 0.2);
			
			HPBar = new FlxBar(20, 3, FlxBar.FILL_LEFT_TO_RIGHT, 100, 4, player, "health");
			
			HPBar.createImageBar(null, GraphicsData.heartPNG, 0xff);
			
			add(HPBar);
			wHUD = new HUD();
			add(wHUD);
			add(loseScreen);
			add(winScreen);
		}
		
		override public function update():void
		{
			spawnTimer += FlxG.elapsed;
			levelTimer += FlxG.elapsed;
			
			if (_lost) {
				loseScreen.exists = true;
				fadeTimer += FlxG.elapsed;
				if(fadeTimer < 1 && loseScreen.alpha < 1)
				{
					loseScreen.alpha += 0.05;
				}
				player.kill();
				_enemies.kill();
				FlxG.music.stop();
				if(FlxG.keys.ENTER){
					FlxG.resetState();
				}
			}
			
			super.update();
			if (FlxG.keys.justReleased("SPACE") && _enemyHit)
			{
				_enemyHit = false;
			}
			if(player.x < 0)
			{
				player.x = 0;
			}
			
			if (spawnTimer >= spawnTime) {
				var eY:int;
				if (Registry.level == 3){
					eY = level.landWidth * Math.random() + 1;
				}
				else{
					eY = level.landWidth * Math.random() + 2;
				}
				var snakeY:int;
				if (Registry.level == 1 || Registry.level == 5) {
					snakeY =  level.landWidth * Math.random() + 2;
				}
				else if (Registry.level == 2 || Registry.level == 3) {
					snakeY =  3 * Math.random() + 3;
				}
				else {
					snakeY = 4;	
				}
				if (levelTimer > timeLimit / 2 && Registry.level > 1)
				{
					_enemies.add(new Snake(13, snakeY));
				}
				if (Registry.level == 5)
				{
					_enemies.add(new Merman(16, eY));
				}
				else
				{
					_enemies.add(new Crab(16, eY));
				}
				resetSpawn = true;
			}
			
			if (levelTimer > timeLimit)//win!
			{
				if(level.levelNumber == 1){
					Registry.level=2;
				}
				else if(level.levelNumber == 2){
					Registry.level=3;
				}
				else if(level.levelNumber == 3){
					Registry.level=4;
				}
				else if(level.levelNumber == 4){
					Registry.level=5;
				}
				else if(level.levelNumber == 5){
					Registry.level=6;
				}
				_enemies.kill();
				player.kill();
				winScreen.exists = true;
				fadeTimer += FlxG.elapsed;
				if(fadeTimer < 1 && winScreen.alpha < 1)
				{
					winScreen.alpha += 0.05;
				}
				if (FlxG.keys.justPressed("ENTER")) {
					FlxG.music.destroy();
					if (Registry.level == 6) {
						FlxG.switchState(new Ending);
					}
					else{
						FlxG.switchState(new levelIntro);
					}
				}
			}
			
			if (resetSpawn) {
				spawnTimer = 0;
				resetSpawn = false;
			}

			if (player.health == 0)
			{
				_lost = true;
			}
			
			var t:int = levelTimer;
			timer.text = "TIME: " + t;
			
			score.text = "HP:";
			
			FlxG.collide(player, level);
			FlxG.collide(player, box);
			FlxG.collide(box, level);
			FlxG.collide(box, _enemies, hitBox);
			FlxG.overlap(player, _enemies, hitPlayer);
			FlxG.overlap(_enemies, stick, hitEnemy);
			FlxG.overlap(_enemies, fire, burnEnemy);
			FlxG.overlap(_enemies, _eggs, hitEgg);
			FlxG.overlap(player, _loot, getLoot);
		}
		
		public function hitEgg(e:Enemy, g:Egg):void {
			if (FlxCollision.pixelPerfectCheck(e, g))
			{
				FlxG.log("enemy");
				_lost = true;
			}
		}
		
		public function hitBox(b:Box, e:Enemy):void {
			if(e.ID!=2){
				e.turnAround(e.speed);
			}
			else {
				b.kill();
			}
		}
		
		public function hitPlayer(p:Player, e:Enemy):void {
			if (FlxCollision.pixelPerfectCheck(p, e))
			{
				p.health -= 10;
				if (p.health < 0)
				{
					p.health = 0;
				}
				FlxG.play(SoundData.playerHitSFX);
				if (p.solid && FlxCollision.pixelPerfectCheck(p, e) )
				{
				 	pushPlayer(p, e);
				}
				p.flicker(0.5);
				p.solid = false;
			}
		}
		
		public function pushPlayer(p:Player, e:Enemy):void {
			if (p.facing == FlxObject.DOWN)
			{
				p.y = p.y - 5;	
			}
			if (p.x > e.x)
			{
				p.x = p.x + 5;	
			}	
			if (p.facing == FlxObject.UP)
			{
				p.y = p.y + 5;	
			}
			if (p.x < e.x)
			{
				p.x = p.x - 5;	
			}
		}
		
		public function hitEnemy(e:Enemy, s:Stick):void {
			if (FlxCollision.pixelPerfectCheck(e, s) && !_enemyHit) {
				e.flicker(0.2);
				e.health--;
				_enemyHit = true;
				FlxG.play(SoundData.enemyHitSFX);
				if (e.health == 0)
				{
					e.kill();
					var r:int = 2 * Math.random();
					if (r >= 1)
					{
						_loot.add(new Food(e.x, e.y));

					}
				}
			}
		}
		
		public function burnEnemy(e:Enemy, f:Fire):void {
			if(f.visible){
				if (FlxCollision.pixelPerfectCheck(e, f)) {
					e.flicker(0.2);
					e.health--;
					if (e.health == 0)
					{
						e.kill();
					}
				}
			}
		}
		
		public function getLoot(p:Player, l:Loot):void {
			if (FlxCollision.pixelPerfectCheck(p, l)) {
			FlxG.play(SoundData.foodSFX);	
				l.kill();
				p.health += 5;
				if (p.health > 100)
				{
					p.health = 100;
				}
			}
		}
	}
}