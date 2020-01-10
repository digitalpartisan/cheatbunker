Scriptname CheatBunker:WorldSpace:EntranceButton extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
    if (Game.GetPlayer() == akActionRef)
        CheatBunker:Dependencies:General.getInstance().getTransitQuest().transitToInterior()
    endif
EndEvent
