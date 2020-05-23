Scriptname CheatBunker:WorkbenchModifier extends Spawny:Modifier

ObjectReference Property CheatBunkerWorkshopStorageReference Auto Const Mandatory
Keyword Property WorkshopContainerKeyword Auto Const Mandatory
Keyword Property WorkshopItemKeyword Auto Const Mandatory

Bool Function apply(ObjectReference akTargetRef)
	Bool bParentResult = parent.apply(akTargetRef)
	
	if (akTargetRef)
		akTargetRef.SetLinkedRef(CheatBunkerWorkshopStorageReference, WorkshopContainerKeyword)
		akTargetRef.SetLinkedRef(CheatBunkerWorkshopStorageReference, WorkshopItemKeyword)
	endif
	
	return bParentResult
EndFunction
