Scriptname CheatBunker:WorldSpace:List extends DynamicTerminal:ListWrapper:FormList

Bool Function itemPassesFilter(Int iNumber)
    CheatBunker:WorldSpace targetWorldSpace = getRawDataItem(iNumber) as CheatBunker:WorldSpace
	return targetWorldSpace && targetWorldSpace.isReadyForTransit()
EndFunction

FormList Function getRawData()
	return CheatBunker:Dependencies:WorldSpaces.getInstance().getWorldSpaces()
EndFunction
