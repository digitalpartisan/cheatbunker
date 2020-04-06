Scriptname CheatBunker:WorldSpace:EntranceButton extends Spawny:ObjectReference

String sMarkerChild = "Marker" Const

Event OnActivate(ObjectReference akActionRef)
    if (Game.GetPlayer() == akActionRef)
        CheatBunker:Dependencies:General.getInstance().getTransitQuest().transitToInterior()
    endif
EndEvent

ObjectReference Function getMarker()
	return getChildReference(sMarkerChild)
EndFunction
