Scriptname CheatBunker:Autocompletion:ActivateAlias extends CheatBunker:Autocompletion:StageResponder:CustomResponse

ReferenceAlias Property ActivateMe Auto Const Mandatory

Function respond()
	CheatBunker:Logger:Autocompletion.logActivatingAlias(self, ActivateMe)
	ActivateMe.GetReference().Activate(Game.GetPlayer())
EndFunction
