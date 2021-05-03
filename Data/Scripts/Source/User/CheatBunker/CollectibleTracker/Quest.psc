scriptname CheatBunker:CollectibleTracker:Quest extends Quest

int property ObjectiveCount Auto Const Mandatory

function displayObjectives(bool bDisplay = true)
	if (!ObjectiveCount || 0 > ObjectiveCount)
		return
	endif

	int iCounter = 0
	while (iCounter < ObjectiveCount)
		SetObjectiveDisplayed(iCounter, bDisplay, bDisplay)
		iCounter += 1
	endwhile
endfunction

event OnQuestInit()
	displayObjectives()
endevent

event OnQuestShutdown()
	displayObjectives(false)
endevent
