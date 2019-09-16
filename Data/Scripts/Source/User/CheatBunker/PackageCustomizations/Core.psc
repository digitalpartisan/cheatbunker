Scriptname CheatBunker:PackageCustomizations:Core extends CheatBunker:PackageCustomizations

Group UtilityQuestSettings
	CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const Mandatory
EndGroup

Bool Function installBehavior()
	CheatBunkerTransitQuest.forcePreloadCell()
	return parent.installBehavior()
EndFunction

Bool Function postloadBehavior()
	CheatBunkerTransitQuest.forcePreloadCell()
	return parent.postloadBehavior()
EndFunction

Bool Function uninstallBehavior()
	CheatBunkerTransitQuest.forceLeaveBunker()
	return parent.uninstallBehavior()
EndFunction
