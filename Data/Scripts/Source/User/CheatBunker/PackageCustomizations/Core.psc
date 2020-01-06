Scriptname CheatBunker:PackageCustomizations:Core extends CheatBunker:PackageCustomizations

Group UtilityQuestSettings
	CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const Mandatory
EndGroup

Bool Function uninstallBehavior()
	CheatBunkerTransitQuest.forceLeaveBunker()
	return parent.uninstallBehavior()
EndFunction
