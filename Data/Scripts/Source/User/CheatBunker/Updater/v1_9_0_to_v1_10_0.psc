Scriptname CheatBunker:Updater:v1_9_0_to_v1_10_0 extends chronicle:package:update

CheatBunker:IntroQuest Property CheatBunkerIntroQuest Auto Const Mandatory
{autofill}
Jiffy:BackgroundProcessor:FormListCleaner Property CheatBunkerFormListCleaner Auto Const Mandatory
{autofill}
Spawny:Spawner:AdjustmentHandler Property CheatBunkerSpawnAdjuster Auto Const Mandatory
{autofill}
CheatBunker:Worldspace Property CheatBunkerPackageBaseWorldSpaceCommonwealth Auto Const Mandatory

Function updateLogic()
	CheatBunkerSpawnAdjuster.Start()
	CheatBunkerFormListCleaner.Start()
	CheatBunkerIntroQuest.retrofitEntranceObjective()
	CheatBunker:Dependencies:Workbenches.getInstance().Start()

	CheatBunkerPackageBaseWorldSpaceCommonwealth.Start()

	sendSuccess()
EndFunction
