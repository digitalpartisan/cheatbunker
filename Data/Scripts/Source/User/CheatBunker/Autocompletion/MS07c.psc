Scriptname CheatBunker:Autocompletion:MS07c extends CheatBunker:Autocompletion Conditional

Group Tape0Settings
	ReferenceAlias Property Tape0Reference Auto Const
	Int Property Tape0Stage Auto Const
EndGroup

Group Tape1Settings
	ReferenceAlias Property Tape1Reference Auto Const
	Int Property Tape1Stage Auto Const
EndGroup

Group Tape2Settings
	ReferenceAlias Property Tape2Reference Auto Const
	Int Property Tape2Stage Auto Const
EndGroup

Group Tape3Settings
	ReferenceAlias Property Tape3Reference Auto Const
	Int Property Tape3Stage Auto Const
EndGroup

Group Tape4Settings
	ReferenceAlias Property Tape4Reference Auto Const
	Int Property Tape4Stage Auto Const
EndGroup

Group Tape5Settings
	ReferenceAlias Property Tape5Reference Auto Const
	Int Property Tape5Stage Auto Const
EndGroup

Group Tape6Settings
	ReferenceAlias Property Tape6Reference Auto Const
	Int Property Tape6Stage Auto Const
EndGroup

Group Tape7Settings
	ReferenceAlias Property Tape7Reference Auto Const
	Int Property Tape7Stage Auto Const
EndGroup

Group Tape8Settings
	ReferenceAlias Property Tape8Reference Auto Const
	Int Property Tape8Stage Auto Const
EndGroup

Group Tape9Settings
	ReferenceAlias Property Tape9Reference Auto Const
	Int Property Tape9Stage Auto Const
EndGroup

Function completeStage(Int iStage, ReferenceAlias raTape)
	if (!MyQuest.IsStageDone(iStage))
		Game.GetPlayer().AddItem(raTape.GetReference())
	endif
EndFunction

Function runBehavior()
	completeStage(Tape0Stage, Tape0Reference)
	completeStage(Tape1Stage, Tape1Reference)
	completeStage(Tape2Stage, Tape2Reference)
	completeStage(Tape3Stage, Tape3Reference)
	completeStage(Tape4Stage, Tape4Reference)
	completeStage(Tape5Stage, Tape5Reference)
	completeStage(Tape6Stage, Tape6Reference)
	completeStage(Tape7Stage, Tape7Reference)
	completeStage(Tape8Stage, Tape8Reference)
	completeStage(Tape9Stage, Tape9Reference)

	finish()
EndFunction
