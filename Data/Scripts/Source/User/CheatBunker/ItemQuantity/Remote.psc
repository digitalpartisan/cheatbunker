Scriptname CheatBunker:ItemQuantity:Remote extends CheatBunker:ItemQuantity:Abstract

Import InjectTec:Utility:HexidecimalLogic

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
DigitSet Property FormDigits Auto Const

Form fLoadedForm = None

Function loadingFailure()
	clean()
	CheatBunker:Dependencies:Spawning.getInstance().showRemoteLoadingFailureMessage()
EndFunction

Bool Function canLoad()
	fLoadedForm = PluginToReference.lookup(FormDigits)
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
