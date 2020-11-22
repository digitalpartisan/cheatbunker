Scriptname CheatBunker:Dependencies:Spawning extends Quest Const

ObjectReference Property SpawnContainer Auto Const Mandatory
Message Property CheatBunkerGenericItemSpawnMessage Auto Const Mandatory
Message Property CheatBunkerRemoteLoadingFailureMessage Auto Const Mandatory
Furniture Property PowerArmorFrameFurnitureNoCore Auto Const Mandatory
Ammo Property AmmoFusionCore Auto Const Mandatory

CheatBunker:Dependencies:Spawning Function getInstance() Global
	return Game.GetFormFromFile(0x000029A7, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:Spawning
EndFunction

ObjectReference Function getContainerReference()
	return SpawnContainer
EndFunction

Function showGenericSuccessMessage()
	CheatBunkerGenericItemSpawnMessage.Show()
EndFunction

Function showRemoteLoadingFailureMessage()
	CheatBunkerRemoteLoadingFailureMessage.Show()
EndFunction

Furniture Function getPowerArmorFrame()
	return PowerArmorFrameFurnitureNoCore
EndFunction

Ammo Function getFusionCore()
	return AmmoFusionCore
EndFunction

Function spawn(Form fItem, Int iAmount = 1)
	fItem && getContainerReference().AddItem(fItem, iAmount)
EndFunction

Function spawnList(FormList flItems)
	if (!flItems || !flItems.GetSize())
		return
	endif

	Int iCounter = 0
	Int iSize = flItems.GetSize()
	while (iCounter < iSize)
		spawn(flItems.GetAt(iCounter))
		iCounter += 1
	endWhile
EndFunction
