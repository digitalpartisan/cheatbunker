Scriptname CheatBunker:PackageCustomizations extends Chronicle:Package:CustomBehavior

Group PackageFeatureSettings
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

Function disableDoors()
	if (ExteriorDoor)
		ExteriorDoor.disable()
	endif
	
	if (InteriorDoor)
		InteriorDoor.disable()
	endif
EndFunction

Bool Function installBehavior()
	handleImporters()
	handleAutocompletions()
	
	return true
EndFunction

Bool Function postloadBehavior()
	handleImporters() ; soft behavior, already-run importers won't rerun their injections thanks to Inject-Tec
	handleAutocompletions() ; soft behavior, already-initialized autocompletions won't be re-initialized
	
	return true
EndFunction

Bool Function uninstallBehavior()
	disableDoors()

	handleImporters(false)
	handleAutocompletions(false)
	
	return true
EndFunction
