Scriptname CheatBunker:Autocompletion:StageResponder extends CheatBunker:Autocompletion

Struct StageResponse
	Int StageID
	{The stage which this StageResponse struct responds to.  Don't duplicate this value in multiple StageResponse values or else only the first will run.}
	Int SetStageID = 0
	{The stage to set when this StageResponse value is utilized.  A zero value results in no call to SetStage().}
	Int CompleteObjectiveID = 0
	{The objective ID to complete when this StageResponse is utilitzed.  A zero value results in no call to SetObjectiveCompleted().}
	CheatBunker:Autocompletion:StageResponder:CustomResponse CustomResponseBehavior = None
	{A scripted response to be run when this StageResponse is utilized should the stage and objective options be insufficient to cause the desired outcome.
	Note that it is possible to program your custom processStageResponse() function to handle relatively simple tasks.
	This feature is intended to support incredibly complicated side tasks and the like.}
	Bool ConcludeExecution = false
	{If true, this StageResponse value will, when utilized, call conclude() on the autocompletion option.}
	Bool HaltExecution = false
	{If true, this StageResponse value will call halt() on the autocompletion option.}
EndStruct

StageResponse[] Property ResponseSet Auto Const Mandatory
{The set of StageResponse values to use with this autocompletion option to react to each stage of the target quest as it is encountered.}

Int Function getStageResponseIndex(Int aiStageID)
	return ResponseSet.FindStruct("StageID", aiStageID)
EndFunction

Bool Function hasResponse(Int aiStageID)
	return (-1 < getStageResponseIndex(aiStageID))
EndFunction

StageResponse Function getStageResponse(Int aiStageID)
	Int iIndex = getStageResponseIndex(aiStageID)
	if (-1 < iIndex)
		return ResponseSet[iIndex]
	endif
	
	return None
EndFunction

StageResponse Function getCurrentStageResponse()
	return getStageResponse(getQuest().GetStage())
EndFunction

Function processStageResponse(StageResponse myResponse)
	Utility.Wait(1) ; a filthy hack, but testing has demonstrated odd race conditions and timing problems that this solves nicely even if it causes the player to hang at the terminal
	
	Quest targetQuest = getQuest()
	if (!targetQuest || !myResponse)
		return
	endif

	if (myResponse.CustomResponseBehavior)
		CheatBunker:Logger:Autocompletion.responseCustomBehavior(self, myResponse.StageID, myResponse.CustomResponseBehavior)
		myResponse.CustomResponseBehavior.respond(targetQuest)
	endif
	
	if (0 != myResponse.CompleteObjectiveID)
		CheatBunker:LOgger:Autocompletion.responseCompleteObjective(self, myResponse.StageID, myResponse.CompleteObjectiveID)
		targetQuest.SetObjectiveCompleted(myResponse.CompleteObjectiveID)
	endif
	
	if (0 != myResponse.SetStageID)
		CheatBunker:Logger:Autocompletion.responseSetStage(self, myResponse.StageID, myResponse.SetStageID)
		targetQuest.SetStage(myResponse.SetStageID)
	endif
	
	if (myResponse.HaltExecution) ; halt comes before conclude because it is a less common and more specific thing to do, so it should take priority so that the autocompleter ends up in a state where conclude() does nothing
		CheatBunker:Logger:Autocompletion.responseHalt(self, myResponse.StageID)
		halt()
	endif
	
	if (myResponse.ConcludeExecution)
		CheatBunker:Logger:Autocompletion.responseConclude(self, myResponse.StageID)
		conclude()
	endif
EndFunction

Function processStage(Int aiStageID)
	processStageResponse(getStageResponse(aiStageID))
EndFunction	

Function processCurrentStage()
	processStageResponse(getCurrentStageResponse())
EndFunction

Function executionStageHandler(Int aiStageID)
	processStage(aiStageID)
EndFunction

Function executeBehavior()
	processCurrentStage()
EndFunction

