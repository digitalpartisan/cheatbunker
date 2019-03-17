Scriptname CheatBunker:ResetWorkshopContainer extends ObjectReference Const

ObjectReference Property WorkshopContents Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if (WorkshopContents)
		WorkshopContents.Reset()
	endif
EndEvent
