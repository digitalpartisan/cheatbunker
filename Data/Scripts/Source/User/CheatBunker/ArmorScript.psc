Scriptname CheatBunker:ArmorScript extends DynamicTerminal:Builder:Menu Conditional

ObjectMod Property CheaterMod Auto Const

Int Property iArmorID = 0 Auto Const
Int Property iSizeID = 1 Auto Const
Int Property iMaterialID = 2 Auto Const
Int Property iHelmetID = 3 Auto Const
Int Property iTorsoID = 4 Auto Const
Int Property iArmsID = 5 Auto Const
Int Property iLegsID = 6 Auto Const

Bool bHasArmor = false Conditional
Bool bHasSize = false Conditional
Bool bHasMaterial = false Conditional
Bool bHasHelmet = false Conditional
Bool bHasTorso = false Conditional
Bool bHasArms = false Conditional
Bool bHasLegs =  false Conditional

Function clearState()
	parent.clearState()

	bHasArmor = false
	bHasSize = false
	bHasMaterial = false
	bHasHelmet = false
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
		CheatBunker:ArmorSet armorSet = getComponent(iArmorID).getValue() as CheatBunker:ArmorSet
		setComponentOptions(iSizeID, armorSet.Sizes)
		setComponentOptions(iMaterialID, armorSet.Materials)
		setComponentOptions(iHelmetID, armorSet.Helmets)
		setComponentOptions(iTorsoID, armorSet.Torsos)
		setComponentOptions(iArmsID, armorSet.Arms)
		setComponentOptions(iLegsID, armorSet.Legs)
	endif

	bHasSize = bHasSize || getComponent(iSizeID).isComplete()
	bHasMaterial = bHasMaterial || getComponent(iMaterialID).isComplete()
	bHasHelmet = bHasHelmet || getComponent(iHelmetID).isComplete()
	bHasTorso = bHasTorso || getComponent(iTorsoID).isComplete()
	bHasArms = bHasArms || getComponent(iArmsID).isComplete()
	bHasLegs = bHasLegs || getComponent(iLegsID).isComplete()
EndFunction

Function calculateCanBuild()
	setCanBuild(bHasArmor && bHasSize && bHasMaterial && bHasHelmet && bHasTorso && bHasArms && bHasLegs)
EndFunction

Function spawnItem(Armor aItem = None, ObjectMod size = None, ObjectMod material = None)
	if (aItem == None)
		return
	endif

	ObjectReference spawnItemsContainer = CheatBunker:Dependencies:Spawning.getInstance().getContainerReference()
	ObjectReference akInstance = spawnItemsContainer.PlaceAtMe(aItem)
	if (size != None)
		akInstance.AttachMod(size)
	endif
	if (material != None)
		akInstance.AttachMod(material)
	endif
	akInstance.AttachMod(CheaterMod)
	spawnItemsContainer.AddItem(akInstance)
EndFunction

Function spawnHelmet(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	ObjectMod omMaterial = None
	if (material && material.Helmet)
		omMaterial = material.Helmet
	endif
	
	spawnItem(getComponent(iHelmetID).getValue() as Armor, None, omMaterial)
EndFunction

Function spawnTorso(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	ObjectMod omSize = None
	if (size && size.Arm)
		omSize = size.Arm
	endif
	
	ObjectMod omMaterial = None
	if (material && material.Torso)
		omMaterial = material.Torso
	endif
	
	spawnItem(getComponent(iTorsoID).getValue() as Armor, omSize, omMaterial)
EndFunction

Function spawnArms(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	CheatBunker:ArmorLimbs arms = getComponent(iArmsID).getValue() as CheatBunker:ArmorLimbs
	if (!arms)
		return
	endif
	
	ObjectMod omSize = None
	if (size && size.Arm)
		omSize = size.Arm
	endif
	
	ObjectMod omMaterial = None
	if (material && material.Arm)
		omMaterial = material.Arm
	endif
	
	spawnItem(arms.Left, omSize, omMaterial)
	spawnItem(arms.Right, omSize, omMaterial)
EndFunction

Function spawnLegs(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	CheatBunker:ArmorLimbs legs = getComponent(iLegsID).getValue() as CheatBunker:ArmorLimbs
	if (!legs)
		return
	endif
	
	ObjectMod omSize = None
	if (size && size.Leg)
		omSize = size.Leg
	endif
	
	ObjectMod omMaterial = None
	if (material && material.Leg)
		omMaterial = material.Leg
	endif
	
	spawnItem(legs.Left, omSize, omMaterial)
	spawnItem(legs.Right, omSize, omMaterial)
EndFunction

Function buildLogic()
	CheatBunker:ArmorSize size = getComponent(iSizeID).getValue() as CheatBunker:ArmorSize
	CheatBunker:ArmorMaterial material = getComponent(iMaterialID).getValue() as CheatBunker:ArmorMaterial

	spawnHelmet(size, material)
	spawnTorso(size, material)
	spawnArms(size, material)
	spawnLegs(size, material)

	CheatBunker:Dependencies:Spawning.getInstance().showGenericSuccessMessage()
EndFunction
