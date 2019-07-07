Scriptname CheatBunker:ItemGenerator:Remote extends CheatBunker:ItemGenerator:Abstract

Import InjectTec:Utility:HexidecimalLogic

InjectTec:Plugin Property PluginToReference Auto Const Mandatory
DigitSet Property FormDigits Auto Const Mandatory
DigitSet[] Property ModDigitSets Auto Const

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Message Property CheatBunkerRemoteLoadingFailureMessage Auto Const Mandatory

Form fLoadedForm = None
ObjectMod[] aLoadedMods = None

Function loadingFailure()
	clean()
	CheatBunkerRemoteLoadingFailureMessage.Show()
EndFunction

Bool Function canLoad()
	fLoadedForm = PluginToReference.lookupWithDigits(FormDigits)
	if (None == fLoadedForm)
		loadingFailure()
		return false
	endif
	
	if !ModDigitSets
		return true
	endif
	
	; admittedly, this is a bit of a hack, but the game won't outright crash here, so it's the mod author's fault if something doesn't pan out.  Do good Q/A, etc.
	aLoadedMods = PluginToReference.lookupArrayWithDigitSets(ModDigitSets) as ObjectMod[]
	if !aLoadedMods
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
