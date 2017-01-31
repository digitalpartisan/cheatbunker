Scriptname CheatBunker:ArmorScript extends DynamicTerminal:Builder:Menu Conditional

ObjectMod Property CheaterMod Auto Const
CheatBunker:QuestScript Property CheatBunkerQuest Auto Const
Message Property CheatBunkerGenericItemSpawnMessage Auto Const

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

Function updateLogic()
	if (!bHasArmor && getComponent(iArmorID).isComplete())
		bHasArmor = true
		CheatBunker:ArmorSet armorSet = getComponent(iArmorID).getValue() as CheatBunker:ArmorSet
		getComponent(iSizeID).setOptions(armorSet.Sizes)
		getComponent(iMaterialID).setOptions(armorSet.Materials)
		getComponent(iHelmetID).setOptions(armorSet.Helmets)
		getComponent(iTorsoID).setOptions(armorSet.Torsos)
		getComponent(iArmsID).setOptions(armorSet.Arms)
		getComponent(iLegsID).setOptions(armorSet.Legs)
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

	ObjectReference akInstance = CheatBunkerQuest.SpawnItemsContainer.PlaceAtMe(aItem)
	if (size != None)
		akInstance.AttachMod(size)
	endif
	if (material != None)
		akInstance.AttachMod(material)
	endif
	akInstance.AttachMod(CheaterMod)
	CheatBunkerQuest.SpawnItemsContainer.AddItem(akInstance)
EndFunction

Function spawnHelmet(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	ObjectMod omMaterial = None
	if (material != None)
		if (material.Helmet != None)
			omMaterial = material.Helmet
		endif
	endif
	
	spawnItem(getComponent(iHelmetID).getValue() as Armor, None, omMaterial)
EndFunction

Function spawnTorso(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	ObjectMod omMaterial = None
	if (material != None)
		if (material.Torso != None)
			omMaterial = material.Torso
		endif
	endif
	
	spawnItem(getComponent(iTorsoID).getValue() as Armor, size.Torso, omMaterial)
EndFunction

Function spawnArms(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	CheatBunker:ArmorLimbs arms = getComponent(iArmsID).getValue() as CheatBunker:ArmorLimbs
	ObjectMod omSize = None
	if (size != None)
		if (size.Arm != None)
			omSize = size.Arm
		endif
	endif
	ObjectMod omMaterial = None
	if (material != None)
		if (material.Arm != None)
			omMaterial = material.Arm
		endif
	endif
	
	spawnItem(arms.Left, omSize, omMaterial)
	spawnItem(arms.Right, omSize, omMaterial)
EndFunction

Function spawnLegs(CheatBunker:ArmorSize size = None, CheatBunker:ArmorMaterial material = None)
	CheatBunker:ArmorLimbs legs = getComponent(iLegsID).getValue() as CheatBunker:ArmorLimbs
	ObjectMod omSize = None
	if (size != None)
		if (size.Leg != None)
			omSize = size.Leg
		endif
	endif
	ObjectMod omMaterial = None
	if (material != None)
		if (material.Leg != None)
			omMaterial = material.Leg
		endif
	endif
	
	spawnItem(legs.Left, omSize, omMaterial)
	spawnItem(legs.Right, omSize, omMaterial)
EndFunction

Function buildLogic()
	DynamicTerminal:Builder:Component sizeComponent = getComponent(iSizeID)
	CheatBunker:ArmorSize size = None
	if (sizeComponent.isAvailable())
		size = sizeComponent.getValue() as CheatBunker:ArmorSize
	endif

	DynamicTerminal:Builder:Component materialComponent = getComponent(iMaterialID)
	CheatBunker:ArmorMaterial material = None
	if (materialComponent.isAvailable())
		material = materialComponent.getValue() as CheatBunker:ArmorMaterial
	endif

	spawnHelmet(size, material)
	spawnTorso(size, material)
	spawnArms(size, material)
	spawnLegs(size, material)

	CheatBunkerGenericItemSpawnMessage.Show()
EndFunction
