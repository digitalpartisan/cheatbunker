Scriptname CheatBunker:PackageCustomizations extends Chronicle:Package:CustomBehavior

Group PackageFeatureSettings
	InjectTec:Injector:Bulk Property Injections  Auto Const
	{Injections required to make the CheatBunker and it's optional packages work as expected}
	FormList Property Importers Auto Const
	{These need to be treated as individual items unlike injections, so they're not bundled in a convenient object}
	FormList Property Autocompletions Auto Const
	{These aren't injections as such because they actually have event listeners that need to be manually started and stopped if they're running and a package is uninstalled.}
EndGroup

Group AccessSettings
	ObjectReference Property ExteriorDoor Auto Const
	ObjectReference Property InteriorDoor Auto Const
EndGroup

Function handleImporters(Bool bRun = true)
	if (Importers == None)
		return
	endif

	Int iCounter = 0
	Int iSize = Importers.GetSize()
	CheatBunker:Importer targetImporter = None
	While (iCounter < iSize)
		targetImporter = Importers.GetAt(iCounter) as CheatBunker:Importer
		if (bRun)
			targetImporter.Injections.inject()
		else
			targetImporter.Injections.revert()
		endif
		iCounter += 1
	EndWhile
EndFunction

Function runImporters()
	handleImporters()
EndFunction

Function revertImporters()
	handleImporters(false)
EndFunction

Function handleAutocompletions(Bool bInitialize = true)
	if (Autocompletions == None)
		return
	endif
	
	Int iCounter = 0
	Int iSize = Autocompletions.GetSize()
	CheatBunker:Autocompletion targetAutocompletion = None
	While (iCounter < iSize)
		targetAutocompletion = Autocompletions.GetAt(iCounter) as CheatBunker:Autocompletion
		if (bInitialize)
			targetAutocompletion.initialize()
		else
			targetAutocompletion.terminate()
		endif
		iCounter += 1
	EndWhile
EndFunction

Function initializeAutocompletions()
	handleAutocompletions()
EndFunction

Function terminateAutocompletions()
	handleAutocompletions(false)
EndFunction

Bool Function installBehavior()
	Injections.inject()
	runImporters()
	initializeAutocompletions()
	
	return true
EndFunction

Bool Function postloadBehavior()
	runImporters() ; soft behavior, already-run importers won't rerun their injections thanks to Inject-Tec
	initializeAutocompletions() ; soft behavior, already-initialized autocompletions won't be re-initialized
	
	return true
EndFunction

Function disableDoors()
	if (ExteriorDoor)
		ExteriorDoor.disable()
	endif
	
	if (InteriorDoor)
		InteriorDoor.disable()
	endif
EndFunction

Bool Function uninstallBehavior()
	disableDoors()

	Injections.revert()
	revertImporters()
	terminateAutocompletions()
	
	return true
EndFunction
