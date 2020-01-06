Scriptname CheatBunker:Setting:Diagnostics extends DynamicTerminal:Basic Conditional

CheatBunker:Setting mySetting = None

Bool bIsValid = false Conditional
Bool bIsActivated = false Conditional

CheatBunker:Setting Function getSetting()
    return mySetting
EndFunction

Function setSetting(CheatBunker:Setting newSetting, ObjectReference akTerminalRef)
    mySetting = newSetting
    bIsValid = (None != getSetting())
	bIsActivated = isValid() && getSetting().isActivated()

	draw(akTerminalRef)
EndFunction

Bool Function isValid()
    return bIsValid
EndFunction

Bool Function isActivated()
    return bIsActivated
EndFunction

Function activate(ObjectReference akTerminalRef)
    if (isValid() && !getSetting().isActivated())
        getSetting().Start()
		bIsActivated = true ; work around a timing / rendering bug with rewriting the diagnostics terminal and conditional variables
        draw(akTerminalRef)
    endif
EndFunction

Function deactivate(ObjectReference akTerminalRef)
    if (isValid() && getSetting().isActivated())
        getSetting().Stop()
		bIsActivated = false ; work around a timing / rendering bug with rewriting the diagnostics terminal and conditional variables
        draw(akTerminalRef)
    endif
EndFunction

Function tokenReplacementLogic()
    if (isValid())
		replace("SettingObject", getSetting())
		replace("SettingExplanation", getSetting().getExplanation())
	else
		replace("SettingObject", None)
        replace("SettingExplanation", None)
	endif
EndFunction
