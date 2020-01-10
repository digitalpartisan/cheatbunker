Scriptname CheatBunker:TransitScript Extends Quest Conditional

CheatBunker:CompanionScript Property CheatBunkerCompanionQuest Auto Const

Group Snapback
	Int Property iSnapbackTimerID = 1 Auto Const

	GlobalVariable Property SnapbackTimeLimit Auto Const Mandatory

	Message Property CheatBunkerSnapbackInitMessage Auto Const Mandatory
	Message Property CheatBunkerSnapbackFailMessage Auto Const Mandatory
	Message Property CheatBunkerSnapbackCompleteMessage Auto Const Mandatory
	Message Property CheatBunkerSnapbackCancelledMessage Auto Const Mandatory

	Static Property XMarkerHeading Auto Const Mandatory
EndGroup

Group Transit
	Spell Property TeleportPlayerInSpell Auto Const Mandatory
	Spell Property TeleportInSpell Auto Const Mandatory

	ObjectReference Property InteriorMarker Auto Const Mandatory
EndGroup

CheatBunker:WorldSpace:Local Property CheatBunkerPackageBaseWorldSpaceCommonwealth Auto Const Mandatory
{Used to relocate the player outside the bunker when uninstalling}

Bool bSnapbackPrimed = false Conditional
ObjectReference snapbackMarker = None

Event OnQuestShutdown()
	CancelTimer(iSnapbackTimerID)
	destroySnapbackMarker()
EndEvent

Function applyEffectsToActor(Actor aTarget)
	if (!aTarget)
		return
	endif
	
	Spell sTeleport = TeleportInSpell
	if (aTarget == Game.GetPlayer())
		sTeleport = TeleportPlayerInSpell
	endif
	
	aTarget.AddSpell(sTeleport, false)
EndFunction

Bool Function moveActor(Actor aTarget, ObjectReference akLocation)
	if (!aTarget)
		return false
	endif
	
	if ( (aTarget as ObjectReference) != akLocation)
	    if (Game.GetPlayer() == aTarget)
            Game.FastTravel(akLocation)
	    else
            aTarget.MoveTo(akLocation)
	    endif

		return true
	endif
	
	return false
EndFunction

Function moveToMarker(ObjectReference akMarker)
	Actor aPlayer = Game.GetPlayer()
	moveActor(aPlayer, akMarker)
	moveActor(CheatBunkerCompanionQuest.getDogmeatActor(), aPlayer)
	moveActor(CheatBunkerCompanionQuest.getCompanionActor(), aPlayer)
EndFunction

Function moveToPlayer()
	moveToMarker(Game.GetPlayer())
EndFunction

Function transitActor(Actor aTarget, ObjectReference akLocation)
	if (moveActor(aTarget, akLocation))
		applyEffectsToActor(aTarget)
	endif
EndFunction

Function transitToMarker(ObjectReference akMarker)
	Actor aPlayer = Game.GetPlayer()
	transitActor(aPlayer, akMarker)
	transitActor(CheatBunkerCompanionQuest.getDogmeatActor(), aPlayer)
	transitActor(CheatBunkerCompanionQuest.getCompanionActor(), aPlayer)
EndFunction

Function transitToPlayer()
	transitToMarker(Game.GetPlayer())
EndFunction

Function transitToInterior()
    transitToMarker(InteriorMarker)
EndFunction

Function recoverCompanions()
	transitToPlayer()
EndFunction

Function forceLeaveBunker()
	CheatBunkerPackageBaseWorldSpaceCommonwealth.transitTo()
EndFunction

Bool Function placeSnapbackMarker()
	snapbackMarker = Game.GetPlayer().PlaceAtMe(XMarkerHeading)
	if (snapbackMarker == None)
		CheatBunkerSnapbackFailMessage.Show()
		return false
	endif
	
	return true
EndFunction

Function destroySnapbackMarker()
	if (snapbackMarker == None)
		return
	endif

	ObjectReference akMarker = snapbackMarker ; make sure the script property is clear before deleting just to be totally sure
	snapbackMarker = None
	akMarker.Delete()
EndFunction

Function initiateSnapback()
	destroySnapbackMarker()
	if (!placeSnapbackMarker())
		CheatBunkerSnapbackFailMessage.Show()
		return
	endif
	
	transitToInterior()
	CheatBunkerSnapbackInitMessage.Show()
	bSnapbackPrimed = true
	StartTimer(SnapbackTimeLimit.GetValue(), iSnapbackTimerID)
EndFunction

Function cancelSnapback()
	CancelTimer(iSnapbackTimerID)
	destroySnapbackMarker()
	bSnapbackPrimed = false
	CheatBunkerSnapbackCancelledMessage.Show()
EndFunction

Function completeSnapback()
	if (snapbackMarker == None)
		CheatBunkerSnapbackFailMessage.Show()
		return
	endif
	
	transitToMarker(snapbackMarker)
	destroysnapbackMarker()
	CheatBunkerSnapbackCompleteMessage.Show()
	bSnapbackPrimed = false
	CancelTimer(iSnapbackTimerID)
EndFunction

Event OnTimer(int iTimerID)
	if (iTimerID == iSnapbackTimerID)
		cancelSnapback()
	endif
EndEvent
