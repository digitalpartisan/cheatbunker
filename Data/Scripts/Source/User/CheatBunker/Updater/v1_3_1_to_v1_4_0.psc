Scriptname CheatBunker:Updater:v1_3_1_to_v1_4_0 extends CheatBunker:PackageUpdater

Message Property ManualUpdatedMessage Auto Const Mandatory

Function updateBehavior()
	ManualUpdatedMessage.Show()
EndFunction
