Scriptname CheatBunker:Autocompletion:StageResponder:CustomResponse extends Quest

Alias Function resolveAlias(Quest targetQuest, Int iAliasID)
	if (!targetQuest)
		return None
	endif
	
	return targetQuest.GetAlias(iAliasID)
EndFunction

Alias[] Function resolveAliasArray(Quest targetQuest, Int[] iAliasIDs)
	Alias[] result = new Alias[0]
	
	Int iCounter = 0
	while (iCounter < iAliasIDs.Length)
		result.Add(resolveAlias(targetQuest, iAliasIDs[iCounter]))
		iCounter += 1
	endWhile
	
	return result
EndFunction

ReferenceAlias Function resolveReferenceAlias(Quest targetQuest, Int iAliasID)
	return resolveAlias(targetQuest, iAliasID) as ReferenceAlias
EndFunction

ReferenceAlias[] Function resolveReferenceAliasArray(Quest targetQuest, Int[] iAliasIDs)
	return resolveAliasArray(targetQuest, iAliasIDs) as ReferenceAlias[]
EndFunction

RefCollectionAlias Function resolveRefCollectionAlias(Quest targetQuest, Int iAliasID)
	return resolveAlias(targetQuest, iAliasID) as RefCollectionAlias
EndFunction

RefCollectionAlias[] Function resolveRefCollectionAliasArray(Quest targetQuest, Int[] iAliasIDs)
	return resolveAliasArray(targetQuest, iAliasIDs) as RefCollectionAlias[]
EndFunction

Function respond(Quest targetQuest)

EndFunction
