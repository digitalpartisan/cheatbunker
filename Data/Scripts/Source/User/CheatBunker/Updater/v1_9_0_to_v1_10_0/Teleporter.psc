Scriptname CheatBunker:Updater:v1_9_0_to_v1_10_0:Teleporter extends ObjectReference Const

Message Property CheatBunkerOldAreaMessage Auto Const Mandatory
{Autofill}
CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const Mandatory
{Autofill}

Event OnTriggerEnter(ObjectReference akActionRef)
	if (Game.GetPlayer() == akActionRef)
		CheatBunkerOldAreaMessage.Show()
		CheatBunkerTransitQuest.transitToInterior()
	endif
EndEvent
