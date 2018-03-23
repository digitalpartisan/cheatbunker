Scriptname CheatBunker:Autocompletion extends Quest
{Base Quest Autocompletion logic.  If you intend to allow a script to halt, do not check the "Run Once" box on the quest data tab.}

Group TargetQuestSettings
	Bool Property LocalQuest = true Auto Const
	{Leave true if the MyQuest property can be immediately set in the editor and set to false if it must be loaded at runtime from a third-party plugin.  See QuestPlugin and QuestID properties.
	Setting this value to false without providing valid settings in the QuestPlugin and QuestID properties will cause the autocompletion option to be considered invalid.
	An invalid setting is one where either the QuestPlugin isn't installed or the record with QuestID does not exist in QuestPlugin.}
	Quest Property MyQuest Auto Const
	{The quest to watch.  Note that it is technically valid to have no quest if the purpose of the autocompleter}
	InjectTec:Plugin Property QuestPlugin Auto Const
	{The plugin containing the quest record with the form ID specific in the QuestID property.}
	Int Property QuestID Auto Const
	{The form ID of the quest record to load from QuestPlugin at runtime.}
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
	Message Property RunConditions Auto Const Mandatory
	Message Property RunningMessage Auto Const Mandatory
	Message Property FinishedMessage Auto Const Mandatory
	Message Property HaltMessage Auto Const
	Message Property Description Auto Const Mandatory
	Message Property SpecialInstructions Auto Const
	Message Property AvailabilityMessage Auto Const
EndGroup

Int[] Property StagesToComplete Auto Const
{All stage IDs that must be "done" to avoid side effects from the target quest being "not quite" done such as dialogue from the target quest still running because its conditions say it should.
These stages are checked and, if necessary, set after the setstage() event listener is deactivated prior to the autocompletion option finishing its work.
Any work to do on a specific stage or other event should be taken care of elsewhere because this is a fallback mechanism to tie up loose ends that only require a call to setStage() and no other work.}

String sStateEmpty = "" Const
String sStatePreinitialized = "Preinitialized" Const
String sStateInitialized = "Initialized" Const
String sStateExecuting = "Executing" Const
String sStateConcluded = "Concluded" Const
String sStateTerminated = "Terminated" Const

Bool Property CanHalt = false Auto Const

Bool bRunning = false ; artifact from prior version of the autocompletion logic.  Retained to track state of existing autocompletion instances.
Bool bFinished = false  ; artifact from prior version of the autocompletion logic.  Retained to track state of existing autocompletion instances.

Bool Function isValid()
{It is theoretically valid to have no quest object, but if }
	if (LocalQuest)
		return true ; 
	elseif (!QuestPlugin.isInstalled())
		return false ; plugin is not installed
	elseif ( !(QuestPlugin.lookupForm(QuestID) as Quest) )
		return false
	endif
	
	return true ; the third-party plugin is installed and the quest record specified can be loaded
EndFunction

Quest Function getQuest()
	if (LocalQuest)
		return MyQuest
	elseif (QuestPlugin && QuestID)
		return QuestPlugin.lookupForm(QuestID) as Quest
	endif
	
	return None
EndFunction

Bool Function detectTriggerStage(Int aiStageID)
	return -1 < TriggerStages.Find(aiStageID) ; true if the aiStageID is in the TriggerStates array and false otherwise
EndFunction

Bool Function detectAccessibleObjective()
	Quest targetQuest = getQuest()
	if (!targetQuest)
		return true ; since there's nothing specific that stops the autocompletion option from running
	endif
	
	if (0 == AccessibleObjectives.Length)
		return true ; because there's no cause to invalidate the autocompletion option, if no objective is accessible, then they all are.
	endif
	
	Int iCounter = 0
	while (iCounter < AccessibleObjectives.Length)
		if (targetQuest.IsObjectiveDisplayed(AccessibleObjectives[iCounter]))
			return true ; the quest's current objective is one we're allowed to run
		endif
		iCounter += 1
	endWhile
	
	return false
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
		UnregisterForRemoteEvent(getQuest(), "OnStageSet")
	endif
EndFunction

Function handleStageEvent(Int aiStageID)
	; TODO: error log about how this shouldn't be able to happen in the default state
EndFunction

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	if (getQuest() == akSender)
		CheatBunker:Logger:Autocompletion.stageEvent(self, auiStageID)
		handleStageEvent(auiStageID)
	endif
EndEvent

Bool Function canExecuteLogic()
{Override this to suite your specific case.
This is left in the empty state precisely because it may need to be customized to a specific purpose that this general logic cannot address.
Default logic: if the autocompleter is operating or finished, false.  If there is a target quest, it must be running and have an accessible objective displayed.  True in all other cases.}
	if (isExecuting() || isConcluded())
		return false ; don't allow such a thing to happen
	endif
	
	Quest targetQuest = getQuest()
	if (targetQuest)
		return targetQuest.IsRunning() && detectAccessibleObjective()
	endif
	
	return true
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
		else
			listenToQuest() ; first-time initializations, even if non-organic (i.e. coming from Empty state) need to listen for quest events
			
			if (canExecute()) ; If the autocompletion option can run immediately, show the messages since the listener is not likely to "hear" the trigger stage(s)
				AvailabilityMessage.Show()
			endif
		endif
	EndEvent
	
	Function handleStageEvent(Int aiStageID)
		if (detectTriggerStage(aiStageID))
			CheatBunker:Logger:Autocompletion.foundTriggerStage(self, aiStageID)
			AvailabilityMessage.Show()
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
		if (!canHalt())
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

Function retrofitPackage(CheatBunker:Package targetPackage) Global
	CheatBunker:Logger:Autocompletion.retrofittingPackage(targetPackage)
	FormList packageAutocompletions = targetPackage.Autocompletions
	Int iCounter = 0
	Int iSize = packageAutocompletions.GetSize()
	
	while (iCounter < iSize)
		(packageAutocompletions.GetAt(iCounter) as CheatBunker:Autocompletion).retrofitState()
		iCounter += 1
	endWhile
EndFunction
