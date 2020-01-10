Scriptname CheatBunker:Importer:Diagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:Importer myImporter = None
Bool bIsValid = false Conditional
Bool bPluginsDetected = false Conditional
Bool bHasRun = false Conditional
Bool bCanRun = false Conditional

Bool Function isValid()
	return bIsValid
EndFunction

CheatBunker:Importer Function getImporter()
	return myImporter
EndFunction

Function setImporter(CheatBunker:Importer newImporter)
	bIsValid = false
	bPluginsDetected = false
	bHasRun = false
	bCanRun = false

	myImporter = newImporter
	bIsValid = (None != myImporter)
EndFunction

Function stateCheck()
    if (!isValid())
        return
    endif

    CheatBunker:Importer importer = getImporter()

    bPluginsDetected = myImporter.isPluginInstalled()
    bHasRun = myImporter.hasRun()
    bCanRun = MyImporter.canRun()
EndFunction

Function run(ObjectReference akTerminalRef)
    if (isValid())
        getImporter().run()
        draw(akTerminalRef)
        return
    endif

    CheatBunker:Logger:Importer.nothingToProxy()
EndFunction

Function backOut(ObjectReference akTerminalRef)
	if (isValid())
		getImporter().backOut()
		draw(akTerminalRef)
		return
	endif

    CheatBunker:Logger:Importer.nothingToProxy()
EndFunction

Function rerun(ObjectReference akTerminalRef)
    if (isValid())
        getImporter().rerun()
        draw(akTerminalRef)
    endif
EndFunction

Function tokenReplacementLogic()
    stateCheck()

	if (isValid())
        CheatBunker:Importer thisImporter = getImporter()
        replace("ImporterObject", thisImporter)
        replace("ImporterDetails", thisImporter.getDetails())
	else
        CheatBunker:Logger:Importer.nothingToProxy()
		replace("ImporterObject", None)
		replace("ImporterDetails", None)
	endif
EndFunction
