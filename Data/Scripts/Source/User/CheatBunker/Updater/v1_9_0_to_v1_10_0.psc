Scriptname CheatBunker:Updater:v1_9_0_to_v1_10_0 extends chronicle:package:update

Function updateLogic()
	CheatBunker:Dependencies:Workbenches.getInstance().Start()
	sendSuccess()
EndFunction
