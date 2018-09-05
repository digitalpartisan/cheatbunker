Scriptname CheatBunker:PackageDiagnostics extends Chronicle:Package:Handler Conditional

CheatBunker:PackageData Function getData()
	if (isValid())
		return (getPackage().getCustomData() as CheatBunker:PackageData)
	else
		return None
	endif
EndFunction

Chronicle:Package:CustomBehavior:Injections Function getInjections()
	CheatBunker:PackageData packageData = getData()
	if (!packageData)
		return None
	endif
	
	return packageData.getInjections()
EndFunction

Function forceInjections()
	Chronicle:Package:CustomBehavior:Injections injections = getInjections()
	if (injections)
		injections.forceInject()
	endif
EndFunction

FormList Function getImporters()
	CheatBunker:PackageData packageData = getData()
	if (!packageData)
		return None
	endif
		
	return packageData.getImporters()
EndFunction

Formlist Function getAutocompletions()
	CheatBunker:PackageData packageData = getData()
	if (!packageData)
		return None
	endif
		
	return packageData.getAutocompletions()
EndFunction
