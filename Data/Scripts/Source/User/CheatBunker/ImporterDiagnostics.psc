Scriptname CheatBunker:ImporterDiagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:Importer myImporter = None
Bool bPluginDetected = false Conditional

CheatBunker:Importer Function getImporter()
	return myImporter
EndFunction

Function setImporter(CheatBunker:Importer newImporter)
	myImporter = newImporter
	bPluginDetected = (None != myImporter.Injections && myImporter.Injections.checkPlugin())
EndFunction

Function forceInjections()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		CheatBunker:Logger:Importer.nothingToProxy()
		return
	endif

	thisImporter.Injections.forceInject()
EndFunction

Function backOut()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		CheatBunker:Logger:Importer.nothingToProxy()
		return
	endif

	thisImporter.Injections.revert()
EndFunction

Function tokenReplacementLogic()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		CheatBunker:Logger:Importer.nothingToProxy()
		
		replace("ImporterObject", None)
		replace("ProvidingPackage", None)
		replace("ImporterDescription", None)
	else
		replace("ImporterObject", thisImporter)
		replace("ProvidingPackage", thisImporter.Provider)
		replace("ImporterDescription", thisImporter.Description)
	endif
EndFunction
