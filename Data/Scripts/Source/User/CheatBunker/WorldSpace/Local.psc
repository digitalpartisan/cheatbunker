Scriptname CheatBunker:WorldSpace:Local extends CheatBunker:WorldSpace Conditional

ObjectReference Property Button Auto Const Mandatory
ObjectReference Property Marker Auto Const Mandatory

ObjectReference Function getButton()
    return Button
EndFunction

ObjectReference Function getMarker()
    return Marker
EndFunction

Function shutdownLogic()
    getButton().Disable()
    getMarker().Disable()
EndFunction

Function startupLogic()
    goToActivated()
EndFunction

Function activateLogic()
    getButton().Enable()
    getMarker().Enable()
EndFunction

Function transitTo()
    CheatBunker:Dependencies:General.getInstance().getTransitQuest().transitToMarker(getMarker())
EndFunction
