scriptname CheatBunker:CollectibleTracker:Quest extends Quest

int property ObjectiveCount = 1 Auto Const
message property Name Auto Const Mandatory
message property Notes Auto Const Mandatory

message function getDisplayName()
	return Name
endfunction

message function getNotes()
	return Notes
endfunction

bool function isTracking()
	return IsRunning() || IsStarting()
endfunction

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

function track()

endfunction

function stopTracking()

endfunction

auto state NotTracking
	event OnBeginState(string asOldState)
		SetActive(false)
		displayObjectives(false)
	endevent

	event OnQuestInit()
		GoToState("Tracking")
	endevent
endstate

state Tracking
	event OnBeginState(string asOldState)
		displayObjectives()
		SetActive(true)
	endevent

	event OnQuestShutdown()
		GoToState("NotTracking")
	endevent
endstate

function startBulk(formlist trackers) global
	if (!trackers || !trackers.GetSize())
		return
	endif

	int iSize = trackers.GetSize()
	int iCounter = 0
	CheatBunker:CollectibleTracker:Quest tracker = none
	while (iCounter < iSize)
		tracker = trackers.GetAt(iCounter) as CheatBunker:CollectibleTracker:Quest
		tracker && !tracker.isTracking() && tracker.Start()
		iCounter += 1
	endwhile
endfunction

function stopBulk(formlist trackers) global
	if (!trackers || !trackers.GetSize())
		return
	endif

	int iSize = trackers.GetSize()
	int iCounter = 0
	CheatBunker:CollectibleTracker:Quest tracker = none
	while (iCounter < iSize)
		tracker = trackers.GetAt(iCounter) as CheatBunker:CollectibleTracker:Quest
		tracker && tracker.isTracking() && tracker.Stop()
		iCounter += 1
	endwhile
endfunction
