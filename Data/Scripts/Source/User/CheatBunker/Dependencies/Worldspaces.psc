Scriptname CheatBunker:Dependencies:WorldSpaces extends Quest Const

FormList Property CheatBunkerDependenciesWorldSpacesList Auto Const Mandatory

CheatBunker:Dependencies:WorldSpaces Function getInstance() Global
	return Game.GetFormFromFile(0x000050F3, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:WorldSpaces
EndFunction

FormList Function getWorldSpaces()
    return CheatBunkerDependenciesWorldSpacesList
EndFunction

Function registerWorldSpace(CheatBunker:WorldSpace targetWorldSpace)
    if (targetWorldSpace && targetWorldSpace.isReadyForTransit())
        getWorldSpaces().AddForm(targetWorldSpace)
    endif
EndFunction

Function unregisterWorldSpace(CheatBunker:WorldSpace targetWorldSpace)
    if (targetWorldSpace)
        getWorldSpaces().RemoveAddedForm(targetWorldSpace)
    endif
EndFunction
