Scriptname CheatBunker:ItemQuantity:Remote extends CheatBunker:ItemQuantity:Abstract

Import InjectTec:Utility:HexidecimalLogic

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
Int Property FormID Auto Const
DigitSet Property FormDigits Auto Const

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Message Property CheatBunkerRemoteLoadingFailureMessage Auto Const Mandatory

Form fLoadedForm = None

Function loadingFailure()
	clean()
	CheatBunkerRemoteLoadingFailureMessage.Show()
EndFunction

Bool Function canLoad()
	fLoadedForm = PluginToReference.lookupWithCoalescedID(FormID, FormDigits)
	if !fLoadedForm
		loadingFailure()
		return false
	endif
	
	return true
EndFunction

Function clean()
	fLoadedForm = None
EndFunction

Form Function getForm()
	return fLoadedForm
EndFunction

Form Function getDisplayForm()
	return self
EndFunction
