Scriptname cheatbunker:autocompletion:BallisticWeave extends cheatbunker:autocompletion

GlobalVariable Property RailroadClothingArmorModAvailable Auto Const Mandatory

Bool Function isWeaveAvailable()
	return 1 == RailroadClothingArmorModAvailable.GetvalueInt()
EndFunction

Function makeWeaveAvailable()
	RailroadClothingArmorModAvailable.SetValueInt(1)
EndFunction

Bool Function isQuestReady()
	return !isWeaveAvailable()
EndFunction

Bool Function hasWindowPassed()
	return isWeaveAvailable()
EndFunction

Function runBehavior()
	makeWeaveAvailable()
	finish()
EndFunction

Function install()
{Overridden to do nothing since there are no messages to show.}
EndFunction

Function uninstall()
{Overridden to do nothing since listening never happens.}
EndFunction
