Scriptname CheatBunker:WorkshopNPCSpawnState extends Quest Conditional

WorkshopParentScript Property WorkshopParent Auto Const Mandatory

Bool bReady = false Conditional
WorkshopScript workshopRef = none

Bool Function isReady()
	return bReady
EndFunction

WorkshopScript Function getWorkshopRef()
	return workshopRef
EndFunction

Function clearState()
	bReady = false
	workshopRef = None
EndFunction

Function examineTerminalRef(ObjectReference akTerminalRef)
	clearState()

	WorkshopObjectScript terminalObject = akTerminalRef as WorkshopObjectScript
	if (None == terminalObject)
		return
	endif
	
	workshopRef = WorkshopParent.GetWorkshop(terminalObject.WorkshopID)
	if (None == workshopRef)
		return
	endif
	
	bReady = true
EndFunction
