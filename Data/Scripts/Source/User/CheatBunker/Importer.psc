Scriptname CheatBunker:Importer extends Quest

InjectTec:Injector:Bulk Property Injections Auto Const Mandatory
Message Property Description Auto Const Mandatory
Chronicle:Package Property Provider Auto Const Mandatory

InjectTec:Injector:Bulk Function getInjections()
	return Injections
EndFunction

Message Function getDescriptionMessage()
	return Description
EndFunction

Chronicle:Package Function getProvider()
	return Provider
EndFunction

Function injectList(FormList importers, Bool bForce = false) Global
	if (!importers || !importers.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = importers.GetSize()
	CheatBunker:Importer target = None
	
	while (iCounter < iSize)
		target = importers.GetAt(iCounter) as CheatBunker:Importer
		if (target)
			target.Injections.inject(bForce)
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function forceInjectList(FormList importers) Global
	injectList(importers, true)
EndFunction

Function revertList(FormList importers, Bool bForce = false) Global
	if (!importers || !importers.GetSize())
		return
	endif
	
	Int iCounter = 0
	Int iSize = importers.GetSize()
	CheatBunker:Importer target = None
	
	while (iCounter < iSize)
		target = importers.GetAt(iCounter) as CheatBunker:Importer
		if (target)
			target.Injections.revert(bForce)
		endif
		
		iCounter += 1
	endWhile
EndFunction

Function forceRevertList(FormList importers) Global
	revertList(importers, true)
EndFunction
