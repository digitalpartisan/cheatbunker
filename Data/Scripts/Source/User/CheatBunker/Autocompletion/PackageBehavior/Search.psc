Scriptname CheatBunker:Autocompletion:PackageBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return behavior is CheatBunker:Autocompletion:PackageBehavior
EndFunction

CheatBunker:Autocompletion:PackageBehavior[] Function searchAutocompletions(Chronicle:Package targetPackage)
	return search(targetPackage) as CheatBunker:Autocompletion:PackageBehavior[]
EndFunction

CheatBunker:Autocompletion:PackageBehavior Function searchOneAutocompletion(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as CheatBunker:Autocompletion:PackageBehavior
EndFunction
