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

FormList Function getSettings()
    CheatBunker:Setting:PackageBehavior settingBehavior = CheatBunker:Dependencies:General.getInstance().getSettingSearcher().searchOneSetting(getPackage())
    if (settingBehavior)
        return settingBehavior.getSettings()
    endif

    return None
EndFunction
