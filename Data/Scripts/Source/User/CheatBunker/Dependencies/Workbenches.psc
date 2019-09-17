Scriptname CheatBunker:Dependencies:Workbenches extends Quest Const

ObjectReference Property CookingWorkbench Auto Const Mandatory
ObjectReference Property ChemistryWorkbench Auto Const Mandatory

ObjectReference Property WeaponsmithWorkbench Auto Const Mandatory
ObjectReference Property WeaponsWorkbench Auto Const Mandatory
ObjectReference Property AmmunitionWorkbench Auto Const Mandatory

ObjectReference Property ArmorsmithWorkbench Auto Const Mandatory
ObjectReference Property ArmorWorkbench Auto Const Mandatory

ObjectReference Property PAWorkbench Auto Const Mandatory

ObjectReference Property WorkshopContainer Auto Const Mandatory

CheatBunker:Dependencies:Workbenches Function getInstance() Global
	return Game.GetFormFromFile(0x000029A6, CheatBunker:Dependencies:General.getPluginFilename()) as CheatBunker:Dependencies:Workbenches
EndFunction

ObjectReference Function getPowerArmorWorkbenchReference()
	return PAWorkbench
EndFunction

ObjectReference[] Function getWorkbenchReferences()
	ObjectReference[] workbenches = new ObjectReference[0]
	workbenches.Add(CookingWorkbench)
	workbenches.Add(ChemistryWorkbench)
	workbenches.Add(WeaponsmithWorkbench)
	workbenches.Add(WeaponsWorkbench)
	workbenches.Add(AmmunitionWorkbench)
	workbenches.Add(ArmorsmithWorkbench)
	workbenches.Add(ArmorWorkbench)
	workbenches.Add(PAWorkbench)
	return workbenches
EndFunction

Event Actor.OnGetUp(Actor sender, ObjectReference akFurnitureRef)
	if (Game.GetPlayer() != sender)
		return
	endif
	
	if (getWorkbenchReferences().Find(akFurnitureRef) >= 0)
		WorkshopContainer.Reset()
	endif
EndEvent

Event OnQuestInit()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnGetUp")
EndEvent

Event OnQuestShutdown()
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnGetUp")
EndEvent
