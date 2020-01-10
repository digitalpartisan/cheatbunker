Scriptname CheatBunker:PackageCustomizations:Core extends Chronicle:Package:CustomBehavior

Bool Function uninstallBehavior()
	CheatBunker:Dependencies:General.getInstance().getTransitQuest().forceLeaveBunker()
	return true
EndFunction
