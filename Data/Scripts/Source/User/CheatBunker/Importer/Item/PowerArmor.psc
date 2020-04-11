Scriptname CheatBunker:Importer:Item:PowerArmor extends CheatBunker:Importer:Item

Import InjectTec:Utility:HexidecimalLogic

CheatBunker:PowerArmorOption:Imported Property TargetArmorSet Auto Const Mandatory

Group Parts
	DigitSet Property HelmetDigits Auto Const Mandatory
	DigitSet Property TorsoDigits Auto Const Mandatory
	DigitSet Property ArmLeftDigits Auto Const Mandatory
	DigitSet Property ArmRightDigits Auto Const Mandatory
	DigitSet Property LegLeftDigits Auto Const Mandatory
	DigitSet Property LegRightDigits Auto Const Mandatory
EndGroup

Group PartLevels
	DigitSet Property HelmetLiningDigits Auto Const
	DigitSet Property TorsoLiningDigits Auto Const
	DigitSet Property ArmLiningDigits Auto Const
	DigitSet Property LegLiningDigits Auto Const
EndGroup

Group ModLists
	DigitSet[] Property MaterialOptionDigits Auto Const
	DigitSet[] Property HeadlampModDigits Auto Const
	DigitSet[] Property HelmetModDigits Auto Const
	DigitSet[] Property TorsoModDigits Auto Const
	DigitSet[] Property ArmModDigits Auto Const
	DigitSet[] Property LegModDigits Auto Const
EndGroup

Armor helmetForm = None
Armor torsoForm = None
Armor armLeftForm = None
Armor armRightForm = None
Armor legLeftForm = None
Armor legRightForm = None

ObjectMod helmetLiningForm = None
ObjectMod torsoLiningForm = None
ObjectMod armLiningForm = None
ObjectMod legLiningForm = None

CheatBunker:PowerArmorOption:Imported Function getTargetArmorSet()
	return TargetArmorSet
EndFunction

Armor Function getHelmet()
	return helmetForm
EndFunction

Armor Function getTorso()
	return torsoForm
EndFunction

Armor Function getArmLeft()
	return armLeftForm
EndFunction

Armor Function getArmRight()
	return armRightForm
EndFunction

Armor Function getLegLeft()
	return legLeftForm
EndFunction

Armor Function getLegRight()
	return legRightForm
EndFunction

ObjectMod Function getHelmetLining()
	return helmetLiningForm
EndFunction

ObjectMod Function getTorsoLining()
	return torsoLiningForm
EndFunction

ObjectMod Function getArmLining()
	return armLiningForm
EndFunction

ObjectMod Function getLegLining()
	return legLiningForm
EndFunction

Function unloadBehavior()
	helmetForm = None
	torsoForm = None
	armLeftForm = None
	armRightForm = None
	legLeftForm = None
	legRightForm = None
	
	helmetLiningForm = None
	torsoLiningForm = None
	armLiningForm = None
	legLiningForm = None
	
	CheatBunker:PowerArmorOption:Imported armorSet = getTargetArmorSet()
	
	armorSet.MaterialOptions && armorSet.MaterialOptions.Revert()
	armorSet.HeadlampMods && armorSet.HeadlampMods.Revert()
	armorSet.HelmetMods && armorSet.HelmetMods.Revert()
	armorSet.TorsoMods && armorSet.TorsoMods.Revert()
	armorSet.ArmMods && armorSet.ArmMods.Revert()
	armorSet.LegMods && armorSet.LegMods.Revert()
EndFunction

Bool Function populateModList(DigitSet[] digits, FormList targetList)
	if (!digits || !digits.Length || !targetList)
		return true ; only return false if an explicit failure has occurred
	endif
	
	InjectTec:Plugin targetPlugin = getPlugin()
	targetList.Revert()
	InjectTec:Utility:FormList.addForms(targetList, targetPlugin.lookupArrayWithDigitSets(digits))
	
	return (digits.Length == targetList.GetSize())
EndFunction

