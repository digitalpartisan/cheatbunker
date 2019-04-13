Scriptname CheatBunker:Autocompletion:KillAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

ReferenceAlias Property KillMe Auto Const Mandatory

Function respond()
	CheatBunker:Logger:Autocompletion.logKillingAlias(self, KillMe)
	KillMe.GetActorReference().Kill(Game.GetPlayer())
EndFunction
