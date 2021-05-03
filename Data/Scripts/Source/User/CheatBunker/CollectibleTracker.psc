scriptname CheatBunker:CollectibleTracker extends Quest

CheatBunker:CollectibleTracker:Quest property MyQuest Auto Const Mandatory
message property Notes Auto Const Mandatory

message function getNotes()
	return Notes
endfunction

bool function isTracking()
	return false
endfunction

function track()

endfunction

function stopTracking()

endfunction

auto state NotTracking
	event OnBeginState(string asOldState)
		MyQuest.Stop()
	endevent

	function track()
		GoToState("Tracking")
	endfunction
endstate

state Tracking
	event OnBeginState(string asOldState)
		MyQuest.Start()
	endevent

	bool function isTracking()
		return IsRunning() || IsStarting()
	endfunction

	function stopTracking()
		GoToState("NotTracking")
	endfunction
endstate

function startBulk(formlist trackers) global
	if (!trackers || !trackers.GetSize())
		return
	endif

	int iSize = trackers.GetSize()
	int iCounter = 0
	CheatBunker:CollectibleTracker tracker = none
	while (iCounter < iSize)
		tracker = trackers.GetAt(iCounter) as CheatBunker:CollectibleTracker
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
	CheatBunker:CollectibleTracker tracker = none
	while (iCounter < iSize)
		tracker = trackers.GetAt(iCounter) as CheatBunker:CollectibleTracker
		tracker && tracker.isTracking() && tracker.Stop()
		iCounter += 1
	endwhile
endfunction
