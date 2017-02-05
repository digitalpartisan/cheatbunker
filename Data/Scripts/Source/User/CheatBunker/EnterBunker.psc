Scriptname CheatBunker:EnterBunker extends ReferenceAlias Conditional

CheatBunker:IntroQuest Property CheatBunkerIntroQuest Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	CheatBunkerIntroQuest.locationChangeHandler(akOldLoc, akNewLoc)
EndEvent
