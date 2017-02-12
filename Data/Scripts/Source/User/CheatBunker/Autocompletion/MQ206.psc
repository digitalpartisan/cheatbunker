Scriptname cheatbunker:autocompletion:MQ206 extends cheatbunker:autocompletion

Group MocularLevelDetails
	MiscObject Property CircuitBoardMilitary Auto Const Mandatory
	MiscObject Property SensorModule Auto Const Mandatory
	MiscObject Property BiometricScanner Auto Const Mandatory

	Int Property CircuitBoardObjective = 121 Auto Const
	Int Property SensorModuleObjective = 131 Auto Const
	Int Property BiometricScannerObjective = 141 Auto Const
EndGroup

Function giveItem(Int iObjectiveID, MiscObject moItem)
	if (MyQuest.IsObjectiveDisplayed(iObjectiveID))
		Game.GetPlayer().AddItem(moItem)
	endif
EndFunction

Function giveCircuitBoard()
	giveItem(CircuitBoardObjective, CircuitBoardMilitary)
EndFunction

Function giveSensorModule()
	giveItem(SensorModuleObjective, SensorModule)
EndFunction

Function giveBiometricScanner()
	giveItem(BiometricScannerObjective, BiometricScanner)
EndFunction

Bool Function areObjectivesActive()
	return MyQuest.IsObjectiveDisplayed(CircuitBoardObjective) || MyQuest.IsObjectiveDisplayed(SensorModuleObjective) || MyQuest.IsObjectiveDisplayed(BiometricScannerObjective)
EndFunction

Bool Function isQuestReady()
	return areObjectivesActive()
EndFunction

Bool Function areObjectivesComplete()
	return MyQuest.IsObjectiveCompleted(CircuitBoardObjective) || MyQuest.IsObjectiveCompleted(SensorModuleObjective) || MyQuest.IsObjectiveCompleted(BiometricScannerObjective)
EndFunction

Bool Function hasWindowPassed()
	return areObjectivesComplete()
EndFunction

Function runBehavior()
	giveCircuitBoard()
	giveSensorModule()
	giveBiometricScanner()
	
	finish()
EndFunction
