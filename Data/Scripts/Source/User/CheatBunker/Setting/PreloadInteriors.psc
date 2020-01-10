Scriptname CheatBunker:Setting:PreloadInteriors extends CheatBunker:Setting Conditional

Cell Property CheatBunkerInterior Auto Const Mandatory
{Autofill.}
ObjectReference Property BunkerEntranceDoor Auto Const Mandatory
{Trapdoor outside Vault 111 to Cheat Bunker interior.}

Function logPreloading(String asDetails) DebugOnly
    CheatBunker:Logger:Settings.log(self + " is preloading, " + asDetails)
EndFunction

Function forcePreloadCell()
	if (CheatBunkerInterior.IsAttached()) ; player is in the bunker, cell is loaded, do nothing
        logPreloading("already attached")
        return
	endif

	if (CheatBunkerInterior.IsLoaded()) ; once again, do nothing since it's needless work
	    logPreloading("already loaded")
		return
	endif

    logPreloading("not loaded or attached, forcing preload")
	BunkerEntranceDoor.PreloadTargetArea()
EndFunction

Function startupLogic()
    forcePreloadCell()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
EndFunction

Function shutdownLogic()
    UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
EndFunction

Function loadLogic()
    forcePreloadCell()
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    if (Game.GetPlayer() == akSender)
        forcePreloadCell()
    endif
EndEvent
