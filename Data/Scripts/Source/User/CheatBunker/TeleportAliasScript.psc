Scriptname CheatBunker:TeleportAliasScript extends ReferenceAlias Conditional

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	CheatBunkerTransitQuest.locationChangeHandler(akOldLoc, akNewLoc)
EndEvent

CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const
