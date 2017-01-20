Scriptname CheatBunker:ImporterDiagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const

CheatBunker:Importer myImporter = None

CheatBunker:Importer Function getImporter()
	return myImporter
EndFunction

Function setImporter(CheatBunker:Importer newImporter)
	myImporter = newImporter
EndFunction

Function logNoImporter(String sTask)
	Debug.TraceStack("[CheatBunker][Importer][Diagnostics] no importer specified, cannot " + sTask)
EndFunction

Function logAction(String sAction)
	Debug.Trace("[CheatBunker][Importer][Diagnostics] " + sAction + ": " + getImporter())
EndFunction

Function rerunInjections()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		logNoImporter("rerun injections")
	endif

	logAction("rerunning injections")
	thisImporter.Injections.inject()
EndFunction

Function forceInjections()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		logNoImporter("force injections")
	endif

	logAction("force injections")
	thisImporter.Injections.forceInject()
EndFunction

Function backOut()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		logNoImporter("unimport")
	endif

	logAction("unimport")
	thisImporter.Injections.revert()
EndFunction

Function tokenReplacementLogic()
	CheatBunker:Importer thisImporter = getImporter()
	if (thisImporter == None)
		logNoImporter("token replacement")
		return
	endif

	replace("ImporterObject", thisImporter)
	replace("ProvidingPackage", thisImporter.Provider)
	replace("ImporterDescription", thisImporter.Description)
EndFunction
