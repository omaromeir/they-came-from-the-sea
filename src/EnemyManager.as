package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Omar
	 */
	public class EnemyManager extends FlxGroup
	{
		
		public function EnemyManager() 
		{
			var enemy:Enemy = recycleEnemy();
			enemy.reset(10, 15);
		}
		
		private function recycleEnemy():Enemy
		{
			var enemy:Enemy = getFirstAvailable() as Enemy;
			if (enemy == null)
			{
				var newEnemy:Enemy = new Enemy();
				_enemies.add(newEnemy);
				return newEnemy;
			}
			return enemy;
		}
		
	}

}