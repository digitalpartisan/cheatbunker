Scriptname CheatBunker:TeleportAliasScript extends ReferenceAlias Conditional

CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	CheatBunkerTransitQuest.locationChangeHandler(akOldLoc, akNewLoc)
EndEvent
