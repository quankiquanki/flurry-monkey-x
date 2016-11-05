Strict

#FLURRY_IOS_PUBLISHER_ID="6SXCPTJMDN39QNB25CFV"
#FLURRY_ANDROID_PUBLISHER_ID="P4ZJF9JPZ4TNX59MKJ97"

Import mojo

Import flurry.flurry

Function Main:Int()	
	New MonkeyApp()
	Return 0
End

Class MonkeyApp Extends App

	Field flurry:Flurry
	
	Method OnCreate:Int()
		flurry = Flurry.GetFlurry()
		flurry.StartSession()
		Return 0
	End
	
	Method OnUpdate:Int()
		If TouchHit(0)
			Print("Recording TouchHit Event.")
			flurry.LogEvent("TouchHit")
		End
		Return 0
	End
	
	Method OnRender:Int()
		Cls
		DrawText("Hit the screen to record an event.", DeviceWidth()/2, DeviceHeight()/2, 0.5, 0.5)
		Return 0
	End
	
End