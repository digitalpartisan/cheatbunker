Scriptname CheatBunker:PackageDiagnostics extends Chronicle:Package:Handler Conditional

InjectTec:Injector:Bulk:ChronicleBehavior:Search Property CheatBunkerPackageBehaviorSearchInjections Auto Const Mandatory
CheatBunker:Importer:PackageBehavior:Search Property CheatBunkerPackageBehaviorSearchImporters Auto Const Mandatory

Function forceInjections()
	InjectTec:Injector:Bulk:ChronicleBehavior InjectionBehavior = CheatBunkerPackageBehaviorSearchInjections.searchOneBulkInjector(getPackage())
	if (injectionBehavior)
		injectionBehavior.getInjections().forceInject()
	endif
EndFunction

FormList Function getImporters()
	CheatBunker:Importer:PackageBehavior importerBehavior = CheatBunkerPackageBehaviorSearchImporters.searchOneImporter(getPackage())
	if (importerBehavior)
		return importerBehavior.getImporters()
	endif
	
	return None
EndFunction
