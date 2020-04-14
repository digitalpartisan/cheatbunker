Scriptname CheatBunker:QuestControl:DigitalInput:Terminal extends DynamicTerminal:Basic Hidden Conditional

Message Property CheatBunkerQuestControlDefaultDigit Auto Const Mandatory

Bool bHasPlugin = false Conditional
Bool bAcceptingHexidecimalInput = false Conditional

String sStatePlugin = "Plugin" Const

String sTokenSelectedPlugin = "SelectedPlugin" Const

InjectTec:Plugin myPlugin = None

Bool Function isAcceptingHexidecimalInput()
	return bAcceptingHexidecimalInput
EndFunction

Function acceptHexidecimalInput()
	bAcceptingHexidecimalInput = true
EndFunction

Function stopAcceptingHexidecimalInput()
	bAcceptingHexidecimalInput = false
EndFunction

Function progressState()
	CheatBunker:Logger.logBehaviorUndefined(self, "progressState()")
EndFunction

String Function getStateAfterPlugin()
	CheatBunker:Logger.logBehaviorUndefined(self, "getStateAfterPlugin()")
	return None
EndFunction

Function goToPlugin()
	GoToState(sStatePlugin)
EndFunction

InjectTec:Plugin Function getPlugin()
	return myPlugin
EndFunction

Function initializeBehavior()

EndFunction

Function initializeState(ObjectReference akTerminalRef)
	goToPlugin()
	initializeBehavior()
	draw(akTerminalRef)
EndFunction

Function setPlugin(InjectTec:Plugin pluginRef, ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "setPlugin()")
EndFunction

Function replacePlugin()
	replace(sTokenSelectedPlugin, getPlugin())
EndFunction

Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "newInput()")
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

Auto State Plugin
	Event OnBeginState(String asOldState)
		stopAcceptingHexidecimalInput()
		bHasPlugin = false
	EndEvent

	Function setPlugin(InjectTec:Plugin pluginRef, ObjectReference akTerminalRef)
		myPlugin = pluginRef
		bHasPlugin = true
		progressState()
		draw(akTerminalRef)
	EndFunction
	
	Function progressState()
		goToState(getStateAfterPlugin())
	EndFunction
EndState
