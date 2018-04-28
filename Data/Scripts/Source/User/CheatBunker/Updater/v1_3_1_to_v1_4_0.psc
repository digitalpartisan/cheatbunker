Scriptname CheatBunker:Updater:v1_3_1_to_v1_4_0 extends Chronicle:Package:Update

Message Property ManualUpdatedMessage Auto Const Mandatory

Function updateLogic()
	ManualUpdatedMessage.Show()
	sendSuccess()
EndFunction
