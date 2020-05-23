Scriptname CheatBunker:Importer extends InjectTec:Integrator:BehaviorOmnibus

Group Contents
	FormList Property Misc Auto Const
    FormList Property ArmorAndClothing Auto Const
	FormList Property FoodAndDrink Auto Const
    FormList Property MedicalAndChems Auto Const
    FormList Property Holotapes Auto Const
    FormList Property PowerArmor Auto Const
    FormList Property WeaponsAndAmmo Auto Const
	CheatBunker:Worldspace[] Property Worldspaces Auto Const
EndGroup

Chronicle:Package Property Provider Auto Const Mandatory

Chronicle:Package Function getProvider()
    return Provider
EndFunction

FormList Function getMisc()
	return Misc
EndFunction

FormList Function getArmorAndClothing()
	return ArmorAndClothing
EndFunction

FormList Function getFoodAndDrink()
	return FoodAndDrink
EndFunction

FormList Function getMedicalAndChems()
	return MedicalAndChems
EndFunction

FormList Function getHolotapes()
	return Holotapes
EndFunction

FormList Function getPowerArmor()
	return PowerArmor
EndFunction

FormList Function getWeaponsAndAmmo()
	return WeaponsAndAmmo
EndFunction

Function importBehavior()
	CheatBunker:Dependencies:Importers importerLogic = CheatBunker:Dependencies:Importers.getInstance()
	
	importerLogic.injectMisc(getMisc())
	importerLogic.injectArmorAndClothing(getArmorAndClothing())
	importerLogic.injectFoodAndDrink(getFoodAndDrink())
	importerLogic.injectMedicalAndChems(getMedicalAndChems())
	importerLogic.injectHolotapes(getHolotapes())
	importerLogic.injectPowerArmor(getPowerArmor())
	importerLogic.injectWeaponsAndAmmo(getWeaponsAndAmmo())
	importerLogic.injectPlugins(getPlugins())
	
	CheatBunker:Worldspace.startBulk(Worldspaces)
EndFunction

Function deportBehavior()
	CheatBunker:Dependencies:Importers importerLogic = CheatBunker:Dependencies:Importers.getInstance()
	
	importerLogic.revertMisc(getMisc())
	importerLogic.revertArmorAndClothing(getArmorAndClothing())
	importerLogic.revertFoodAndDrink(getFoodAndDrink())
	importerLogic.revertMedicalAndChems(getMedicalAndChems())
	importerLogic.revertHolotapes(getHolotapes())
	importerLogic.revertPowerArmor(getPowerArmor())
	importerLogic.revertWeaponsAndAmmo(getWeaponsAndAmmo())
	importerLogic.revertPlugins(getPlugins())
	
	CheatBunker:Worldspace.stopBulk(Worldspaces)
EndFunction

Function startBehavior()
    parent.startBehavior()
	importBehavior()
EndFunction

Function stopBehavior()
    parent.stopBehavior()
	deportBehavior()
EndFunction

Function unrunBehavior()
    parent.unrunBehavior()
	deportBehavior()
	CheatBunker:Dependencies:Importers.getInstance().clean()
EndFunction
