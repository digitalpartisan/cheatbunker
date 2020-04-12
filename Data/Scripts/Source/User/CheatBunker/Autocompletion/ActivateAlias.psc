Scriptname CheatBunker:Autocompletion:ActivateAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

ReferenceAlias Property ActivateMe Auto Const
Int[] Property AliasIDs Auto Const Mandatory

Function respond(Quest targetQuest)
	ReferenceAlias[] targetSet = resolveReferenceAliasArray(targetQuest, AliasIDs)
	CheatBunker:Logger:Autocompletion.logActivatingAliases(self, targetSet as Alias[])
	
	if (!targetSet || !targetSet.Length)
		return
	endif
	
	Actor aPlayer = Game.GetPlayer()
	Int iCounter = 0
	while (iCounter < targetSet.Length)
		targetSet[iCounter].GetReference().Activate(aPlayer)
		iCounter += 1
	endWhile
EndFunction
