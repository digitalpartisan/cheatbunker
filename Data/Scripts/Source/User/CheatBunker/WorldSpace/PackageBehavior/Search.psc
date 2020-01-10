Scriptname CheatBunker:WorldSpace:PackageBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as CheatBunker:WorldSpace:PackageBehavior)
EndFunction

CheatBunker:WorldSpace:PackageBehavior[] Function searchWorldSpaces(Chronicle:Package targetPackage)
	return search(targetPackage) as CheatBunker:WorldSpace:PackageBehavior[]
EndFunction

CheatBunker:WorldSpace:PackageBehavior Function searchOneWorldSpace(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as CheatBunker:WorldSpace:PackageBehavior
EndFunction
