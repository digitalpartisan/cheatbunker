Scriptname CheatBunker:Updater:v1_9_0_to_v1_10_0 extends chronicle:package:update

CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const Mandatory
CheatBunker:Settings Property CheatBunkerSettings Auto Const Mandatory

Function updateLogic()
	CheatBunkerSettings.preloadInterior(CheatBunkerTransitQuest.preloadingCell())
	CheatBunker:Dependencies:Workbenches.getInstance().Start()
	sendSuccess()
EndFunction
