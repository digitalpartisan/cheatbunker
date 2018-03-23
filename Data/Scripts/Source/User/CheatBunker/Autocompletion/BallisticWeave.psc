Scriptname cheatbunker:autocompletion:BallisticWeave extends cheatbunker:autocompletion

GlobalVariable Property RailroadClothingArmorModAvailable Auto Const Mandatory

Bool Function canExecuteLogic()
	return 1 != RailroadClothingArmorModAvailable.GetValueInt()
EndFunction

Function executeBehavior()
	RailroadClothingArmorModAvailable.SetValueInt(1)
	conclude()
EndFunction
