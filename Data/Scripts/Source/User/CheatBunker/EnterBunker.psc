Scriptname CheatBunker:EnterBunker extends ReferenceAlias Conditional

Location Property Bunker Auto Const
Int Property iEnterBunkerObjective = 10 Auto Const
Int Property iReadManualObjective = 15 Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Quest qIntroQuest = GetOwningQuest()

	if (qIntroQuest.isCompleted()) ; this shouldn't happen because this alias script should be unreguesterd when the quest completes, but safety never hurt anyone
		return
	endif

	if ( akNewLoc == Bunker && qIntroQuest.isObjectiveDisplayed(iEnterBunkerObjective) )
		qIntroQuest.SetObjectiveCompleted(iEnterBunkerObjective)
		qIntroQuest.setObjectiveDisplayed(iReadManualObjective)
	endif
EndEvent
