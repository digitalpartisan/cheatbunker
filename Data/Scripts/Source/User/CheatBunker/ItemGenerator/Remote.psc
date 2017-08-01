Scriptname CheatBunker:ItemGenerator:Remote extends CheatBunker:ItemGenerator:Abstract

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
Int Property FormID Auto Const Mandatory
Int[] Property ModIDs = None Auto Const

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Form fLoadedForm = None
ObjectMod[] aLoadedMods = None

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
	
	if (None == ModIDs)
		return true
	endif
	
	aLoadedMods = (PluginToReference.lookupForms(ModIDs) as ObjectMod[]) ; admittedly, this is a bit of a hack, but the game won't outright crash here, so it's the mod author's fault if something doesn't pan out.  Do good Q/A, etc.
	if (None == aLoadedMods)
		loadingFailure()
		return false
	endif
	
	return true
EndFunction

Function clean()
	fLoadedForm = None
	aLoadedMods = None
EndFunction

Form Function getForm()
	return fLoadedForm
EndFunction

ObjectMod[] Function getMods()
	return aLoadedMods
EndFunction
