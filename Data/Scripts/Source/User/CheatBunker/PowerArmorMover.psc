Scriptname CheatBunker:PowerArmorMover extends ObjectReference

CheatBunker:PowerArmorScript Property CheatBunkerPowerArmorBuilder Auto Const Mandatory
Message Property CheatBunkerPowerArmorMoveMessage Auto Const Mandatory
Int Property MoveResponse = 1 Auto Const

Event OnActivate(ObjectReference akActionRef)
	if (MoveResponse == CheatBunkerPowerArmorMoveMessage.Show())
		CheatBunkerPowerArmorBuilder.moveNearbyFrames()
	endif
EndEvent
