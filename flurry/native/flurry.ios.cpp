
//flurry.ios.h

#import "Flurry.h"

class BBFlurry{

	static BBFlurry *_flurry;

public:
	static BBFlurry *GetFlurry();
	
	void StartSession();
	void LogEvent(String eventName);
};

//flurry.ios.cpp

#define _QUOTE(X) #X
#define _STRINGIZE(X) _QUOTE(X)

BBFlurry *BBFlurry::_flurry;

BBFlurry *BBFlurry::GetFlurry(){
	if( !_flurry ) _flurry=new BBFlurry();
	return _flurry;
}

void BBFlurry::StartSession(){	
	[Flurry startSession:@_STRINGIZE(CFG_FLURRY_IOS_PUBLISHER_ID)];
}

void BBFlurry::LogEvent(String eventName){
	[Flurry logEvent:eventName.ToNSString()];
}