Scriptname CheatBunker:RacemenuHandler extends Jiffy:RacemenuHandler

ObjectReference Property CheatBunkerRaceMenuMarker Auto Const Mandatory
{Autofill}

Function moveToMarker()
	Game.GetPlayer().MoveTo(CheatBunkerRaceMenuMarker)
EndFunction
