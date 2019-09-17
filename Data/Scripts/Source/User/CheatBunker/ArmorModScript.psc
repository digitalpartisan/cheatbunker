Scriptname CheatBunker:ArmorModScript extends DynamicTerminal:Builder:Menu Conditional

Int Property iArmorID = 0 Auto Const
Int Property iHelmetID = 1 Auto Const
Int Property iTorsoID=  2 Auto Const
Int Property iArmsID = 3 Auto Const
Int Property iLegsID = 4 Auto Const

Bool bHasArmor = false Conditional
Bool bHasHelmet = false Conditional
Bool bHasTorso = false Conditional
Bool bHasArms = false Conditional
Bool bHasLegs = false Conditional

Function clearState()
	parent.clearState()

	bHasArmor = false
	bHasHelmet = false
	bHasTorso = false
	bHasArms = false
	bHasLegs = false
EndFunction

Function updateLogic()
	if (!bHasArmor && getComponent(iArmorID).isComplete())
		bHasArmor = true

		CheatBunker:ArmorSet armorSet = getComponent(iArmorID).getValue() as CheatBunker:ArmorSet

		getComponent(iHelmetID).setOptions(armorSet.HelmetMods)
		getComponent(iTorsoID).setOptions(armorSet.TorsoMods)
		getComponent(iArmsID).setOptions(armorSet.ArmMods)
		getComponent(iLegsID).setOptions(armorSet.LegMods)
	endif

	bHasHelmet = bHasHelmet || ( !bHasHelmet && getComponent(iHelmetID).isComplete() )
	bHasTorso = bHasTorso || ( !bHasTorso && getComponent(iTorsoID).isComplete() )
	bHasArms = bHasArms || ( !bHasArms && getComponent(iArmsID).isComplete() )
	bHasLegs = bHasLegs || ( !bHasLegs && getComponent(iLegsID).isComplete() )
EndFunction

Function calculateCanBuild()
	setCanBuild(bHasArmor && bHasHelmet && bHasTorso && bHasArms && bHasLegs)
EndFunction

Function spawnComponent(Int iComponentID, Int iAmount = 1)
	CheatBunker:Dependencies:Spawning.getInstance().getContainerReference().AddItem(getComponent(iComponentID).getValue(), iAmount)
EndFunction

Function buildLogic()
	spawnComponent(iHelmetID)
	spawnComponent(iTorsoID)
	spawnComponent(iArmsID, 2)
	spawnComponent(iLegsID, 2)

	CheatBunker:Dependencies:Spawning.getInstance().showGenericSuccessMessage()
EndFunction
