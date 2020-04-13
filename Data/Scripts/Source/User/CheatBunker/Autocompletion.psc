Scriptname CheatBunker:Autocompletion extends Quest
{Base Quest Autocompletion logic.  If you intend to allow a script to halt, do not check the "Run Once" box on the quest data tab.}

Import InjectTec:Utility:HexidecimalLogic

Group TargetQuestSettings
	Quest Property MyQuest Auto Const
	{The quest to watch.  Note that it is technically valid to have no quest if the purpose of the autocompleter}
	InjectTec:Plugin Property QuestPlugin Auto Const
	{The plugin containing the quest record with the form ID specific in the QuestDigits property.}
	DigitSet Property QuestDigits Auto Const
	{The preferred method of identifying a quest record from a remote plugin.}
EndGroup

Group AvailabilitySettings
	Int[] Property TriggerStages Auto Const
	{The states (if any) which will indicate that the quest is ready for this autocompletion object to operate.
	Multiple values are allowed here because, in theory, an autocompletion option can be halted partway through and it may be desirable to start it up at a later point.}
	Int[] Property AccessibleObjectives Auto Const
	{The objectives (if any) which will indicate that this autocompletion object can be put into operation should they be displayed.
	Helpful for establishing that it's not too early or late in the target quest to autocomplete it.}
EndGroup

Group Messaging
	Message Property AvailabilityMessage Auto Const Mandatory
	Message Property Description Auto Const Mandatory
	Message Property FinishedMessage Auto Const Mandatory
	Message Property HaltMessage Auto Const
	Message Property RunConditions Auto Const Mandatory
	Message Property RunningMessage Auto Const Mandatory
	Message Property SpecialInstructions Auto Const
EndGroup

Int[] Property StagesToComplete Auto Const
{All stage IDs that must be "done" to avoid side effects from the target quest being "not quite" done such as dialogue from the target quest still running because its conditions say it should.
These stages are checked and, if necessary, set after the setstage() event listener is deactivated prior to the autocompletion option finishing its work.
Any work to do on a specific stage or other event should be taken care of elsewhere because this is a fallback mechanism to tie up loose ends that only require a call to setStage() and no other work.}
Chronicle:Package Property MyPackage Auto Const Mandatory
Bool Property NeverAutofire = false Auto Const

String sStateEmpty = "" Const
String sStatePreinitialized = "Preinitialized" Const
String sStateInitialized = "Initialized" Const
String sStateExecuting = "Executing" Const
String sStateConcluded = "Concluded" Const
String sStateTerminated = "Terminated" Const

Group HaltOptions
	Bool Property CanHalt = false Auto Const
	Bool Property UserCanHalt = false Auto Const
EndGroup

Bool bRunning = false ; artifact from prior version of the autocompletion logic.  Retained to track state of existing autocompletion instances.
Bool bFinished = false  ; artifact from prior version of the autocompletion logic.  Retained to track state of existing autocompletion instances.
Bool bAnnounced = false

Chronicle:Package Function getPackage()
	return MyPackage
EndFunction

Bool Function mayAutofire()
	return !NeverAutofire && CheatBunker:Autocompletion:AutofireSetting.isSetForPackage(getPackage())
EndFunction

Bool Function canUserHalt()
	return UserCanHalt
EndFunction

Bool Function isValid()
{It is theoretically valid to have no quest object.  If a set quest is in another plugin, though, that plugin must be installed for the autocompletion option to display in the terminal.}
	return MyQuest || (!QuestPlugin || getQuest())
EndFunction

Quest Function getQuest()
	return InjectTec:Utility:Form.load(MyQuest, QuestPlugin, 0, QuestDigits) as Quest
EndFunction

Jiffy:Vault111ExitDetector Function getVault111ExitDetector()
	return CheatBunker:Dependencies:General.getInstance().getVault111ExitDetector()
EndFunction

Bool Function playerLeftVault()
	return getVault111ExitDetector().IsStopped()
EndFunction

Bool Function detectTriggerStage(Int aiStageID)
	return -1 < TriggerStages.Find(aiStageID) ; true if the aiStageID is in the TriggerStates array and false otherwise
EndFunction

Bool Function isStageReady()
	Quest targetQuest = getQuest()
	return (targetQuest && TriggerStages && TriggerStages.Length && detectTriggerStage(targetQuest.GetStage())) ; this method will only allow the autocompletion to run if a quest is specified and its current stage is in the allowed Trigger Stages
EndFunction

Bool Function detectAccessibleObjective()
	Quest targetQuest = getQuest()
	if (!targetQuest || 0 == AccessibleObjectives.Length)
		return false ; this logic has been adjusted in favor of refusing the autocompletion option to run unless a quest is specified and has an appropriate objective displayed to tighten down false ready notifications
	endif
	
	Int iCounter = 0
	Int iObjectiveID = 0
	while (iCounter < AccessibleObjectives.Length)
		iObjectiveID = AccessibleObjectives[iCounter]
		if (targetQuest.IsObjectiveDisplayed(iObjectiveID))
			return true
		endif
		iCounter += 1
	endWhile
	
	return false
EndFunction

Bool Function isQuestReady()
	Quest targetQuest = getQuest()
	if (!targetQuest)
		CheatBunker:Logger:Autocompletion.logReadyByDefault(self)
		return true ; no quest means this is a special sort of auto-completion that is a one-off settings change or toggle flip, so don't run the rest of the logic
	endif
	
	Bool bIsTargetQuestRunning = isTargetQuestRunning()
	Bool bIsStageReady = isStageReady()
	Bool bDetectAccessibleObjective = detectAccessibleObjective()
	Bool bResult = bIsTargetQuestRunning && ( bIsStageReady || bDetectAccessibleObjective )
	
	CheatBunker:Logger:Autocompletion.logIsQuestReady(self, bResult, bIsTargetQuestRunning, bIsStageReady, bDetectAccessibleObjective)
	
	return bResult
EndFunction

Function listenToQuest()
	Quest targetQuest = getQuest()
	if (targetQuest)
		CheatBunker:Logger:Autocompletion.listening(self)
		RegisterForRemoteEvent(targetQuest, "OnStageSet")
	endif
EndFunction

Function stopListeningToQuest()
	Quest targetQuest = getQuest()
	if (targetQuest)
		CheatBunker:Logger:Autocompletion.notListening(self)
		UnregisterForRemoteEvent(targetQuest, "OnStageSet")
	endif
EndFunction

Function listenForVaultExit()
	CheatBunker:Logger:Autocompletion.logListeningForVaultExit(self)
	RegisterForRemoteEvent(getVault111ExitDetector(), "OnQuestShutdown")
EndFunction

Function stopListeningForVaultExit()
	CheatBunker:Logger:Autocompletion.logStopListeningForVaultExit(self)
	UnregisterForRemoteEvent(getVault111ExitDetector(), "OnQuestShutdown")
EndFunction

Function handleStageEvent(Int aiStageID)
	
EndFunction

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	if (getQuest() == akSender)
		CheatBunker:Logger:Autocompletion.stageEvent(self, auiStageID)
		handleStageEvent(auiStageID)
	endif
EndEvent

Event Quest.OnQuestShutdown(Quest akSender)
	if (getVault111ExitDetector() == akSender)
		stopListeningForVaultExit()
		availabilityCheck()
	endif
EndEvent

Bool Function isExecutingOrConcluded()
	Bool bResult = isExecuting() || isConcluded()
	
	return bResult
EndFunction

Bool Function isTargetQuestRunning()
	Quest targetQuest = getQuest()
	return targetQuest && (targetQuest.IsStarting() || targetQuest.IsRunning())
EndFunction

Bool Function canExecuteLogic()
{Override this to suite your specific case.
This is left in the empty state precisely because it may need to be customized to a specific purpose that this general logic cannot address.
Default logic: if the autocompleter is operating or finished, false.  If there is a target quest, it must be running and have an accessible objective displayed.  True in all other cases.}
	Bool bPlayerLeftVault = playerLeftVault()
	Bool bIsExecutingOrConcluded = isExecutingOrConcluded()
	Bool bIsQuestReady = isQuestReady()
	Bool bResult = bPlayerLeftVault && !bIsExecutingOrConcluded && bIsQuestReady
	
	CheatBunker:Logger:Autocompletion.logCanExecuteLogic(self, bResult, bPlayerLeftVault, bIsExecutingOrConcluded, bIsQuestReady)
	
	return bResult
EndFunction

Bool Function canExecute()
	return false
EndFunction

Bool Function isExecuting()
	return false
EndFunction

Function executeBehavior()
{Override this with logic specific to your situation.}
EndFunction

Function executionStageHandler(Int aiStageID)
{Override this with your own behavior.}
EndFunction

Function availabilityCheck()
	if (!canExecute())
		return
	endif

	if (mayAutofire())
		execute()
	else
		if (!bAnnounced)
			bAnnounced = true
			CheatBunker:Logger:Autocompletion.available(self)
			AvailabilityMessage.Show()
		endif
	endif
EndFunction

Bool Function canHalt()
	return false
EndFunction

Function haltBehavior()
{Override this with your own behavior should you need to.}
EndFunction

Function halt()
	
EndFunction

Function completeStages()
	Quest targetQuest = getQuest()
	if (!targetQuest)
		return
	endif
	
	Int iCounter = 0
	Int iStage = 0
	while (iCounter < StagesToComplete.Length)
		iStage = StagesToComplete[iCounter]
		if (!targetQuest.IsStageDone(iStage) && iStage != targetQuest.GetCurrentStageID())
			targetQuest.SetStage(iStage)
		endif
		iCounter += 1
	endWhile
EndFunction

Function concludeBehavior()
{Override this with your own behavior should you need to.}
EndFunction

Function initialize()
	
EndFunction

Function terminate()
	GoToState(sStateTerminated)
EndFunction

Function execute()

EndFunction

Function conclude()
	
EndFunction

Bool Function isConcluded()
	return false
EndFunction

Auto State Preinitialized
	Event OnBeginState(String asOldState)
		CheatBunker:Logger:Autocompletion.enteringState(self, sStatePreinitialized, asOldState)
	EndEvent

	Function initialize()
		if (isValid())
			GoToState(sStateInitialized)
		endif
	EndFunction
	
	Function listenToQuest()
		; has no meaning in a preinitialized state
	EndFunction

	Function stopListeningToQuest()
		; has no meaning in a preinitialized state
	EndFunction
	
	Function terminate()
		; has no meaning in a preinitialized state
	EndFunction
EndState

State Initialized
	Event OnBeginState(String asOldState)
		CheatBunker:Logger:Autocompletion.enteringState(self, sStateInitialized, asOldState)
		
		if (sStateExecuting == asOldState) ; halt detected, behave accordingly
			haltBehavior()
			HaltMessage.Show()
			bAnnounced = false
		else ; first time we're coming in here
			listenToQuest()
			
			if (!playerLeftVault())
				listenForVaultExit()
			endif
			
			availabilityCheck()
		endif
	EndEvent
	
	Function handleStageEvent(Int aiStageID)
		if (detectTriggerStage(aiStageID))
			Utility.Wait(1) ; Timing to make sure the appropriate objective is displayed for the canExecute() check to succeed
			availabilityCheck()
		endif
	EndFunction
	
	Bool Function canExecute()
		return canExecuteLogic()
	EndFunction
	
	Function execute()
		if (canExecute())
			GoToState(sStateExecuting)
		endif
	EndFunction
EndState

State Executing
	Event OnBeginState(String asOldState)
		CheatBunker:Logger:Autocompletion.enteringState(self, sStateExecuting, asOldState)
		
		if (sStateEmpty == asOldState)
			listenToQuest() ; Because previous iterations of this script weren't listening in a run state
		else
			CheatBunker:Logger:Autocompletion.running(self)
			bRunning = true ; necessary evil, see comment on variable declaration
			
			RunningMessage.Show()
			if (SpecialInstructions)
				SpecialInstructions.Show()
			endif
			
			Utility.Wait(1) ; filthy hack meant to force the player out of the terminal so any quest events or UI events aren't happening on top of said terminal controls
			
			executeBehavior()
		endif
	EndEvent
	
	Event OnEndState(string asNewState)
		bRunning = false
	EndEvent
	
	Function handleStageEvent(Int aiStageID)
		executionStageHandler(aiStageID)
	EndFunction
	
	Bool Function canHalt()
		return CanHalt
	EndFunction
	
	Function halt()
		if (canHalt())
			CheatBunker:Logger:Autocompletion.halting(self)
			GoToState(sStateInitialized)
		endif
	EndFunction
	
	Function conclude()
		GoToState(sStateConcluded)
	EndFunction
	
	Bool Function isExecuting()
		return true
	EndFunction
EndState

State Concluded
	Event OnBeginState(String asOldState)
		CheatBunker:Logger:Autocompletion.enteringState(self, sStateConcluded, asOldState)
		
		if (sStateEmpty != asOldState)
			CheatBunker:Logger:Autocompletion.finished(self)
			
			concludeBehavior()
			stopListeningToQuest()
			completeStages()
			
			bFinished = true ; necessary evil, see note on the variable declaration
			
			FinishedMessage.Show()
		endif
	EndEvent
	
	Bool Function isConcluded()
		return true
	EndFunction
EndState

State Terminated
	Event OnBeginState(String asOldState)
		CheatBunker:Logger:Autocompletion.enteringState(self, sStateTerminated, asOldState)
		stopListeningToQuest()
		Stop()
	EndEvent
	
	Function terminate()
	
	EndFunction
EndState

Function retrofitState()
	CheatBunker:Logger:Autocompletion.retrofittingOption(self)

	if (getState() != sStateEmpty)
		return
	endif
	
	if (bFinished)
		GoToState(sStateConcluded)
	elseif (bRunning)
		GoToState(sStateExecuting)
	elseif (isValid())
		GoToState(sStateInitialized)
	else
		GoToState(sStatePreinitialized)
	endif
EndFunction

Function retrofitPackage(Chronicle:Package packageRef) Global
	CheatBunker:Logger:Autocompletion.retrofittingPackage(packageRef)
	
	CheatBunker:Autocompletion:PackageBehavior autocompletionBehavior = CheatBunker:Dependencies:General.getInstance().getAutocompletionSearcher().searchOneAutocompletion(packageRef)
	if (!autocompletionBehavior)
		return
	endif
	FormList packageAutocompletions = autocompletionBehavior.getAutocompletions()
	if (!packageAutocompletions)
		return
	endif
	
	Int iCounter = 0
	Int iSize = packageAutocompletions.GetSize()
	while (iCounter < iSize)
		(packageAutocompletions.GetAt(iCounter) as CheatBunker:Autocompletion).retrofitState()
		iCounter += 1
	endWhile
EndFunction

Function initializeList(FormList autocompletions) Global
	if (!autocompletions || !autocompletions.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = autocompletions.GetSize()
	CheatBunker:Autocompletion target = None
	
	while (iCounter < iSize)
		target = autocompletions.GetAt(iCounter) as CheatBunker:Autocompletion
		if (target)
			target.initialize()
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function terminateList(FormList autocompletions) Global
	if (!autocompletions || !autocompletions.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = autocompletions.GetSize()
	CheatBunker:Autocompletion target = None
	
	while (iCounter < iSize)
		target = autocompletions.GetAt(iCounter) as CheatBunker:Autocompletion
		if (target)
			target.terminate()
		endif
		
		iCounter += 1
	endWhile
EndFunction
