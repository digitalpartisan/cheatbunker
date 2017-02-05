Scriptname CheatBunker:IntroQuest extends Quest

Quest Property CheatBunkerIntroQuest Auto Const Mandatory
Int Property EnterObjectiveID = 10 Auto Const
Int Property ReadObjectiveID = 15 Auto Const

Location Property CheatBunkerLocation Auto Const Mandatory

Quest Property CheatBunkerHolotapeQuest Auto Const Mandatory

Event OnQuestInit()
	Debug.Trace("[CheatBunker][IntroQuest] starting up")
	CheatBunkerIntroQuest.SetObjectiveDisplayed(EnterObjectiveID)
	CheatBunkerIntroQuest.SetActive()
EndEvent

Event OnQuestShutdown()
	Debug.Trace("[CheatBunker][IntroQuest] shutting down")
EndEvent

Function manualWasOpened()
{This isn't an event listener because the Terminal.OnmenuItemRun event isn't an event that object references respond to, so we can't listen for the manual option.  Great! :( }
	if (CheatBunkerIntroQuest.isCompleted())
		return
	endif

	CheatBunkerHolotapeQuest.Start()
	CheatBunkerIntroQuest.CompleteAllObjectives()
	CheatBunkerIntroQuest.CompleteQuest()
EndFunction

Function locationChangeHandler(Location akOldLoc, Location akNewLoc)
	if (CheatBunkerIntroQuest.isCompleted()) ; this shouldn't be possible since this is likely called from an alias on this same quest which won't receive events when the quest is done, but safety never hurt anyone
		return
	endif

	if (akNewLoc == CheatBunkerLocation && CheatBunkerIntroQuest.IsObjectiveDisplayed(EnterObjectiveID))
		CheatBunkerIntroQuest.SetObjectiveCompleted(EnterObjectiveID)
		CheatBunkerIntroQuest.SetObjectiveDisplayed(ReadObjectiveID)
	endif
EndFunction
