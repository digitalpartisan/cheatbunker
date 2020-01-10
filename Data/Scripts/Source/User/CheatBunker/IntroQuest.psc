Scriptname CheatBunker:IntroQuest extends Quest

Int Property EnterObjectiveID = 10 Auto Const
Int Property ReadObjectiveID = 15 Auto Const

Location Property CheatBunkerLocation Auto Const Mandatory

Quest Property CheatBunkerHolotapeQuest Auto Const Mandatory

Event OnQuestInit()
	SetObjectiveDisplayed(EnterObjectiveID)
	SetActive()
EndEvent

Function manualWasOpened()
{This isn't an event listener because the Terminal.OnmenuItemRun event isn't an event that object references respond to, so we can't listen for the manual option.}
	if (IsCompleted())
		return
	endif

	CheatBunkerHolotapeQuest.Start()
	CompleteAllObjectives()
	CompleteQuest()
EndFunction

Function locationChangeHandler(Location akOldLoc, Location akNewLoc)
	if (IsCompleted()) ; this shouldn't be possible since this is likely called from an alias on this same quest which won't receive events when the quest is done, but safety never hurt anyone
        return
    endif

    if (akNewLoc == CheatBunkerLocation)
        SetObjectiveCompleted(EnterObjectiveID)
        SetObjectiveDisplayed(ReadObjectiveID)
    else
        SetObjectiveDisplayed(ReadObjectiveID, false)
        SetObjectiveCompleted(EnterObjectiveID, false)
        SetObjectiveDisplayed(EnterObjectiveID)
    endif
EndFunction
