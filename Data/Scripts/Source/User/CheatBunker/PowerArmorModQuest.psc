Scriptname CheatBunker:PowerArmorModQuest extends DynamicTerminal:Builder:Menu Conditional

Int Property iArmorID = 0 Auto Const
Int Property iHelmetID = 1 Auto Const
Int Property iHeadlampID = 2 Auto Const
Int Property iTorsoID = 3 Auto Const
Int Property iArmsID = 4 Auto Const
Int Property iLegsID = 5 Auto Const

Bool bHasArmor = false Conditional
Bool bHasHelmet = false Conditional
Bool bHasHeadlamp = false Conditional
Bool bHasTorso = false Conditional
Bool bHasArms = false Conditional
Bool bHasLegs = false Conditional

Function clearState()
	parent.clearState()

	bHasArmor = false
	bHasHelmet = false
	bHasHeadlamp = false
	bHasTorso = false
	bHasArms = false
	bHasLegs = false
EndFunction

Function updateLogic()
	if (!bHasArmor && getComponent(iArmorID).isComplete())
		bHasArmor = true
		CheatBunker:PowerArmorOption:Abstract armorOption = getComponent(iArmorID).getValue() as CheatBunker:PowerArmorOption:Abstract
		getComponent(iHelmetID).setOptions(armorOption.HelmetMods)
		getComponent(iHeadlampID).setOptions(armorOption.HeadlampMods)
		getComponent(iTorsoID).setOptions(armorOption.TorsoMods)
		getComponent(iArmsID).setOptions(armorOption.ArmMods)
		getComponent(iLegsID).setOptions(armorOption.LegMods)
	endif

	bHasHelmet = bHasHelmet || getComponent(iHelmetID).isComplete()
	bHasHeadlamp = bHasHeadlamp || getComponent(iHeadlampID).isComplete()
	bHasTorso = bHasTorso || getComponent(iTorsoID).isComplete()
	bHasArms = bHasArms || getComponent(iArmsID).isComplete()
	bHasLegs = bHasLegs || getComponent(iLegsID).isComplete()
EndFunction

Function calculateCanBuild()
	setCanBuild(bHasArmor && bHasHelmet && bHasHeadlamp && bHasTorso && bHasArms && bHasLegs)
EndFunction

Function spawnComponent(Int iComponentID, Int iAmount = 1)
	CheatBunker:Dependencies:Spawning.getInstance().getContainerReference().AddItem(getComponent(iComponentID).getValue(), iAmount)
EndFunction

Function buildLogic()
	spawnComponent(iHelmetID)
	spawnComponent(iHeadlampID)
	spawnComponent(iTorsoID)
	spawnComponent(iArmsID, 2)
	spawnComponent(iLegsID, 2)

	CheatBunker:Dependencies:Spawning.getInstance().showGenericSuccessMessage()
EndFunction
