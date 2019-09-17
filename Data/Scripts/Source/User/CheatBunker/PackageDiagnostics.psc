Scriptname CheatBunker:PackageDiagnostics extends Chronicle:Package:Handler Conditional

Function forceInjections()
	InjectTec:Injector:Bulk:ChronicleBehavior InjectionBehavior = CheatBunker:Dependencies:General.getInstance().getInjectionSearcher().searchOneBulkInjector(getPackage())
	if (injectionBehavior)
		injectionBehavior.getInjections().forceInject()
	endif
EndFunction

FormList Function getImporters()
	CheatBunker:Importer:PackageBehavior importerBehavior = CheatBunker:Dependencies:General.getInstance().getImporterSearcher().searchOneImporter(getPackage())
	if (importerBehavior)
		return importerBehavior.getImporters()
	endif
	
	return None
EndFunction
