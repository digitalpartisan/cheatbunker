Scriptname CheatBunker:Updater:v1_1_0_to_v1_2_0 extends CheatBunker:PackageUpdater

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory
CheatBunker:IntroQuest Property CheatBunkerIntroQuest Auto Const Mandatory
Vault111ExitDetector Property CheatBunkerVault111ExitDetector Auto Const Mandatory

Function updateBehavior()
	CheatBunkerQuest.UnregisterForRemoteEvent(CheatBunkerVault111ExitDetector.MQ102, "OnStageSet")
	if (CheatBunkerIntroQuest.IsCompleted()) ; the holotape has already been handed out, but the holotape retainer will make sure the one in the player's inventory is a quest item regardless
		CheatBunkerIntroQuest.CheatBunkerHolotapeQuest.Start()
	endif
EndFunction
