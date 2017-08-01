Scriptname CheatBunker:ItemGenerator:Abstract extends Quest Hidden
{Under a sane scheme, this would be named CheatBunker:ItemGenerator, but the local/remote disctinction wasn't introduced until a few versions after release.  Existing definitions of CheatBuker:ItemGenerator need to remain as they are to prevent a massive re-association job in every related object.}

ObjectMod Property SpecialMod = None Auto Const
Bool Property bInContainer = false Auto Const

Bool Function canLoad()
{Override this functionality in the remote generator script.}
	return true
EndFunction

Function clean()
{Used to clear out loaded remote forms. Override to implement.}
EndFunction

Form Function getForm()
{Override in child scripts according to how the data is accessed.}
	return None
EndFunction

ObjectMod[] Function getMods()
{Override in child scripts according to how the data is accessed.}
	return None
EndFunction

ObjectReference Function getInstance(ObjectReference akTarget = None)
{Separate in case it needs to be overriden so that rewriting the entire script isn't required}
	ObjectReference akSpawnAt = akTarget
	if (akSpawnAt == None)
		akSpawnAt = Game.GetPlayer() as ObjectReference
	endif

	return akSpawnAt.PlaceAtMe(getForm())
EndFunction

Function attachMods(ObjectReference akInstance)
{Separate in case it needs to be overriden so that rewriting the entire script isn't required}
	Int iCounter = 0
	ObjectMod[] ModSet = getMods()
	While (iCounter < ModSet.Length)
		akInstance.AttachMod(ModSet[iCounter])
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
	if (!canLoad())
		return
	endif
	
	ObjectReference akInstance = getInstance(akTarget)
	attachMods(akInstance)
	attachSpecialMod(akInstance)
	
	clean()
	
	if (bForceInContainer || bInContainer)
		akTarget.addItem(akInstance)
	endif
EndFunction
