Scriptname CheatBunker:ResetTargetContainer extends ObjectReference Const

ObjectReference Property TargetContainer Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if (TargetContainer)
		TargetContainer.Reset()
	endif
EndEvent
