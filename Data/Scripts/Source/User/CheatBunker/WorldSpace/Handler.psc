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

Function transitTo()
    if (isValid())
        getWorldSpace().transitTo()
    endif
EndFunction

Function tokenReplacementLogic()
    if (isValid())
        replace("SelectedWorldSpace", getWorldSpace())
	else
		replace("SelectedWorldSpace", None)
	endif
EndFunction
