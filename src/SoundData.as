package  
{
	/**
	 * ...
	 * @author Omar
	 */
	public class SoundData 
	{
		[Embed(source='assets/sound/SFX/swingSFX.mp3')] public static var swingSFX:Class;
		[Embed(source = 'assets/sound/SFX/successSFX.mp3')]  public static var successSFX:Class;
		[Embed(source = 'assets/sound/SFX/enemyHitSFX.mp3')]  public static var enemyHitSFX:Class;
		[Embed(source = 'assets/sound/track01.mp3')]  public static var track1:Class;
		
		public function SoundData() 
		{
			
		}
		
	}

}