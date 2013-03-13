package states 
{
	import collectables.Food;
	import collectables.Loot;
	import enemies.*;
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import levels.*;
	import players.*;
	import weapons.*;

	public class PlayState extends FlxState
	{
		private var player:Player;
		private var stick:Stick;
		private var level:Level01;
		private var spawnTimer:Number = 0;
		private var spawnTime:Number = 2;
		private var levelTimer:Number = 0;
		private var resetSpawn:Boolean=false;
		private var _enemies:FlxGroup;
		private var _loot:FlxGroup;
		
		private var score:FlxText;
		private var won:FlxText;
		private var timer:FlxText;
		
		public function PlayState ()
		{
		}

		override public function create():void
		{  
			FlxG.bgColor = 0xff00006f;
			
			level = new Level01;
			
			var x:int;
			var y:int;
			
			x = 1;
			y = 5;

			player = new Player(x, y);
			Registry.player = player;
			
			_enemies = new FlxGroup();
			_loot = new FlxGroup();
			
			stick = new Stick;
			
			score = new FlxText(0, 0, 100);
			score.color = 0xfff8f8f8;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "HEALTH: 100";
			
			timer = new FlxText(0, 10, 100);
			timer.color = 0xfff8f8f8;
			timer.shadow = 0xff000000;
			timer.scrollFactor.x = 0;
			timer.scrollFactor.y = 0;
			timer.text = "TIME: 0";
			
			won = new FlxText(0, 50, 256);
			won.color = 0xff000000;
			won.shadow = 0xff75c0c9;
			won.scrollFactor.x = 0;
			won.scrollFactor.y = 0;
			won.scale.x = 3;
			won.scale.y = 3;
			won.text = "YOU SURVIVED";
			won.alignment = "center";
			won.exists = false;
			
			add(level);
			add(stick);
			add(player);
			add(_loot);
			add(_enemies);
			add(score);
			add(timer);
			add(won);
			
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			FlxG.camera.setBounds(0, 0, level.width, level.height);

			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN_TIGHT);
			
			FlxG.playMusic(SoundData.track1, 0.2);
		}
		
		override public function update():void
		{
			spawnTimer += FlxG.elapsed;
			levelTimer += FlxG.elapsed;
			
			super.update();
			
			if(player.x < 0)
			{
				player.x = 0;
			}
			
			if (spawnTimer >= spawnTime) {
				var x:int = 8 * Math.random() + 8;
				var y:int = 4 * Math.random() + 2;
				_enemies.add(new Crab(16, y));
				resetSpawn = true;
			}
			
			if (levelTimer > 30)
			{
				spawnTime = 1;
				for (var i:int = 0; i < _enemies.length; i++) {
					_enemies.members[i].velocity.x = -20;
				}
			}
			
			checkEnemies();
			
			if (levelTimer > 60)
			{
				_enemies.kill();
				won.exists = true;
				if (FlxG.keys.justPressed("ENTER")) {
					FlxG.switchState(new MenuState);
				}
			}
			
			if (resetSpawn) {
				spawnTimer = 0;
				resetSpawn = false;
			}
			
			var t:int = levelTimer;
			timer.text = "TIME: " + t;
			
			score.text = "HEALTH: " + player.health;
			
			FlxG.collide(player, level);
			FlxG.overlap(player, _enemies, hitPlayer);
			FlxG.overlap(_enemies, stick, hitEnemy);
			FlxG.overlap(player, _loot, getLoot);
		}
		
		public function checkEnemies():void {
			for (var i:int = 0; i < _enemies.length; i++) {
				if (_enemies.members[i].x < 0) {
					FlxG.resetState();
				}
			}
		}
		
		public function hitPlayer(p:Player, e:Enemy):void {
			if(FlxCollision.pixelPerfectCheck(p, e)){
				p.kill();
				FlxG.resetState();
			}
		}
		
		public function hitEnemy(e:Enemy, s:Stick):void {
			if (FlxCollision.pixelPerfectCheck(e, s)) {
				e.health--;
				FlxG.play(SoundData.enemyHitSFX);
				e.kill();
				var r:int = 2 * Math.random();
				if (r >= 1) {
					_loot.add(new Food(e.x, e.y));
				}
			}
		}
		
		public function getLoot(p:Player, l:Loot):void {
			if(FlxCollision.pixelPerfectCheck(p, l)){
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