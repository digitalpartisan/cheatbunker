Scriptname CheatBunker:Dependencies:WorldSpaces extends Quest Const

CustomEvent Added
CustomEvent AddedList
CustomEvent Removed
CustomEvent RemovedList

FormList Property CheatBunkerDependenciesWorldSpacesList Auto Const Mandatory
Spawny:Spawner:AdjustmentHandler Property CheatBunkerSpawnAdjuster Auto Const Mandatory

CheatBunker:Dependencies:WorldSpaces Function getInstance() Global
	return Game.GetFormFromFile(0x000050F3, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:WorldSpaces
EndFunction

FormList Function getWorldSpaces()
    return CheatBunkerDependenciesWorldSpacesList
EndFunction

Function registerWorldSpace(CheatBunker:WorldSpace targetWorldSpace)
	if (!targetWorldSpace || !targetWorldSpace.isReadyForTransit())
		return
	endif

	InjectTec:Utility:FormList.addForm(getWorldSpaces(), targetWorldSpace)
	Var[] args = new Var[1]
	args[0] = targetWorldSpace
	SendCustomEvent("Added", args)
EndFunction

Function registerWorldSpaceList(FormList worldSpaces)
    if (worldSpaces && worldSpaces.GetSize())
        InjectTec:Utility:FormList.addFormList(getWorldSpaces(), worldSpaces)
		
    endif
	
	if (!worldSpaces || !worldSpaces.GetSize())
		return
	endif
	
	InjectTec:Utility:FormList.addFormList(getWorldSpaces(), worldSpaces)
	Var[] args = new Var[1]
	args[0] = worldSpaces
	SendCustomEvent("AddedList", args)
EndFunction

Function unregisterWorldSpace(CheatBunker:WorldSpace targetWorldSpace)
    if (!targetWorldSpace)
        return
    endif
	
	InjectTec:Utility:FormList.removeForm(getWorldSpaces(), targetWorldSpace)
	Var[] args = new Var[1]
	args[0] = targetWorldSpace
	SendCustomEvent("Removed", args)
EndFunction

Function unregisterWorldSpaceList(FormList worldSpaces)
    if (!worldSpaces || !worldSpaces.GetSize())
        return
    endif
	
	InjectTec:Utility:FormList.removeFormList(getWorldSpaces(), worldSpaces)
	Var[] args = new Var[1]
	args[0] = worldSpaces
	SendCustomEvent("RemovedList", args)
EndFunction

Spawny:Spawner:AdjustmentHandler Function getAdjuster()
	return CheatBunkerSpawnAdjuster
EndFunction
