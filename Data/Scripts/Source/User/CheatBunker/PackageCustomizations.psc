Scriptname CheatBunker:PackageCustomizations extends Chronicle:Package:CustomBehavior

Group AccessSettings
	ObjectReference Property ExteriorDoor Auto Const
	ObjectReference Property InteriorDoor Auto Const
EndGroup

Bool Function uninstallBehavior()
	if (ExteriorDoor)
		ExteriorDoor.disable()
	endif
	
	if (InteriorDoor)
		InteriorDoor.disable()
	endif
	
	return true
EndFunction
