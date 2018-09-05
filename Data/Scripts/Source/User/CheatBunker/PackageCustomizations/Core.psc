Scriptname CheatBunker:PackageCustomizations:Core extends CheatBunker:PackageCustomizations

Group UtilityQuestSettings
	CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const Mandatory
EndGroup

Bool Function installBehavior()
	if (!parent.installBehavior())
		return false
	endif
	
	CheatBunkerTransitQuest.forcePreloadCell()
	return true
	
EndFunction

Bool Function postloadBehavior()
	if (!parent.postloadBehavior())
		return false
	endif
	
	CheatBunkerTransitQuest.forcePreloadCell()
	
	return true
EndFunction

Bool Function uninstallBehavior()
	CheatBunkerTransitQuest.forceLeaveBunker()
	CheatBunkerTransitQuest.Stop()
	
	if (!parent.uninstallBehavior())
		return false
	endif
	
	return true
EndFunction
