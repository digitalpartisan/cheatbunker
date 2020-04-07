Scriptname CheatBunker:IntroQuest extends Quest

Int Property EnterObjectiveID = 10 Auto Const
Int Property ReadObjectiveID = 15 Auto Const

Location Property CheatBunkerLocation Auto Const Mandatory
ReferenceAlias Property EntranceButton Auto Const Mandatory
CheatBunker:Worldspace Property CheatBunkerPackageBaseWorldspaceCommonwealth Auto Const Mandatory

Quest Property CheatBunkerHolotapeQuest Auto Const Mandatory

Function setEntranceAlias()
	EntranceButton.ForceRefTo(CheatBunkerPackageBaseWorldspaceCommonwealth.getButtonSpawner().getSpawnedReference())
EndFunction

Event OnQuestInit()
	setEntranceAlias()
	SetObjectiveDisplayed(EnterObjectiveID)
	SetActive()
EndEvent

Event OnQuestShutdown()
	UnregisterForCustomEvent(CheatBunkerPackageBaseWorldspaceCommonwealth, "Ready") ; what should happen if an uninstall takes place at just the wrong time
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

Function retrofitEntranceObjective()
{What should happen if the v1.10.0 update runs and this quest is not yet complete.}
	if (!IsRunning())
		return
	endif
	
	RegisterForCustomEvent(CheatBunkerPackageBaseWorldspaceCommonwealth, "Ready")
	CheatBunkerPackageBaseWorldspaceCommonwealth.Start()
EndFunction

Event CheatBunker:Worldspace.Ready(CheatBunker:Worldspace sender, Var[] args)
	if (CheatBunkerPackageBaseWorldspaceCommonwealth != sender) ; paranoia never hurt anyone, right?
		return
	endif
	
	UnregisterForCustomEvent(CheatBunkerPackageBaseWorldspaceCommonwealth, "Ready")
	setEntranceAlias()
EndEvent
