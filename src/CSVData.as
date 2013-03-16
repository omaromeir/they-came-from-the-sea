package  
{
	/**
	 * ...
	 * @author Omar
	 */
	public class CSVData 
	{
		[Embed(source = "assets/rooms/Room01.csv", mimeType = "application/octet-stream")] public static var map1CSV:Class;
		[Embed(source = 'assets/rooms/Room02.csv', mimeType = 'application/octet-stream')] public static var map2CSV:Class;
		[Embed(source = "assets/rooms/Room03.csv", mimeType = "application/octet-stream")] public static var map3CSV:Class;
		[Embed(source = 'assets/rooms/Room04.csv', mimeType = 'application/octet-stream')] public static var map4CSV:Class;
		[Embed(source = "assets/rooms/Room05.csv", mimeType = "application/octet-stream")] public static var map5CSV:Class;

		public function CSVData() 
		{
			
		}
		
	}

}