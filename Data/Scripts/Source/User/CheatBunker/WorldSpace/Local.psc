Scriptname CheatBunker:WorldSpace:Local extends CheatBunker:WorldSpace Conditional

ObjectReference Property Button Auto Const Mandatory

ObjectReference Function getButton()
    return Button
EndFunction

Function shutdownLogic()
    getButton().Disable()
EndFunction

Function startupLogic()
    goToActivated()
EndFunction

Function activateLogic()
    getButton().Enable()
EndFunction

Function transitTo()
    CheatBunker:Dependencies:General.getInstance().getTransitQuest().transitToMarker(getButton())
EndFunction
