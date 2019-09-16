Scriptname CheatBunker:ImporterDiagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:Importer myImporter = None
Bool bIsValid = false Conditional
Bool bPluginsDetected = false Conditional

Bool Function isValid()
	return bIsValid
EndFunction

CheatBunker:Importer Function getImporter()
	return myImporter
EndFunction

Function setImporter(CheatBunker:Importer newImporter)
	bIsValid = false
	bPluginsDetected = false

	myImporter = newImporter
	bIsValid = (None != getImporter())
	
	if (isValid())
		bPluginsDetected = getImporter().Injections.checkPlugins()
	endif
EndFunction

Function forceInjections()
	if (!isValid())
		CheatBunker:Logger:Importer.nothingToProxy()
		return
	endif

	getImporter().Injections.forceInject()
EndFunction

Function backOut()
	if (!isValid())
		CheatBunker:Logger:Importer.nothingToProxy()
		return
	endif

	getImporter().Injections.revert()
EndFunction

Function tokenReplacementLogic()
	if (!isValid())
		CheatBunker:Logger:Importer.nothingToProxy()
		
		replace("ImporterObject", None)
		replace("ProvidingPackage", None)
		replace("ImporterDescription", None)
		
		return
	endif
	
	CheatBunker:Importer thisImporter = getImporter()
	
	replace("ImporterObject", thisImporter)
	replace("ProvidingPackage", thisImporter.getProvider())
	replace("ImporterDescription", thisImporter.getDescriptionMessage())
EndFunction
