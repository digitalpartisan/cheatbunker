Scriptname CheatBunker:ItemGenerator extends Quest

Form Property fItem Auto Const
ObjectMod Property SpecialMod = None Auto Const
ObjectMod[] Property Mods Auto Const
Bool Property bInContainer = false Auto Const

ObjectReference Function getInstance(ObjectReference akTarget = None)
{Separate in case it needs to be overriden so that rewriting the entire script isn't required}
	ObjectReference akSpawnAt = akTarget
	if (akSpawnAt == None)
		akSpawnAt = Game.GetPlayer() as ObjectReference
	endif

	return akSpawnAt.PlaceAtMe(fItem)
EndFunction

Function attachMods(ObjectReference akInstance)
{Separate in case it needs to be overriden so that rewriting the entire script isn't required}
	Int iCounter = 0
	While (iCounter < Mods.Length)
		akInstance.AttachMod(Mods[iCounter])
		iCounter += 1
	EndWhile
EndFunction

Function attachSpecialMod(ObjectReference akInstance)
{Separate in case it needs to be overriden so that rewriting the entire script isn't required}
	if (SpecialMod != None)
		akInstance.AttachMod(SpecialMod)
	endif
EndFunction

Function generate(ObjectReference akTarget = None, Bool bForceInContainer = false)
	ObjectReference akInstance = getInstance(akTarget)
	attachMods(akInstance)
	attachSpecialMod(akInstance)

	if (bForceInContainer || bInContainer)
		akTarget.addItem(akInstance)
	endif
EndFunction
