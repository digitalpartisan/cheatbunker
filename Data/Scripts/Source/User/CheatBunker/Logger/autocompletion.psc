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

Bool Function processingStageResponse(CheatBunker:AutoCompletion myAutocompleter, Int aiStageID) Global
	return log(myAutocompleter + " processing stage: " + aiStageID)
EndFunction

Bool Function responseSetStage(CheatBunker:AutoCompletion myAutocompleter, Int aiStageID, Int aiSetStageID) Global
	return log(myAutocompleter + " processing stage " + aiStageID + " setting stage " + aiSetStageID)
EndFunction

Bool Function responseCompleteObjective(CheatBunker:AutoCompletion myAutocompleter, Int aiStageID, Int aiObjectiveID) Global
	return log(myAutocompleter + " processing stage " + aiStageID + " completed objective " + aiObjectiveID)
EndFunction

Bool Function responseCustomBehavior(CheatBunker:AutoCompletion myAutocompleter, Int aiStageID, CheatBunker:Autocompletion:StageResponder:CustomResponse aCustomBehavior) Global
	return log(myAutocompleter + " processing stage " + aiStageID + " custom behavior " + aCustomBehavior)
EndFunction

Bool Function responseConclude(CheatBunker:Autocompletion myAutocompleter, Int aiStageID) Global
	return log(myAutocompleter + " processing stage " + aiStageID + " concluding execution")
EndFunction

Bool Function responseHalt(CheatBunker:Autocompletion myAutocompleter, Int aiStageID) Global
	return log(myAutocompleter + " processing stage " + aiStageID + " halting execution")
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

Bool Function logProxyState(CheatBunker:Autocompletion:Proxy myProxy, Bool bCanRun, Bool bRunning, Bool bCanHalt, Bool bFinished) Global
	return log(myProxy + " proxy state can run: " + bCanRun + " running: " + bRunning + " can halt: " + bCanHalt + " finished: " + bFinished)
EndFunction
