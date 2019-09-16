Scriptname CheatBunker:Importer:PackageBehavior:Search extends Chronicle:Package:CustomBehavior:BehaviorSearch

Bool Function meetsCriteria(Chronicle:Package:CustomBehavior behavior)
	return behavior is CheatBunker:Importer:PackageBehavior
EndFunction

CheatBunker:Importer:PackageBehavior[] Function searchImporters(Chronicle:Package targetPackage)
	return search(targetPackage) as CheatBunker:Importer:PackageBehavior[]
EndFunction

CheatBunker:Importer:PackageBehavior Function searchOneImporter(Chronicle:Package targetPackage)
	return searchOne(targetPackage) as CheatBunker:Importer:PackageBehavior
EndFunction
