Scriptname CheatBunker:ItemQuantity:Abstract extends Quest Hidden

Int Property iAmount = 1 Auto Const

Bool Function canLoad()
{Override this functionality in the remote generator script.}
	return true
EndFunction

Function clean()
{Used to clear out loaded remote forms. Override to implement.}
EndFunction

Form Function getForm()
{Override this in child scripts to impelement the correct behavior.}
	CheatBunker:Logger:RemoteLoading.logFunctionalityNotImplemented(self, "getForm()")
	return None
EndFunction

Form Function getDisplayForm()
	return getForm()
EndFunction

Function give()
	if (!canLoad())
		return
	endif
	
	Form fItemToGive = getForm()
	clean()
	
	Game.GetPlayer().AddItem(fItemToGive, iAmount)
EndFunction
