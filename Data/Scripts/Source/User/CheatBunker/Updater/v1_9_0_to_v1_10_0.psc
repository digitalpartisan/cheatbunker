Scriptname CheatBunker:Updater:v1_9_0_to_v1_10_0 extends chronicle:package:update

CheatBunker:IntroQuest Property CheatBunkerIntroQuest Auto Const Mandatory
{autofill}

Function updateLogic()
	CheatBunkerIntroQuest.retrofitEntranceObjective()
	CheatBunker:Dependencies:Workbenches.getInstance().Start()
	sendSuccess()
EndFunction
