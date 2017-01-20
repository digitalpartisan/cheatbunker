Scriptname CheatBunker:TeleportAliasScript extends ReferenceAlias Conditional

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;Debug.Trace("[CheatBunker][TeleportAlias] old: " + akOldLoc + " new: " + akNewLoc)
	(GetOwningQuest() as CheatBunker:TransitScript).locationChangeHandler(akOldLoc, akNewLoc)
EndEvent