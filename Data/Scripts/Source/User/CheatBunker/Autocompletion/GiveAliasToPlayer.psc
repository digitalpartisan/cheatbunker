Scriptname CheatBunker:AutoCompletion:GiveAliasToPlayer extends CheatBunker:AutoCompletion:StageResponder:CustomResponse

ReferenceAlias Property GiveMe Auto Const
Int[] Property GiveIDs Auto Const Mandatory

Function respond(Quest targetQuest)
	ReferenceAlias[] giveSet = resolveReferenceAliasArray(targetQuest, GiveIDs)
	CheatBunker:Logger:Autocompletion.logGivingAliases(self, giveSet as Alias[])
	
	if (!giveSet || !giveSet.Length)
		return
	endif
	
	Actor aPlayer = Game.GetPlayer()
	Int iCounter = 0
	while (iCounter < giveSet.Length)
		aPlayer.AddItem(giveSet[iCounter].GetReference())
		iCounter += 1
	endWhile
EndFunction
