Scriptname CheatBunker:QuestControl extends DynamicTerminal:Basic Conditional

Message Property CheatBunkerQuestControlInvalidQuestIDMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlInvalidStageIDMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStageSetMessage Auto Const Mandatory

Message Property CheatBunkerQuestControlDefaultDigit Auto Const Mandatory

CheatBunker:QuestControl:DigitalInput:QuestID Property QuestID Auto Const Mandatory
CheatBunker:QuestControl:DigitalInput:StageID Property StageID Auto Const Mandatory

Message Property CheatBunkerQuestControlStateCompletedMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateNotRunningMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateRunningMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateStartingMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateStoppedMessage Auto Const Mandatory
Message Property CheatBunkerQuestControlStateStoppingMessage Auto Const Mandatory

String sStatePlugin = "Plugin" Const
String sStateQuest = "Quest" Const
String sStateStage = "Stage" Const

String sTokenSelectedPlugin = "SelectedPlugin" Const
String sTokenSelectedQuest = "SelectedQuest" Const
String sTokenQuestStatus = "QuestStatus" Const
String sTokenQuestStage = "QuestStage" Const
String sTokenQuestIDPrefix = "QuestID" Const
String sTokenStageIDPrefix = "StageID" Const

Bool bHasPlugin = false Conditional
Bool bHasQuestID = false Conditional
Bool bHasQuest = false Conditional
Bool bHasStageID = false Conditional
Bool bAcceptingHexidecimalInput = false Conditional

InjectTec:Plugin myPlugin = None
Quest myQuest = None

Function initializeState(ObjectReference akTerminalRef)
	GoToState(sStatePlugin)

	bHasPlugin = false
	bHasQuestID = false
	bHasQuest = false
	bHasStageID = false
	bAcceptingHexidecimalInput = false

	myPlugin = None
	myQuest = None
	
	QuestID.initialize()
	StageID.initialize()
	
	draw(akTerminalRef)
EndFunction

Function loadQuest(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "loadQuest()")
EndFunction

InjectTec:Plugin Function getPlugin()
	return myPlugin
EndFunction

Function setPlugin(InjectTec:Plugin pluginRef, ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "setPlugin()")
EndFunction

Quest Function getQuest()
	return myQuest
EndFunction

Function setQuest(Quest questRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "setQuest()")
EndFunction

Function resetQuestIDLogic()
	bAcceptingHexidecimalInput = true
	bHasQuestID = false
	bHasQuest = false
	QuestID.initialize()
EndFunction

Function resetStageIDLogic()
	bHasStageID = false
	StageID.initialize()
EndFunction

Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "newInput()")
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

Function replaceDigitalInputTokens(CheatBunker:QuestControl:DigitalInput inputSet, String sPrefix)
	Int iCounter = 0
	String sTokenName = ""
	CheatBunker:QuestControl:InputValue[] values = inputSet.getValues()
	
	while (iCounter < inputSet.NumberOfDigits)
		sTokenName = sPrefix + iCounter
		if (iCounter < values.Length)
			replace(sTokenName, values[iCounter])
		else
			replace(sTokenName, CheatBunkerQuestControlDefaultDigit)
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function replaceQuestIDTokens()
	replaceDigitalInputTokens(QuestID, sTokenQuestIDPrefix)
EndFunction

Function replaceStageIDTokens()
	replaceDigitalInputTokens(StageID, sTokenStageIDPrefix)
EndFunction

Function tokenReplacementLogic()
	if (bHasPlugin)
		replace(sTokenSelectedPlugin, getPlugin())
	endif
	
	if (bHasQuest)
		replaceQuestData()
	endif
	
	replaceQuestIDTokens()
	replaceStageIDTokens()
EndFunction

Auto State Plugin
	Function setPlugin(InjectTec:Plugin pluginRef, ObjectReference akTerminalRef)
		myPlugin = pluginRef
		bHasPlugin = true
		GoToState(sStateQuest)
		draw(akTerminalRef)
	EndFunction
EndState

State Quest
	Event OnBeginState(String asOldState)
		resetQuestIDLogic()
	EndEvent
	
	Event OnEndState(String asNewState)
		bAcceptingHexidecimalInput = false
	EndEvent
	
	Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
		QuestID.setNextField(newValue)
		
		if (QuestID.isFull())
			bHasQuestID = true
			bAcceptingHexidecimalInput = false
		endif
		
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
		setQuest(getPlugin().lookupForm(QuestID.getValue()) as Quest)
		
		if (getQuest())
			bHasQuest = true
			GoToState(sStateStage)
		else
			CheatBunkerQuestControlInvalidQuestIDMessage.Show()
			resetQuestIDLogic()
		endif
		
		draw(akTerminalRef)
	EndFunction
EndState

State Stage
	Event OnBeginState(String asNewState)
		resetStageIDLogic()
	EndEvent
	
	Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
		StageID.setNextField(newValue)
		
		if (StageID.isFull())
			bHasStageID = true
		endif
		
		draw(akTerminalRef)
	EndFunction
	
	Function resetStageID(ObjectReference akTerminalRef)
		resetStageIDLogic()
		draw(akTerminalRef)
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
