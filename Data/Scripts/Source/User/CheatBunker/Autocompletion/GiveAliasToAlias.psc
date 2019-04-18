Scriptname CheatBunker:Autocompletion:GiveAliasToAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

ReferenceAlias Property GiveMe Auto Const Mandatory
ReferenceAlias Property ToMe Auto Const Mandatory

Function respond()
	CheatBunker:Logger:Autocompletion.logGivingAliasToAlias(self, GiveMe, ToMe)
	ToMe.GetReference().AddItem(GiveMe.GetReference())
EndFunction
