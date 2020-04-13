Scriptname CheatBunker:Autocompletion:KillAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

Int[] Property KillIDs Auto Const Mandatory

Function respond(Quest targetQuest)
	ReferenceAlias[] killSet = resolveReferenceAliasArray(targetQuest, KillIDs)
	CheatBunker:Logger:Autocompletion.logKillingAliases(self, killSet as Alias[])
	
	if (!killSet || !killSet.Length)
		return
	endif
	
	Actor aPlayer = Game.GetPlayer()
	Int iCounter = 0
	while (iCounter < killSet.Length)
		killSet[iCounter].GetActorReference().Kill(aPlayer)
		iCounter += 1
	endWhile
EndFunction
