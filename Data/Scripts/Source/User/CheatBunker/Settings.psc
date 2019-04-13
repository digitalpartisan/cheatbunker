Scriptname CheatBunker:Settings extends Quest Conditional

Bool bPreloadInterior = false Conditional

Bool Function getPreloadInterior()
	return bPreloadInterior
EndFunction

Bool Function preloadInterior(Bool bValue = false)
	bPreloadInterior = bValue
EndFunction

Bool bAggressiveAutocompletionNotification = false Conditional

Bool Function getAggressiveAutocompletionNotification()
	return bAggressiveAutocompletionNotification
EndFunction

Bool Function aggressiveAutocompletionNotification(Bool bValue = false) 
	bAggressiveAutocompletionNotification = bValue
EndFunction
