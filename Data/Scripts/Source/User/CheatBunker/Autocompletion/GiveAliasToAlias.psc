Scriptname CheatBunker:Autocompletion:GiveAliasToAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

Struct GiveTo
	Int giveID = 0
	Int toID = 0
EndStruct

GiveTo[] Property GiveRelations Auto Const Mandatory

Function respond(Quest targetQuest)
	if (!GiveRelations || !GiveRelations.Length)
		return
	endIf
	
	Int iCounter = 0
	GiveTo targetSet = None
	while (iCounter < GiveRelations.Length)
		targetSet = GiveRelations[iCounter]
		if (targetSet)
			ReferenceAlias giveAlias = resolveReferenceAlias(targetQuest, targetSet.giveID)
			ReferenceAlias toAlias = resolveReferenceAlias(targetQuest, targetSet.toID)
			CheatBunker:Logger:Autocompletion.logGivingAliasToAlias(self, giveAlias, toAlias)
			toAlias.GetReference().AddItem(giveAlias.GetReference())
		endif
		
		iCounter += 1
	endWhile
EndFunction
