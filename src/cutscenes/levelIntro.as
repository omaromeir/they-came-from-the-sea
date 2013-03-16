package cutscenes 
{
	import org.flixel.*;
	import states.PlayState;
	/**
	 * ...
	 * @author Omar
	 */
	public class levelIntro extends FlxState
	{
		private var intro1:FlxSprite;
		
		public function levelIntro() {
			if(Registry.level==1){
				intro1 = new FlxSprite(0, 0, GraphicsData.level1IntroPNG);
				add(intro1);
			}
			else if(Registry.level==2){
				intro1 = new FlxSprite(0, 0, GraphicsData.level2IntroPNG);
				add(intro1);
			}
			else if(Registry.level==3){
				intro1 = new FlxSprite(0, 0, GraphicsData.level3IntroPNG);
				add(intro1);
			}
			else if(Registry.level==4){
				intro1 = new FlxSprite(0, 0, GraphicsData.level4IntroPNG);
				add(intro1);
			}
			else{
				intro1 = new FlxSprite(0, 0, GraphicsData.level5IntroPNG);
				add(intro1);
			}
		}
		
		override public function update():void {
			if (FlxG.keys.ENTER) {
				FlxG.fade(0xfff8f8f8, 1, changeState);
			}
		}
		
		private function changeState():void {
			FlxG.switchState(new PlayState);
		}
		
	}

}