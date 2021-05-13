Scriptname CheatBunker:CollectibleTracker:Paginator extends DynamicTerminal:Paginator Conditional

CheatBunker:CollectibleTracker:Handler Property CheatBunkerCollectibleTrackerHandler Auto Const
{autofill}

function itemActivation(Int iItem, ObjectReference akTerminalRef)
	CheatBunkerCollectibleTrackerHandler.setTracker(getItem(iItem) as CheatBunker:CollectibleTracker:Quest)
	CheatBunkerCollectibleTrackerHandler.draw(akTerminalRef)
endfunction

form function getItemReplacementValue(Form rawItem)
	CheatBunker:CollectibleTracker:Quest tracker = rawItem as CheatBunker:CollectibleTracker:Quest
	if (tracker)
		return tracker.getDisplayName()
	endif

	return rawItem
endfunction
