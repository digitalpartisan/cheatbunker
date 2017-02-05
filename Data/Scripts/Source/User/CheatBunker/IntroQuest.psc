Scriptname CheatBunker:IntroQuest extends Quest

Quest Property CheatBunkerIntroQuest Auto Const Mandatory
Quest Property CheatBunkerHolotapeQuest Auto Const Mandatory

Function manualWasOpened()
{This isn't an event listener because the Terminal.OnmenuItemRun event isn't an event that object references respond to, so we can't listen for the manual option.  Great! :( }
	if (CheatBunkerIntroQuest.isCompleted())
		return
	endif

	CheatBunkerHolotapeQuest.Start()
	CheatBunkerIntroQuest.CompleteAllObjectives()
	CheatBunkerIntroQuest.CompleteQuest()
EndFunction
