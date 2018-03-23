Scriptname CheatBunker:Logger:Autocompletion Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[1]
	tags[0] = "Autocompletion"
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return Loggout.log(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return Loggout.warn(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return Loggout.error(CheatBunker:Logger.getName(), sMessage, getTags())
EndFunction

Bool Function running(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " running")
EndFunction

Bool Function listening(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " listening")
EndFunction

Bool Function notListening(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " not listening")
EndFunction

Bool Function halting(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " halting")
EndFunction

Bool Function finished(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " finished")
EndFunction

Bool Function available(CheatBunker:Autocompletion myAutoCompleter) Global
	return log(myAutoCompleter + " available")
EndFunction

Bool Function stateCheck(CheatBunker:Autocompletion myAutocompleter) Global
	return log(myAutocompleter + " forced state check: " + myAutocompleter.GetState())
EndFunction

Bool Function enteringState(CheatBunker:Autocompletion myAutocompleter, String asStateName, String asOldState) Global
	String sOldState = asOldState
	if ("" == sOldState)
		sOldState = "Empty"
	endif
	
	return log(myAutocompleter + " entering state: " + asStateName + " leaving: " + sOldState + " GetState(): " + myAutocompleter.GetState())
EndFunction

Bool Function leavingState(CheatBunker:Autocompletion myAutocompleter, String asStateName, String asNewState) Global
	String sNewState = asNewState
	if ("" == sNewState)
		sNewState = "Empty"
	endif
	
	return log(myAutocompleter + " leaving state: " + asStateName + " entering: " + sNewState + " GetState(): " + myAutocompleter.GetState())
EndFunction

Bool Function stageEvent(CheatBunker:Autocompletion myAutocompleter, Int aiStageID) Global
	return log(myAutocompleter + " received stage event: " + aiStageID)
EndFunction

Bool Function foundTriggerStage(CheatBunker:Autocompletion myAutocompleter, Int aiStageID) Global
	return log(myAutocompleter + " acknowledges trigger stage: " + aiStageID)
EndFunction

Bool Function retrofittingPackage(CheatBunker:Package targetPackage) Global
	return log("Retrofitting package: " + targetPackage)
EndFunction

Bool Function retrofittingOption(CheatBunker:Autocompletion targetAutocompletion) Global
	return log("Retrofitting " + targetAutocompletion + " with state: " + targetAutocompletion.GetState())
EndFunction

Bool Function nothingToProxy() Global
	return error("proxy script has not set an autocompleter")
EndFunction
