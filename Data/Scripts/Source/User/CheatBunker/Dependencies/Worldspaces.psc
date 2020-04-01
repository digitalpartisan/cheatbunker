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
        InjectTec:Utility:FormList.addForm(getWorldSpaces(), targetWorldSpace)
    endif
EndFunction

Function registerWorldSpaceList(FormList worldSpaces)
    if (worldSpaces && worldSpaces.GetSize())
        InjectTec:Utility:FormList.addFormList(getWorldSpaces(), worldSpaces)
    endif
EndFunction

Function unregisterWorldSpace(CheatBunker:WorldSpace targetWorldSpace)
    if (targetWorldSpace)
        InjectTec:Utility:FormList.removeForm(getWorldSpaces(), targetWorldSpace)
    endif
EndFunction

Function unregisterWorldSpaceList(FormList worldSpaces)
    if (worldSpaces && worldSpaces.GetSize())
        InjectTec:Utility:FormList.removeFormList(getWorldSpaces(), worldSpaces)
    endif
EndFunction

Function cleanWorldspaces()
    Jiffy:Utility:FormList.clean(getWorldSpaces())
EndFunction
