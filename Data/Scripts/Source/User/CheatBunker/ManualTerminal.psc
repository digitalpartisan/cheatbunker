Scriptname CheatBunker:ManualTerminal extends Terminal Const

CheatBunker:IntroQuest Property CheatBunkerIntroQuest Auto Const Mandatory
Int Property ManualMenuItemID = 1 Auto Const

Event OnMenuItemRun(int auiMenuItemID, ObjectReference akTarget)
	if (auiMenuItemID == ManualMenuItemID && !CheatBunkerIntroQuest.IsCompleted())
		CheatBunkerIntroQuest.manualWasOpened()
	endif
EndEvent
