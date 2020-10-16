Scriptname CheatBunker:WorldSpace:Handler extends DynamicTerminal:Basic Conditional

Bool bIsValid = false Conditional
CheatBunker:WorldSpace myWorldSpace = None

Bool Function isValid()
    return bIsValid
EndFunction

CheatBunker:WorldSpace Function getWorldSpace()
    return myWorldSpace
EndFunction

Function setWorldSpace(CheatBunker:WorldSpace targetWorldSpace)
	myWorldSpace = targetWorldSpace
	bIsValid = myWorldSpace && myWorldSpace.isReadyForTransit()
EndFunction

Function transitTo(ObjectReference akTerminalRef)
    isValid() && getWorldSpace().transitTo()
EndFunction

Function transitToFromTerminal(ObjectReference akTerminalRef)
    isValid() && getWorldSpace().transitToFromTerminal(akTerminalRef)
EndFunction

Function tokenReplacementLogic()
    if (isValid())
        replace("SelectedWorldSpace", getWorldSpace())
	else
		replace("SelectedWorldSpace", None)
	endif
EndFunction
