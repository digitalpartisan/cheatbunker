Scriptname CheatBunker:TransitScript Extends Quest Conditional

CheatBunker:CompanionScript Property CheatBunkerCompanionQuest Auto Const

Group StatusControl
	Quest Property CheatBunkerTransitQuest Auto Const
	Int Property HoldStage = 10 Auto Const
	Int Property CheatBunkerStage = 20 Auto Const
	Int Property FastTravelStage = 30 Auto Const
	Int Property RecoverCompanionsStage = 40 Auto Const
	Int Property InitiateSnapbackStage = 50 Auto Const
	Int Property CompleteSnapbackStage = 60 Auto Const
	Int Property CancelSnapbackStage = 70 Auto Const
EndGroup

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
	Spell Property TeleportSpell Auto Const
	ObjectReference Property InteriorMarker Auto Const
	ObjectReference Property FastTravelMarker Auto Const
EndGroup

Bool InFastTravel = false Conditional
Bool bSnapbackPrimed = false Conditional

Function forceHoldStage()
	CheatBunkerTransitQuest.SetStage(HoldStage)
EndFunction

Function applyEffectsToActor(Actor aTarget)
	if (aTarget)
		aTarget.addSpell(TeleportSpell, false)
	endif
EndFunction

Function applyEffects()
	applyEffectsToActor(Game.GetPlayer())
	applyEffectsToActor(CheatBunkerCompanionQuest.getDogmeatActor())
	applyEffectsToActor(CheatBunkerCompanionQuest.getCompanionActor())
EndFunction

Function transitActor(Actor aTarget, ObjectReference akLocation)
	if (aTarget)
		aTarget.moveTo(akLocation)
		aTarget.addSpell(TeleportSpell, false)
	endif
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
	
	forceHoldStage()
EndFunction

Function transitToFastTravel()
	transitToMarker(FastTravelMarker)
	InFastTravel = true
	
	forceHoldStage()
EndFunction

Function recoverCompanions()
	transitToMarker(Game.GetPlayer())
	
	forceHoldStage()
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
	
	forceHoldStage()
EndFunction

Function cancelSnapback()
	destroySnapbackMarker()
	bSnapbackPrimed = false
	CheatBunkerSnapbackCancelledMessage.Show()
	
	forceHoldStage()
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
	
	forceHoldStage()
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
