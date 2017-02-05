Scriptname CheatBunker:EnterBunker extends ReferenceAlias Conditional

Quest Property CheatBunkerIntroQuest Auto Const
Location Property Bunker Auto Const
Int Property iEnterBunkerObjective = 10 Auto Const
Int Property iReadManualObjective = 15 Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if (CheatBunkerIntroQuest.isCompleted()) ; this shouldn't happen because this alias script should be unreguesterd when the quest completes, but safety never hurt anyone
		return
	endif

	if ( akNewLoc == Bunker && CheatBunkerIntroQuest.isObjectiveDisplayed(iEnterBunkerObjective) )
		CheatBunkerIntroQuest.SetObjectiveCompleted(iEnterBunkerObjective)
		CHeatBunkerIntroQuest.setObjectiveDisplayed(iReadManualObjective)
	endif
EndEvent
