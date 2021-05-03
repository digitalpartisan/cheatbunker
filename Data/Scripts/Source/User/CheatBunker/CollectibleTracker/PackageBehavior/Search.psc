Scriptname CheatBunker:CollectibleTracker:PackageBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as CheatBunker:CollectibleTracker:PackageBehavior)
EndFunction

CheatBunker:CollectibleTracker:PackageBehavior[] Function searchTrackers(Chronicle:Package targetPackage)
	return search(targetPackage) as CheatBunker:CollectibleTracker:PackageBehavior[]
EndFunction

CheatBunker:CollectibleTracker:PackageBehavior Function searchOneTracker(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as CheatBunker:CollectibleTracker:PackageBehavior
EndFunction
