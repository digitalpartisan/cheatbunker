Scriptname CheatBunker:AutoCompletion:GiveAliasToPlayer extends CheatBunker:AutoCompletion:StageResponder:CustomResponse

ReferenceAlias Property GiveMe Auto Const Mandatory

Function respond()
	CheatBunker:Logger:Autocompletion.logGivingAlias(self, GiveMe)
	Game.GetPlayer().AddItem(GiveMe.GetReference())
EndFunction
