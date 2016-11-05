import com.flurry.android.FlurryAgent;

class BBFlurry implements Runnable{

	static BBFlurry _flurry;
	
	static public BBFlurry GetFlurry(){
		if( _flurry==null ) _flurry=new BBFlurry();
		return _flurry;
	}
	
	public void StartSession(){
		new FlurryAgent.Builder()
			.withLogEnabled(false)
            .build(BBAndroidGame.AndroidGame().GetActivity(), MonkeyConfig.FLURRY_ANDROID_PUBLISHER_ID);
	}
	
	public void LogEvent(String eventName){
		FlurryAgent.logEvent(eventName);
	}
	
	public void run(){
	}

}