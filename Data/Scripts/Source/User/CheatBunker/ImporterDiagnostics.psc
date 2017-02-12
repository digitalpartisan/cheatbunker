Scriptname CheatBunker:ImporterDiagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const

CheatBunker:Importer myImporter = None

CheatBunker:Importer Function getImporter()
	return myImporter
EndFunction

Function setImporter(CheatBunker:Importer newImporter)
	myImporter = newImporter
EndFunction

Function rerunInjections()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		CheatBunker:Logger:Importer.nothingToProxy()
		return
	endif

	thisImporter.Injections.inject()
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
