Scriptname CheatBunker:Importer:Items extends Quest

Import InjectTec:Utility:HexidecimalLogic

CheatBunker:Importer Property MyImporter Auto Const Mandatory
InjectTec:Plugin Property MyPlugin Auto Const Mandatory
DigitSet[] Property MyDigitSets Auto Const Mandatory
Int Property Amount = 1 Auto Const
GlobalVariable Property AmountVariable Auto Const

String sStateUnloaded = "Unloaded" Const
String sStateLoaded = "Loaded" Const

Form[] afTargets = None

Function goToUnloaded()

EndFunction

Function goToLoaded()

EndFunction

Form[] Function getForms()
	return None
EndFunction

Int Function getAmount()
	return 0
EndFunction

Function addToContainer(ObjectReference containerRef)
	
EndFunction

CheatBunker:Importer Function getImporter()
	return MyImporter
EndFunction

InjectTec:Plugin Function getPlugin()
	return MyPlugin
EndFunction

DigitSet[] Function getDigitSets()
	return None
EndFunction

Function reload()
	goToUnloaded()
	goToLoaded()
EndFunction

Auto State Unloaded
	Event OnBeginState(String asOldState)
		afTargets = None
	EndEvent
	
	Event OnQuestInit()
		goToLoaded()
	EndEvent
	
	Function goToLoaded()
		GoToState(sStateLoaded)
	EndFunction
EndState

State Loaded
	Event OnBeginState(String asOldState)
		if (MyPlugin && MyPlugin.isInstalled())
			afTargets = MyPlugin.lookupArrayWithDigitSets(getDigitSets())
			if (!afTargets)
				Stop()
			endif
		else
			Stop()
		endif
	EndEvent
	
	Event OnQuestShutdown()
		goToUnloaded()
	EndEvent
	
	Function goToUnloaded()
		GoToState(sStateLoaded)
	EndFunction
	
	DigitSet[] Function getDigitSets()
		return MyDigitSets
	EndFunction
	
	Form[] Function getForms()
		return afTargets
	EndFunction
	
	Int Function getAmount()
		if (AmountVariable)
			return AmountVariable.GetValueInt()
		else
			return Amount
		endif
	EndFunction
	
	Function addToContainer(ObjectReference containerRef)
		Form[] afForms = getForms()
		Int iAmount = getAmount()
		
		if (!containerRef || !afForms || !afForms.Length || iAmount < 1)
			return
		endif
		
		Int iCounter = 0
		while (iCounter < afForms.Length)
			containerRef.AddItem(afForms[iCounter], iAmount)
			iCounter += 1
		endWhile
	EndFunction
EndState
