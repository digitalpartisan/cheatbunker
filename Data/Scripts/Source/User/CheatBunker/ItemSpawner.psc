Scriptname CheatBunker:ItemSpawner extends CheatBunker:QuestControl:DigitalInput:Terminal Conditional

Message Property CheatBunkerQuestControlInvalidFormIDMessage Auto Const Mandatory

CheatBunker:QuestControl:DigitalInput:HexidecimalValue Property FormID Auto Const Mandatory
CheatBunker:QuestControl:DigitalInput:DecimalValue Property Quantity Auto Const Mandatory

String sStateForm = "Form" Const
String sStateQuantity = "Quantity" Const

String sTokenSelectedPlugin = "SelectedPlugin" Const
String sTokenSelectedForm = "SelectedForm" Const
String sTokenFormIDPrefix = "FormID" Const
String sTokenQuantityPrefix = "Quantity" Const

Bool bHasPlugin = false Conditional
Bool bHasFormID = false Conditional
Bool bHasForm = false Conditional
Bool bHasQuantity = false Conditional

Form myForm = None

String Function getStateAfterPlugin()
	return sStateForm
EndFunction

Function initializeBehavior()
	bHasFormID = false
	bHasForm = false
	bHasQuantity = false

	myForm = None
	
	FormID.initialize()
	Quantity.initialize()
EndFunction

Form Function getForm()
	return myForm
EndFunction

Function setForm(Form formRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "setForm()")
EndFunction

Function loadForm(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "loadForm()")
EndFunction

Function resetFormStateLogic()
	bHasQuantity = false

	Form targetForm = getForm()
	if (!targetForm)
		return
	endif
	
	replaceFormData()
EndFunction

Function resetFormIDLogic()
	bHasFormID = false
	bHasForm = false
	resetFormStateLogic()
	FormID.initialize()
EndFunction

Function resetQuantityLogic()
	bHasQuantity = false
	Quantity.initialize()
EndFunction

Function resetFormID(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "resetFormID()")
EndFunction

Function resetQuantity(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "resetQuantity()")
EndFunction

Function spawn(ObjectReference akTerminalRef)
	CheatBunker:Logger.logBehaviorUndefined(self, "forceQuantitySetting()")
EndFunction

Function replaceFormData()
	replace(sTokenSelectedForm, getForm())
EndFunction

Function replaceFormIDTokens()
	replaceDigitalInputTokens(FormID, sTokenFormIDPrefix)
EndFunction

Function replaceQuantityTokens()
	replaceDigitalInputTokens(Quantity, sTokenQuantityPrefix)
EndFunction

Function tokenReplacementLogic()
	replacePlugin()
	replaceFormData()
	replaceFormIDTokens()
	replaceQuantityTokens()
EndFunction

State Form
	Event OnBeginState(String asOldState)
		resetFormIDLogic()
		acceptHexidecimalInput()
	EndEvent
	
	Event OnEndState(String asNewState)
		stopAcceptingHexidecimalInput()
	EndEvent
	
	Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
		FormID.setNextField(newValue)
		bHasFormID = FormID.isFull()
		draw(akTerminalRef)
	EndFunction
	
	Function setForm(Form formRef)
		myForm = formRef
	EndFunction
	
	Function resetFormID(ObjectReference akTerminalRef)
		resetFormIDLogic()
		draw(akTerminalRef)
	EndFunction
	
	Function loadForm(ObjectReference akTerminalRef)
		setForm(getPlugin().lookupInt(FormID.getValue()))
		
		if (getForm())
			bHasForm = true
			GoToState(sStateQuantity)
		else
			CheatBunkerQuestControlInvalidFormIDMessage.Show()
			resetFormIDLogic()
		endif
		
		draw(akTerminalRef)
	EndFunction
	
	Function progressState()
		
	EndFunction
EndState

State Quantity
	Event OnBeginState(String asNewState)
		resetQuantityLogic()
	EndEvent
	
	Function newInput(CheatBunker:QuestControl:InputValue newValue, ObjectReference akTerminalRef)
		Quantity.setNextField(newValue)
		
		if (Quantity.isFull())
			bHasQuantity = true
		endif
		
		draw(akTerminalRef)
	EndFunction
	
	Function resetQuantity(ObjectReference akTerminalRef)
		resetQuantityLogic()
		draw(akTerminalRef)
	EndFunction
	
	Function spawn(ObjectReference akTerminalRef)
		Game.GetPlayer().AddItem(getForm(), Quantity.getValue())
		draw(akTerminalRef)
	EndFunction
EndState
