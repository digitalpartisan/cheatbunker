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

Function setComponentOptions(Int iComponentID, FormList options)
	DynamicTerminal:Builder:Component target = getComponent(iComponentID)
	(target.getOptions() as DynamicTerminal:ListWrapper:FormList:Dynamic).setData(options)
	target.examineOptions()
EndFunction

Function updateLogic()
	if (!bHasArmor && getComponent(iArmorID).isComplete())
		bHasArmor = true
		CheatBunker:PowerArmorOption:Abstract armorOption = getComponent(iArmorID).getValue() as CheatBunker:PowerArmorOption:Abstract
		setComponentOptions(iHelmetID, armorOption.HelmetMods)
		setComponentOptions(iHeadlampID, armorOption.HeadlampMods)
		setComponentOptions(iTorsoID, armorOption.TorsoMods)
		setComponentOptions(iArmsID, armorOption.ArmMods)
		setComponentOptions(iLegsID, armorOption.LegMods)
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
	CheatBunker:Dependencies:Spawning.getInstance().spawn(getComponent(iComponentID).getValue(), iAmount)
EndFunction

Function buildLogic()
	spawnComponent(iHelmetID)
	spawnComponent(iHeadlampID)
	spawnComponent(iTorsoID)
	spawnComponent(iArmsID, 2)
	spawnComponent(iLegsID, 2)

	CheatBunker:Dependencies:Spawning.getInstance().showGenericSuccessMessage()
EndFunction
