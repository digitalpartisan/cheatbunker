Scriptname CheatBunker:Updater:v1_3_1_to_v1_4_0 extends Chronicle:Package:Update

Message Property ManualUpdatedMessage Auto Const Mandatory

Function updateLogic()
	; Due to issues with maintaining verion state following the Chronicle integration, all updates will be re-run in every package, so let's not send annoying and years-old messages to the user.
	; ManualUpdatedMessage.Show()
	sendSuccess()
EndFunction
