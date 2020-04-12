Scriptname CheatBunker:AutoCompletion:KillRefCollectionAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

RefCollectionAlias Property KillThese Auto Const
Int[] Property KillIDs Auto Const Mandatory

Function respond(Quest targetQuest)
	RefCollectionAlias[] killSet = resolveRefCollectionAliasArray(targetQuest, KillIDs)
	CheatBunker:Logger:Autocompletion.logKillingAliases(self, killSet as Alias[])
	
	if (!killSet || !killSet.Length)
		return
	endif
	
	Actor aPlayer = Game.GetPlayer()
	Int iCounter = 0
	while (iCounter < killSet.Length)
		killSet[iCounter].KillAll(aPlayer)
		iCounter += 1
	endWhile
EndFunction
