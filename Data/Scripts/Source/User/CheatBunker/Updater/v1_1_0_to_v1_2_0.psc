Scriptname CheatBunker:Updater:v1_1_0_to_v1_2_0 extends Chronicle:Package:Update

CheatBunker:IntroQuest Property CheatBunkerIntroQuest Auto Const Mandatory
Vault111ExitDetector Property CheatBunkerVault111ExitDetector Auto Const Mandatory

Function updateLogic()
	getPackage().getEngine().UnregisterForRemoteEvent(CheatBunkerVault111ExitDetector.MQ102, "OnStageSet") ; the engine is no longer responsible for handling the issue of the player having left vault 111
	
	if (CheatBunkerIntroQuest.IsCompleted()) ; the holotape has already been handed out, but the holotape retainer will make sure the one in the player's inventory is a quest item regardless
		CheatBunkerIntroQuest.CheatBunkerHolotapeQuest.Start()
	endif
	
	sendSuccess()
EndFunction
