Scriptname CheatBunker:ItemQuantity:Remote extends CheatBunker:ItemQuantity:Abstract

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
Int Property FormID Auto Const Mandatory

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Form fLoadedForm = None

Function loadingFailure()
	clean()
	CheatBunkerQuest.remoteLoadingFailure()
EndFunction

Bool Function canLoad()
	fLoadedForm = PluginToReference.lookupForm(FormID)
	if (None == fLoadedForm)
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
