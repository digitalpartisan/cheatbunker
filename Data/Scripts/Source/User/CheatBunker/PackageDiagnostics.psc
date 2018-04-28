Scriptname CheatBunker:PackageDiagnostics extends Chronicle:Package:Handler Conditional

CheatBunker:PackageCustomizations Function getCustomizations()
	if (isValid())
		return (getPackage().getCustomizations() as CheatBunker:PackageCustomizations)
	else
		return None
	endif
EndFunction

InjectTec:Injector:Bulk Function getInjections()
	CheatBunker:PackageCustomizations customizations = getCustomizations()
	if (customizations)
		return customizations.Injections
	else
		return None
	endif
EndFunction

Function forceInjections()
	InjectTec:Injector:Bulk injections = getInjections()
	if (injections)
		injections.forceInject()
	endif
EndFunction

FormList Function getImporters()
	CheatBunker:PackageCustomizations customizations = getCustomizations()
	if (customizations)
		return customizations.Importers
	else
		None
	endif
EndFunction

Formlist Function getAutocompletions()
	CheatBunker:PackageCustomizations customizations = getCustomizations()
	if (customizations)
		return customizations.Autocompletions
	else
		None
	endif
EndFunction
