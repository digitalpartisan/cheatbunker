Scriptname CheatBunker:Updater:v1_7_0_to_v1_8_0 extends Chronicle:Package:Update

Function updateLogic()
	CheatBunker:Autocompletion.retrofitPackage(getPackage())
EndFunction
