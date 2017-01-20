Scriptname CheatBunker:PowerArmorScript extends DynamicTerminal:Builder:Menu Conditional

ObjectReference Property Workbench Auto Const
Furniture Property PowerArmorFrame Auto Const
Ammo Property FusionCore Auto Const
Message Property mSpawned Auto Const
Message Property mCannotSpawn Auto Const
Keyword Property FurnitureTypePowerArmor Auto Const
Int Property iPowerArmorSearchRadius = 128 Auto Const

Int Property iArmorID = 0 Auto Const
Int Property iMaterialID = 1 Auto Const

Bool bHasArmor = false Conditional
Bool bHasMaterial = false Conditional

Function clearState()
	parent.clearState()

	bHasArmor = false
	bHasMaterial = false
EndFunction

Function updateLogic()
	if (!bHasArmor && getComponent(iArmorID).isComplete())
		bHasArmor = true
		getComponent(iMaterialID).setOptions( (getComponent(iArmorID).getValue() as CheatBunker:PowerArmorOption).MaterialOptions )
	endif

	bHasMaterial = bHasMaterial || getComponent(iMaterialID).isComplete()
EndFunction

Function calculateCanBuild()
	setCanBuild(bHasArmor) ; material not required
EndFunction

CheatBunker:PowerArmorOption Function getArmor()
	return getComponent(iArmorID).getValue() as CheatBunker:PowerArmorOption
EndFunction

ObjectReference Function spawnFrame(Furniture FrameToSpawn)
	ObjectReference[] nearbyPowerArmors = Workbench.FindAllReferencesWithKeyword(FurnitureTypePowerArmor, iPowerArmorSearchRadius)
	if (nearbyPowerArmors.Length > 0)
		mCannotSpawn.Show()
		return None
	endif
	
	ObjectReference frame = Workbench.PlaceAtMe(FrameToSpawn)
	frame.AddItem(FusionCore)
	return frame
EndFunction

Function spawnFrameAtPlayer()
	Game.GetPlayer().PlaceAtMe(PowerArmorFrame).AddItem(FusionCore)
EndFunction

Function applyMod(ObjectReference piece, ObjectMod mod)
	if (mod != None)
		piece.AttachMod(mod)
	endif
EndFunction

Function applyMaterial(ObjectReference piece)
	if (bHasMaterial)
		applyMod(piece, getComponent(iMaterialID).getValue() as ObjectMod)
	endif
EndFunction

Function spawnHelmet(ObjectReference frame)
	CheatBunker:PowerArmorOption selectedArmor = getArmor()
	ObjectReference helmet = frame.PlaceAtMe(selectedArmor.Helmet)
	applyMod(helmet, selectedArmor.HelmetLining)
	applyMaterial(helmet)
	frame.AddItem(helmet)
EndFunction

Function spawnTorso(ObjectReference frame)
	CheatBunker:PowerArmorOption selectedArmor = getArmor()
	ObjectReference torso = frame.PlaceAtMe(selectedArmor.Torso)
	applyMod(torso, selectedArmor.TorsoLining)
	applyMaterial(torso)
	frame.addItem(torso)
EndFunction

Function spawnArm(ObjectReference frame, Armor piece)
	CheatBunker:PowerArmorOption selectedArmor = getArmor() 
	ObjectReference arm = frame.PlaceAtMe(piece)
	applyMod(arm, selectedArmor.ArmLining)
	applyMaterial(arm)
	frame.AddItem(arm)
EndFunction

Function spawnArms(ObjectReference frame)
	CheatBunker:PowerArmorOption selectedArmor = getArmor()
	spawnArm(frame, selectedArmor.ArmLeft)
	spawnArm(frame, selectedArmor.ArmRight)
EndFunction

Function spawnLeg(ObjectReference frame, Armor piece)
	CheatBunker:PowerArmorOption selectedArmor = getArmor()
	ObjectReference leg = frame.PlaceAtMe(piece)
	applyMod(leg, selectedArmor.LegLining)
	applyMaterial(leg)
	frame.AddItem(leg)
EndFunction

Function spawnLegs(ObjectReference frame)
	CheatBunker:PowerArmorOption selectedArmor = getArmor()
	spawnLeg(frame, selectedArmor.LegLeft)
	spawnLeg(frame, selectedArmor.LegRight)
EndFunction

Function buildPieces(ObjectReference frame)
	spawnHelmet(frame)
	spawnTorso(frame)
	spawnArms(frame)
	spawnLegs(frame)
EndFunction

Function buildLogic()
	CheatBunker:PowerArmorOption selectedArmor = getArmor()
	ObjectReference frame = spawnFrame(selectedArmor.Frame)
	if (frame != None)
		buildPieces(frame)
		mSpawned.Show()
	endif
EndFunction
