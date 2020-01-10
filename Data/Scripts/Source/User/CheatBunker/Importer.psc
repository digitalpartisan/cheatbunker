Scriptname CheatBunker:Importer extends Quest

InjectTec:Plugin Property MyPlugin Auto Const Mandatory
Message Property Details Auto Const Mandatory
Chronicle:Package Property Provider Auto Const Mandatory

String sStateUnrun = "Unrun" Const
String sStateRun = "Run" Const

Function goToUnrun()
	
EndFunction

Function goToRun()

EndFunction

InjectTec:Plugin Function getPlugin()
	return MyPlugin
EndFunction

Bool Function isPluginInstalled()
	if (getPlugin())
		return getPlugin().isInstalled()
	else
		return false
	endif
EndFunction

Bool Function canRun()
	return false
EndFunction

Bool Function shouldBackOut()
	return false
EndFunction

Message Function getDetails()
	return Details
EndFunction

Chronicle:Package Function getProvider()
	return Provider
EndFunction

Bool Function hasRun()
	return false
EndFunction

Function run()
	
EndFunction

Function backOut(Bool bRequired = true)

EndFunction

Bool Function rerun()
	goToUnrun()
	goToRun()
EndFunction

Function backOutBulk(CheatBunker:Importer[] importers, Bool bRequired = true) Global
	if (!importers || !importers.Length)
		return
	endif
	
	Int iCounter = 0
	while (iCounter < importers.Length)
		if (importers[iCounter])
			importers[iCounter].backOut(bRequired)
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function backOutList(FormList importerList) Global
    backOutBulk(Jiffy:Utility:FormList.toArray(importerList) as CheatBunker:Importer[])
EndFunction

Auto State Unrun
	Event OnBeginState(String asOldState)
		
	EndEvent
	
	Event OnQuestInit()
		goToRun()
	EndEvent
	
	Function goToRun()
		GoToState(sStateRun)
	EndFunction
	
	Bool Function canRun()
		return isPluginInstalled()
	EndFunction
	
	Function run()
		Start()
	EndFunction
EndState

State Run
	Event OnBeginState(String asOldState)
		if (shouldBackOut())
			Stop()
			return
		endif
	EndEvent
	
	Event OnQuestShutdown()
		goToUnrun()
	EndEvent
	
	Function goToUnrun()
		GoToState(sStateUnrun)
	EndFunction
	
	Bool Function hasRun()
		return true
	EndFunction
	
	Bool Function shouldBackOut()
		return !isPluginInstalled()
	EndFunction
	
	Function backOut(Bool bRequired = true)
		if (bRequired || shouldBackOut())
			Stop()
		endif
	EndFunction
EndState
