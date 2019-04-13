Scriptname CheatBunker:TransitScript Extends Quest Conditional

CheatBunker:CompanionScript Property CheatBunkerCompanionQuest Auto Const

Group Snapback
	Int Property iSnapbackTimerID = 1 Auto Const

	GlobalVariable Property SnapbackTimeLimit Auto Const Mandatory

	Message Property CheatBunkerSnapbackInitMessage Auto Const Mandatory
	Message Property CheatBunkerSnapbackFailMessage Auto Const Mandatory
	Message Property CheatBunkerSnapbackCompleteMessage Auto Const Mandatory
	Message Property CheatBunkerSnapbackCancelledMessage Auto Const Mandatory
	
	ObjectReference Property SnapbackMarker = None Auto
	Static Property XMarkerHeading Auto Const Mandatory
EndGroup

Group Transit
	Int Property LoadCellTimerID = 2 Auto Const
	GlobalVariable Property CheatBunkerLoadCellTimerDuration Auto Const Mandatory

	Location Property CheatBunkerLocation Auto Const Mandatory
	Location Property CheatBunkerFastTravelLocation Auto Const Mandatory
	
	Spell Property TeleportPlayerInSpell Auto Const Mandatory
	Spell Property TeleportInSpell Auto Const Mandatory
	
	Cell Property CheatBunkerInterior Auto Const Mandatory
	Cell Property CheatBunkerFastTravel Auto Const Mandatory
	
	ObjectReference Property InteriorMarker Auto Const Mandatory
	ObjectReference Property FastTravelMarker Auto Const Mandatory
EndGroup

CheatBunker:Settings Property CheatBunkerSettings Auto Const Mandatory

ObjectReference Property BunkerEntranceDoor Auto Const Mandatory
{Used to preload the interior of the bunker}
ObjectReference Property ForceExitMarker Auto Const Mandatory
{Used to relocate the player outside the bunker when uninstalling}

Bool bSnapbackPrimed = false Conditional
Bool bPreloadCell = false Conditional; legacy, required for 1.10.0 update to process correctly

Bool Function preloadingCell() ; also a legacy item, used to handle 1.10.0 update script and is vestigial after that
	return bPreloadCell
EndFunction

Event OnQuestShutdown()
	CancelTimer(iSnapbackTimerID)
	CancelTimer(LoadCellTimerID)
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

Function applyEffects()
	applyEffectsToActor(Game.GetPlayer())
	applyEffectsToActor(CheatBunkerCompanionQuest.getCompanionActor())
	applyEffectsToActor(CheatBunkerCompanionQuest.getDogmeatActor())
EndFunction

Bool Function moveActor(Actor aTarget, ObjectReference akLocation)
	if (!aTarget)
		return false
	endif
	
	if ( (aTarget as ObjectReference) != akLocation)
		aTarget.MoveTo(akLocation)
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

Function transitToFastTravel()
	transitToMarker(FastTravelMarker)
EndFunction

Function recoverCompanions()
	transitToPlayer()
EndFunction

Function forceLeaveBunker()
	transitToMarker(ForceExitMarker)
EndFunction

Bool Function placeSnapbackMarker()
	SnapbackMarker = Game.GetPlayer().PlaceAtMe(XMarkerHeading)
	if (SnapbackMarker == None)
		CheatBunkerSnapbackFailMessage.Show()
		return false
	endif
	
	return true
EndFunction

Function destroySnapbackMarker()
	if (SnapbackMarker == None)
		return
	endif
	ObjectReference akMarker = SnapbackMarker ; make sure the script property is clear before deleting just to be totally sure
	SnapbackMarker = None
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
	if (SnapbackMarker == None)
		CheatBunkerSnapbackFailMessage.Show()
		return
	endif
	
	transitToMarker(SnapbackMarker)
	destroySnapbackMarker()
	CheatBunkerSnapbackCompleteMessage.Show()
	bSnapbackPrimed = false
	CancelTimer(iSnapbackTimerID)
EndFunction

Function locationChangeHandler(Location akFrom, Location akTo)
	if (akFrom == CheatBunkerFastTravelLocation && akTo != CheatBunkerLocation) ; leaving the fast travel room to somewhere other than the bunker interior, so fast travel via map
		applyEffects()
	endif
EndFunction

Function forcePreloadCell()
	CheatBunker:Logger.preloadingCell()
	
	if (CheatBunkerInterior.IsAttached()) ; player is in the bunker, cell is loaded, do nothing
		return
	endif
	
	if (CheatBunkerInterior.IsLoaded()) ; once again, do nothing since it's needless work
		return
	endif
	
	BunkerEntranceDoor.PreloadTargetArea()
	
	if (CheatBunkerSettings.getPreloadInterior())
		StartTimer(CheatBunkerLoadCellTimerDuration.GetValue(), LoadCellTimerID)
	endif
EndFunction

Event OnTimer(int iTimerID)
	if (iTimerID == iSnapbackTimerID)
		cancelSnapback()
	endif

	if (iTimerID == LoadCellTimerID)
		forcePreloadCell()
	endif
EndEvent