Bool Function loadBehavior()
	if (!meetsPluginRequirements())
		return false
	endif
	
	InjectTec:Plugin targetPlugin = getPlugin()
	CheatBunker:PowerArmorOption:Imported armorSet = getTargetArmorSet()
	
	if (HelmetDigits)
		helmetForm = targetPlugin.lookupWithDigits(HelmetDigits) as Armor
		if (!helmetForm)
			return false
		endif
	endif
	if (TorsoDigits)
		torsoForm = targetPlugin.lookupWithDigits(TorsoDigits) as Armor
		if (!torsoForm)
			return false
		endif
	endif
	if (ArmLeftDigits)
		armLeftForm = targetPlugin.lookupWithDigits(ArmLeftDigits) as Armor
		if (!armLeftForm)
			return false
		endif
	endif
	if (ArmRightDigits)
		armRightForm = targetPlugin.lookupWithDigits(ArmRightDigits) as Armor
		if (!armRightForm)
			return false
		endif
	endif
	if (LegLeftDigits)
		legLeftForm = targetPlugin.lookupWithDigits(LegLeftDigits) as Armor
		if (!legLeftForm)
			return false
		endif
	endif
	if (LegRightDigits)
		legRightForm = targetPlugin.lookupWithDigits(LegRightDigits) as Armor
		if (!legRightForm)
			return false
		endif
	endif
	
	if (HelmetLiningDigits)
		helmetLiningForm = targetPlugin.lookupWithDigits(HelmetLiningDigits) as ObjectMod
		if (!helmetLiningForm)
			return false
		endif
	endif
	if (TorsoLiningDigits)
		torsoLiningForm = targetPlugin.lookupWithDigits(TorsoLiningDigits) as ObjectMod
		if (!torsoLiningForm)
			return false
		endif
	endif
	if (ArmLiningDigits)
		armLiningForm = targetPlugin.lookupWithDigits(ArmLiningDigits) as ObjectMod
		if (!armLiningForm)
			return false
		endif
	endif
	if (LegLiningDigits)
		legLiningForm = targetPlugin.lookupWithDigits(legLiningDigits) as ObjectMod
		if (!legLiningForm)
			return false
		endif
	endif
	
	if (!populateModList(MaterialOptionDigits, armorSet.MaterialOptions))
		return false
	endif
	if (!populateModList(HeadlampModDigits, armorSet.HeadlampMods))
		return false
	endif
	if (!populateModList(HelmetModDigits, armorSet.HelmetMods))
		return false
	endif
	if (!populateModList(TorsoModDigits, armorSet.TorsoMods))
		return false
	endif
	if (!populateModList(ArmModDigits, armorSet.ArmMods))
		return false
	endif
	if (!populateModList(LegModDigits, armorSet.LegMods))
		return false
	endif
	
	return true
EndFunction

Function addArmorWithMod(ObjectReference akContainerRef, Armor item, ObjectMod mod)
	if (!akContainerRef || !item)
		return
	endif

	ObjectReference piece = akContainerRef.PlaceAtMe(item)
	mod && piece.AttachMod(mod)
	akContainerRef.AddItem(piece)
EndFunction

Function addBehavior(ObjectReference akContainerRef)
	addArmorWithMod(akContainerRef, getHelmet(), getHelmetLining())
	addArmorWithMod(akContainerRef, getTorso(), getTorsoLining())
	addArmorWithMod(akContainerRef, getArmLeft(), getArmLining())
	addArmorWithMod(akContainerRef, getArmRight(), getArmLining())
	addArmorWithMod(akContainerRef, getLegLeft(), getLegLining())
	addArmorWithmod(akContainerRef, getLegRight(), getLegLining())
	
	CheatBunker:PowerArmorOption:Imported armorSet = getTargetArmorSet()
	addFormlist(akContainerRef, armorSet.MaterialOptions, 6)
	addFormList(akContainerRef, armorSet.HeadlampMods)
	addFormList(akContainerRef, armorSet.HelmetMods)
	addFormList(akContainerRef, armorSet.TorsoMods)
	addFormlist(akContainerRef, armorSet.ArmMods, 2)
	addFormList(akContainerRef, armorSet.LegMods, 2)
EndFunction
