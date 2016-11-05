#If TARGET<>"ios" And TARGET<>"android"
	#Print("The Flurry module is only available on the ios and android targets")
	#Print("A Mock class is now used to compile to other targets without causing errors.")
	
	'Mock class, so you can compile to non-supported targets without any problem.
	'Also serves as an interface of what functions and methods this module has.
	Class Flurry
		Function GetFlurry:Flurry()
			Return New Flurry()
		End
	
		Method StartSession:Void()
		End
		Method LogEvent:Void(eventName:String)
		End
	End
#End

#If TARGET="ios"
	Import "native/flurry.ios.cpp"

	#LIBS+="${CD}/native/iOS-Flurry/libFlurry_7.6.6.a"
	#LIBS+="${CD}/native/iOS-Flurry/Flurry.h"

	#LIBS+="Security.framework"
	#LIBS+="SystemConfiguration.framework"
	
#Elseif TARGET="android"
	Import "native/flurry.android.java"

	#LIBS+="${CD}/native/Android-Flurry/flurryAnalytics_6.5.0.jar"
	#ANDROID_MANIFEST_MAIN+="<uses-permission android:name=~qandroid.permission.INTERNET~q />"
#End

#If TARGET="ios" Or TARGET="android"
	Extern

	Class Flurry Extends Null="BBFlurry"

		Function GetFlurry:Flurry()
	
		Method StartSession:Void()
		Method LogEvent:Void(eventName:String)
	
	End
#End