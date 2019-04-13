Scriptname CheatBunker:AutoCompletion:KillRefCollectionAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

RefCollectionAlias Property KillThese Auto Const Mandatory

Function respond()
	CheatBunker:Logger:Autocompletion.logKillingAlias(self, KillThese)
	KillThese.KillAll(Game.GetPlayer())
EndFunction
