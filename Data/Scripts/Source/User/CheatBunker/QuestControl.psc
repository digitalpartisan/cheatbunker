Scriptname CheatBunker:QuestControl extends CheatBunker:QuestControl:DigitalInput:Terminal Conditional

Message Property CheatBunkerQuestControlInvalidQuestIDMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlInvalidStageIDMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStageSetMessage Auto Const Mandatory

CheatBunker:QuestControl:DigitalInput:HexidecimalValue Property QuestID Auto Const Mandatory
CheatBunker:QuestControl:DigitalInput:DecimalValue Property StageID Auto Const Mandatory

Message Property CheatBunkerQuestControlStateCompletedMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateNotRunningMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateRunningMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateStartingMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateStoppedMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateStoppingMessage Auto Const Mandatory

String sStateQuest = "Quest" Const
String sStateStage = "Stage" Const

String sTokenSelectedQuest = "SelectedQuest" Const
String sTokenQuestStatus = "QuestStatus" Const
String sTokenQuestStage = "QuestStage" Const
String sTokenQuestIDPrefix = "QuestID" Const
String sTokenStageIDPrefix = "StageID" Const

Bool bHasQuestID = false Conditional
Bool bHasQuest = false Conditional
Bool bCanStart = false Conditional
Bool bCanStop = false Conditional
Bool bCanComplete = false Conditional
Bool bHasStageID = false Conditional

Quest myQuest = None

String Function getStateAfterPlugin()
	return sStateQuest
EndFunction

Function initializeBehavior()
	bHasQuestID = false
	bHasQuest = false
	bHasStageID = false

	myQuest = None
	
	QuestID.initialize()
	StageID.initialize()
EndFunction

Function loadQuest(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "loadQuest()")
EndFunction

Quest Function getQuest()
	return myQuest
EndFunction

Function setQuest(Quest questRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "setQuest()")
EndFunction

Function startTarget()

EndFunction

Function stopTarget()

EndFunction

Function completeTarget()

EndFunction

Function resetQuestStateLogic()
	bCanStart = false
	bCanStop = false
	bCanComplete = false

	Quest targetQuest = getQuest()
	if (!targetQuest)
		return
	endif
	
	if (targetQuest.IsStarting() || targetQuest.IsRunning())
		bCanStop = true
		bCanComplete = true
	elseif (!targetQuest.IsCompleted())
		bCanStart = true
	endif
	
	replaceQuestData()
EndFunction

Function resetQuestIDLogic()
	bHasQuestID = false
	bHasQuest = false
	resetQuestStateLogic()
	QuestID.initialize()
EndFunction

Function resetStageIDLogic()
	bHasStageID = false
	resetQuestStateLogic()
	StageID.initialize()
EndFunction

Function resetQuestID(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "resetQuestID()")
EndFunction

Function resetStageID(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "resetStageID()")
EndFunction

Function forceStageSetting(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "forceStageSetting()")
EndFunction

Function replaceQuestData()
	Quest targetQuest = getQuest()
	replace(sTokenSelectedQuest, targetQuest)
	
	Message statusMessage = None
	if (targetQuest.IsCompleted())
		statusMessage = CheatBunkerQuestControlStateCompletedMessage
	elseif (targetQuest.IsRunning())
		statusMessage = CheatBunkerQuestControlStateRunningMessage
	elseif (targetQuest.IsStarting())
		statusMessage = CheatBunkerQuestControlStateStartingMessage
	elseif (targetQuest.IsStopped())
		statusMessage = CheatBunkerQuestControlStateStoppedMessage
	elseif (targetQuest.IsStopping())
		statusMessage = CheatBunkerQuestControlStateStoppingMessage
	else
		statusMessage = CheatBunkerQuestControlStateNotRunningMessage
	endif
	
	replace(sTokenQuestStatus, statusMessage)
EndFunction

Function replaceQuestIDTokens()
	replaceDigitalInputTokens(QuestID, sTokenQuestIDPrefix)
EndFunction

Function replaceStageIDTokens()
	replaceDigitalInputTokens(StageID, sTokenStageIDPrefix)
EndFunction

Function tokenReplacementLogic()
	replacePlugin()
	
	if (bHasQuest)
		replaceQuestData()
	endif
	
	replaceQuestIDTokens()
	replaceStageIDTokens()
EndFunction

State Quest
	Event OnBeginState(String asOldState)
		resetQuestIDLogic()
		acceptHexidecimalInput()
	EndEvent
	
	Event OnEndState(String asNewState)
		stopAcceptingHexidecimalInput()
	EndEvent
	
	Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
		QuestID.setNextField(newValue)
		bHasQuestID = QuestID.isFull()
		draw(akTerminalRef)
	EndFunction
	
	Function setQuest(Quest questRef)
		myQuest = questRef
	EndFunction
	
	Function resetQuestID(ObjectReference akTerminalRef)
		resetQuestIDLogic()
		draw(akTerminalRef)
	EndFunction
	
	Function loadQuest(ObjectReference akTerminalRef)
		setQuest(getPlugin().lookupInt(QuestID.getValue()) as Quest)
		
		if (getQuest())
			bHasQuest = true
			progressState()
		else
			CheatBunkerQuestControlInvalidQuestIDMessage.Show()
			resetQuestIDLogic()
		endif
		
		draw(akTerminalRef)
	EndFunction
	
	Function progressState()
		GoToState(sStateStage)
	EndFunction
EndState

State Stage
	Event OnBeginState(String asNewState)
		resetStageIDLogic()
	EndEvent
	
	Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
		StageID.setNextField(newValue)
		bHasStageID = StageID.isFull()
		draw(akTerminalRef)
	EndFunction
	
	Function resetStageID(ObjectReference akTerminalRef)
		resetStageIDLogic()
		draw(akTerminalRef)
	EndFunction
	
	Function startTarget()
		getQuest().Start()
		resetQuestStateLogic()
	EndFunction

	Function stopTarget()
		getQuest().Stop()
		resetQuestStateLogic()
	EndFunction

	Function completeTarget()
		getQuest().CompleteQuest()
		resetQuestStateLogic()
	EndFunction
	
	Function forceStageSetting(ObjectReference akTerminalRef) ; because setStage() was taken, apparently...
		if (getQuest().SetStage(StageID.getValue()))
			CheatBunkerQuestControlStageSetMessage.Show()
		else
			CheatBunkerQuestControlInvalidStageIDMessage.Show()
		endif
		
		resetStageIDLogic()
		draw(akTerminalRef)
	EndFunction
EndState
