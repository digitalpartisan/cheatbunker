Scriptname CheatBunker:Setting:PackageBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return (behavior as CheatBunker:Setting:PackageBehavior)
EndFunction

CheatBunker:Setting:PackageBehavior[] Function searchSettings(Chronicle:Package targetPackage)
	return search(targetPackage) as CheatBunker:Setting:PackageBehavior[]
EndFunction

CheatBunker:Setting:PackageBehavior Function searchOneSetting(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as CheatBunker:Setting:PackageBehavior
EndFunction
