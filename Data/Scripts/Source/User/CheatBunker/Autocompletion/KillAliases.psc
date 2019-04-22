Scriptname cheatbunker:autocompletion:KillAliases extends cheatbunker:autocompletion:stageresponder:customresponse

ReferenceAlias[] Property KillThese Auto Const Mandatory

Function respond()
	CheatBunker:Logger:Autocompletion.logKillingAliases(self, KillThese as Alias[])
	ReferenceAlias killMe = None
	Int iCounter = 0
	Actor aPlayer = Game.GetPlayer()
	while (iCounter < KillThese.Length)
		killMe = KillThese[iCounter]
		if (killMe)
			killMe.GetActorReference().Kill(aPlayer)
		endif
		
		iCounter += 1
	endWhile
EndFunction
