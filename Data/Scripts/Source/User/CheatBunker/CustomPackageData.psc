Scriptname CheatBunker:CustomPackageData extends Chronicle:Package:CustomData Conditional

Bool bAutocompletionsAutofire = false Conditional
	
Bool Function autofireAutocompletions()
	return bAutocompletionsAutofire
EndFunction

Function activateAutofireAutocompletions()
	bAutocompletionsAutofire = true
EndFunction

Function deactivateAutofireAutocompletions()
	bAutocompletionsAutofire = false
EndFunction
