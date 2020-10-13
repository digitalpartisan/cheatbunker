Scriptname CheatBunker:TransitScript Extends Quest Conditional

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

CheatBunker:WorldSpace Property CheatBunkerPackageBaseWorldSpaceCommonwealth Auto Const Mandatory
{Autofill, Used to relocate the player outside the bunker when uninstalling}
Jiffy:Teleporter Property CheatBunkerTeleporter Auto Const Mandatory
{Autofill}

Bool bSnapbackPrimed = false Conditional
ObjectReference snapbackMarker = None

Event OnQuestShutdown()
	CancelTimer(iSnapbackTimerID)
	destroySnapbackMarker()
	CheatBunkerPackageBaseWorldSpaceCommonwealth.transitTo()
EndEvent

Function teleport(ObjectReference akDestinationRef)
	CheatBunkerTeleporter.act(akDestinationRef)
EndFunction

Function teleportFromTerminal(ObjectReference akDestinationRef)
	CheatBunkerTeleporter.actFromTerminal(akDestinationRef)
EndFunction

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

Bool Function moveActor(Actor aTarget, ObjectReference akDestination)
	if (!aTarget || !akDestination || (aTarget as ObjectReference) == akDestination )
		return false
	endif

	aTarget.MoveTo(akDestination)
    return true
EndFunction

Function transitActor(Actor aTarget, ObjectReference akLocation)
	moveActor(aTarget, akLocation) && applyEffectsToActor(aTarget)
EndFunction

Function transitToPlayer(Actor aTarget)
	transitActor(aTarget, Game.GetPlayer())
EndFunction

Function transitToInterior()
    teleport(InteriorMarker)
EndFunction

Function transitToInteriorFromTerminal()
	teleportFromTerminal(InteriorMarker)
EndFunction

Function recoverCompanions()
	CheatBunkerTeleporter.moveFollowers()
	CheatBunkerTeleporter.addSpellToFollowers()
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
	
	transitToInteriorFromTerminal()
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
	
	teleportFromTerminal(snapbackMarker)
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
