Scriptname CheatBunker:TransitScript Extends Quest Conditional

CheatBunker:CompanionScript Property CheatBunkerCompanionQuest Auto Const

Group Snapback
	Int Property iSnapbackTimerID = 1 Auto Const

	GlobalVariable Property SnapbackTimeLimit Auto Const

	Message Property CheatBunkerSnapbackInitMessage Auto Const
	Message Property CheatBunkerSnapbackFailMessage Auto Const
	Message Property CheatBunkerSnapbackCompleteMessage Auto Const
	Message Property CheatBunkerSnapbackCancelledMessage Auto Const
	
	ObjectReference Property SnapbackMarker = None Auto
	Static Property XMarkerHeading Auto Const
EndGroup

Group FastTravel
	Location Property InteriorLocation Auto Const
	Location Property FastTravelLocation Auto Const
	Cell Property InteriorCell Auto Const
	Spell Property TeleportPlayerSpell Auto Const
	Spell Property TeleportSpell Auto Const
	ObjectReference Property InteriorMarker Auto Const
	ObjectReference Property FastTravelMarker Auto Const
EndGroup

ObjectReference Property BunkerExitDoor Auto Const Mandatory
{Used to expedite the uninstallation process}

Bool InFastTravel = false Conditional
Bool bSnapbackPrimed = false Conditional

Event OnQuestShutdown()
	CancelTimer(iSnapbackTimerID)
	destroySnapbackMarker()
EndEvent

Function applyEffectsToActor(Actor aTarget)
	if (aTarget)
		if (Game.GetPlayer() == aTarget)
			aTarget.addSpell(TeleportPlayerSpell, false)
		else
			aTarget.addSpell(TeleportSpell, false)
		endif
	endif
EndFunction

Function applyEffects()
	applyEffectsToActor(Game.GetPlayer())
	applyEffectsToActor(CheatBunkerCompanionQuest.getCompanionActor())
	applyEffectsToActor(CheatBunkerCompanionQuest.getDogmeatActor())
EndFunction

Function transitActor(Actor aTarget, ObjectReference akLocation)
	if (aTarget)
		if ( (aTarget as ObjectReference) != akLocation)
			aTarget.moveTo(akLocation)
			applyEffectsToActor(aTarget)
		endif
	endif
EndFunction

Function transitToPlayer(Actor aTarget)
	Actor aPlayer = Game.GetPlayer()
	if (aPlayer == aTarget)
		return
	endif

	transitActor(aTarget, aPlayer)
EndFunction

Function transitToMarker(ObjectReference akMarker)
	Actor aPlayer = Game.GetPlayer()
	transitActor(aPlayer, akMarker)
	transitActor(CheatBunkerCompanionQuest.getDogmeatActor(), aPlayer)
	transitActor(CheatBunkerCompanionQuest.getCompanionActor(), aPlayer)
EndFunction

Function transitToInterior()
	transitToMarker(InteriorMarker)
	InFastTravel = false
EndFunction

Function transitToFastTravel()
	transitToMarker(FastTravelMarker)
	InFastTravel = true
EndFunction

Function recoverCompanions()
	transitToMarker(Game.GetPlayer())
EndFunction

Function forceLeaveBunker()
	Actor aPlayer = Game.GetPlayer()
	aPlayer.MoveTo(BunkerExitDoor)
	BunkerExitDoor.Activate(aPlayer)
	applyEffects()
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
	if (akTo == FastTravelLocation)
		InFastTravel = true
	else
		if (InFastTravel)
			applyEffects()
		endif
		InFastTravel = false
	endif
EndFunction

Event OnTimer(int iTimerID)
	if (iTimerID == iSnapbackTimerID)
		cancelSnapback()
	endif
EndEvent
