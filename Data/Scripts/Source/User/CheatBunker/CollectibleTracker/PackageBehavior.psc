Scriptname CheatBunker:CollectibleTracker:PackageBehavior extends Chronicle:Package:CustomBehavior

FormList Property MyTrackers Auto Const Mandatory

FormList Function getTrackers()
	return MyTrackers
EndFunction

Bool Function uninstallBehavior()
	CheatBunker:CollectibleTracker.stopBulk(getTrackers())
	return true
EndFunction
