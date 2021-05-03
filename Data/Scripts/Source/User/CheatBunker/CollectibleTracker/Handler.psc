scriptname CheatBunker:CollectibleTracker:Handler extends DynamicTerminal:Basic conditional

Bool bIsValid = false Conditional
Bool bIsTracking = false Conditional
CheatBunker:CollectibleTracker myTracker = None

Bool function isValid()
	return bIsValid
endfunction

bool function isTracking()
	return bIsTracking
endfunction

CheatBunker:CollectibleTracker function getTracker()
	return myTracker
endfunction

function setBuild(CheatBunker:CollectibleTracker newValue)
	myTracker = newValue
	checkState()
endfunction

function checkState()
	bIsTracking = false
	bIsValid = (None != getTracker())
	
	if (isValid())
		bIsTracking = getTracker().isTracking()
	endif
endfunction

function tokenReplacementLogic()
	checkState()

	if (!isValid())
		return
	endif
	
	CheatBunker:CollectibleTracker tracker = getTracker()
	replace("TrackerObject", tracker)
	replace("TrackerNotes", tracker.getNotes())
endfunction

function track(ObjectReference akTerminalRef)
	if (!isValid() || isTracking())
		return
	endif

	getTracker().track()
	checkState()
	draw(akTerminalRef)
endfunction

function stopTracking(ObjectReference akTerminalRef)
	if (!isValid() || !isTracking())
		return
	endif

	getTracker().stopTracking()
	checkState()
	draw(akTerminalRef)
endfunction
