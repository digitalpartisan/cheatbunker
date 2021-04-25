Scriptname CheatBunker:Development:Build:PackageBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as CheatBunker:Development:Build:PackageBehavior)
EndFunction

CheatBunker:Development:Build:PackageBehavior[] Function searchBuilds(Chronicle:Package targetPackage)
	return search(targetPackage) as CheatBunker:Development:Build:PackageBehavior[]
EndFunction

CheatBunker:Development:Build:PackageBehavior Function searchOneBuild(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as CheatBunker:Development:Build:PackageBehavior
EndFunction
