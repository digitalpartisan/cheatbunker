Scriptname CheatBunker:ResetTargetContainer extends ObjectReference

ObjectReference Property TargetContainer Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer() != akActionRef || !TargetContainer)
		return
	endif
	
	TargetContainer.Reset()
EndEvent
