Scriptname CheatBunker:Importer:Item:Generic extends CheatBunker:Importer:Item

Import InjectTec:Utility:HexidecimalLogic

Int Property Amount = 1 Auto Const
GlobalVariable Property AmountVariable Auto Const
DigitSet[] Property Digits Auto Const Mandatory

Form[] myForms = None

Int Function getAmount()
	if (AmountVariable)
		return AmountVariable.GetValueInt()
	else
		return Amount
	endif
EndFunction

DigitSet[] Function getDigits()
	return Digits
EndFunction

Form[] Function getForms()
	return myForms
EndFunction

Function unloadBehavior()
	myForms = None
EndFunction

Bool Function loadBehavior()
	if (!meetsPluginRequirements() || !getDigits())
		return false
	endif
	
	myForms = getPlugin().lookupArray(getDigits())
	return myForms && myForms.Length == getDigits().Length
EndFunction

Function addBehavior(ObjectReference akContainerRef)
	Form[] forms = getForms()
	if (!forms || !forms.Length || !akContainerRef)
		return
	endif
	
	Int iAmount = getAmount()
	Int iCounter = 0
	while (iCounter < forms.Length)
		akContainerRef.AddItem(forms[iCounter], iAmount)
		iCounter += 1
	endWhile
EndFunction
