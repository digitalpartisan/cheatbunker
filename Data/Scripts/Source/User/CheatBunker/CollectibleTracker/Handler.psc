scriptname CheatBunker:CollectibleTracker:Handler extends DynamicTerminal:Basic conditional

Bool bIsValid = false Conditional
Bool bIsTracking = false Conditional
CheatBunker:CollectibleTracker:Quest myTracker = None

Bool function isValid()
	return bIsValid
endfunction

bool function isTracking()
	return bIsTracking
endfunction

CheatBunker:CollectibleTracker:Quest function getTracker()
	return myTracker
endfunction

function setTracker(CheatBunker:CollectibleTracker:Quest newValue)
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
	
	CheatBunker:CollectibleTracker:Quest tracker = getTracker()
	replace("TrackerName", tracker.getDisplayName())
	replace("TrackerNotes", tracker.getNotes())
endfunction

function track(ObjectReference akTerminalRef)
	if (!isValid() || isTracking())
		return
	endif

	getTracker().Start()
	checkState()
	draw(akTerminalRef)
endfunction

function stopTracking(ObjectReference akTerminalRef)
	if (!isValid() || !isTracking())
		return
	endif

	getTracker().Stop()
	checkState()
	draw(akTerminalRef)
endfunction
