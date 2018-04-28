Scriptname CheatBunker:PackageCustomizations:Core extends CheatBunker:PackageCustomizations

Group UtilityQuestSettings
	FormList Property CheatBunkerUninstallQuests Auto Const Mandatory
	CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const Mandatory
EndGroup

Function terminateHelperQuests()
	Int iCounter = 0
	Int iSize = CheatBunkerUninstallQuests.GetSize()
	While (iCounter < iSize)
		(CheatBunkerUninstallQuests.GetAt(iCounter) as Quest).Stop()
		iCounter += 1
	EndWhile
EndFunction

Bool Function installBehavior()
	parent.installBehavior()
	CheatBunkerTransitQuest.forcePreloadCell()
	return true
EndFunction

Bool Function postloadBehavior()
	parent.postloadBehavior()
	CheatBunkerTransitQuest.forcePreloadCell()
	return true
EndFunction

Bool Function uninstallBehavior()
	CheatBunkerTransitQuest.forceLeaveBunker()
	parent.uninstallBehavior()
	terminateHelperQuests()
	return true
EndFunction
