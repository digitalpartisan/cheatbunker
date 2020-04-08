Scriptname CheatBunker:WorldSpace:EntranceButton extends Spawny:ObjectReference

String sMarkerChild = "Marker" Const

ObjectReference Function getMarker()
	return getChildReference(sMarkerChild)
EndFunction
