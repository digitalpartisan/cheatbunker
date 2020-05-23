Scriptname CheatBunker:Dependencies:Importers extends Quest

FormList Property CheatBunkerImporterContainerMiscContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerArmorAndClothingContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerFoodAndDrinkContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerMedicalAndChemsContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerHolotapesContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerPowerArmorContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerWeaponsAndAmmoContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerKnownPluginsList Auto Const Mandatory
{Autofill}

CheatBunker:Dependencies:Importers Function getInstance() Global
	return Game.GetFormFromFile(0x00003957, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:Importers
EndFunction

Function injection(FormList target, FormList source)
    if (!target || !source || !source.GetSize())
        return
    endif
	
	InjectTec:Utility:FormList.addFormList(target, source)
	
	Int iCounter = 0
	Int iSize = source.GetSize()
	CheatBunker:Importer:Item item = None
	while (iCounter < iSize)
		item = source.GetAt(iCounter) as CheatBunker:Importer:Item
		item && item.Start()
		iCounter += 1
	endWhile
EndFunction

Function reversion(FormList target, FormList source)
    if (!target || !source || !source.GetSize())
		return
    endif
	
	InjectTec:Utility:FormList.removeFormList(target, source)
	
	Int iCounter = 0
	Int iSize = source.GetSize()
	CheatBunker:Importer:Item item = None
	while (iCounter < iSize)
		item = source.GetAt(iCounter) as CheatBunker:Importer:Item
		item && item.Stop()
		iCounter += 1
	endWhile
EndFunction

FormList Function getMiscList()
    return CheatBunkerImporterContainerMiscContents
EndFunction

FormList Function getArmorAndClothingList()
    return CheatBunkerImporterContainerArmorAndClothingContents
EndFunction

FormList Function getFoodAndDrinkList()
    return CheatBunkerImporterContainerFoodAndDrinkContents
EndFunction

FormList Function getMedicalAndChemsList()
	return CheatBunkerImporterContainerMedicalAndChemsContents
EndFunction

FormList Function getHolotapesList()
    return CheatBunkerImporterContainerHolotapesContents
EndFunction

FormList Function getPowerArmorList()
	return CheatBunkerImporterContainerPowerArmorContents
EndFunction

FormList Function getWeaponsAndAmmoList()
    return CheatBunkerImporterContainerWeaponsAndAmmoContents
EndFunction

FormList Function getKnownPluginsList()
	return CheatBunkerKnownPluginsList
EndFunction

Function injectMisc(FormList miscList)
	injection(getMiscList(), miscList)
EndFunction

Function injectArmorAndClothing(FormList armorClothingList)
	injection(getArmorAndClothingList(), armorClothingList)
EndFunction

Function injectFoodAndDrink(FormList foodAndDrinkList)
	injection(getFoodAndDrinkList(), foodAndDrinkList)
EndFunction

Function injectMedicalAndChems(FormList medicalAndChemsList)
	injection(getMedicalAndChemsList(), medicalAndChemsList)
EndFunction

Function injectHolotapes(FormList holotapesList)
	injection(getHolotapesList(), holotapesList)
EndFunction

Function injectPowerArmor(FormList powerArmorList)
	injection(getPowerArmorList(), powerArmorList)
EndFunction

Function injectWeaponsAndAmmo(FormList weaponsAndAmmoList)
	injection(getWeaponsAndAmmoList(), weaponsAndAmmoList)
EndFunction

Function injectPlugins(InjectTec:Plugin[] plugins)
	InjectTec:Utility:FormList.addForms(getKnownPluginsList(), plugins as Form[])
EndFunction

Function revertMisc(FormList miscList)
	reversion(getMiscList(), miscList)
EndFunction

Function revertArmorAndClothing(FormList armorAndClothingList)
	reversion(getArmorAndClothingList(), armorAndClothingList)
EndFunction

Function revertFoodAndDrink(FormList foodAndDrinkList)
	reversion(getFoodAndDrinkList(), foodAndDrinkList)
EndFunction

Function revertMedicalAndChems(FormList medicalAndChemsList)
	reversion(getMedicalAndChemsList(), medicalAndChemsList)
EndFunction

Function revertHolotapes(FormList holotapesList)
	reversion(getHolotapesList(), holotapesList)
EndFunction

Function revertPowerArmor(FormList powerArmorList)
	reversion(getPowerArmorList(), powerArmorList)
EndFunction

Function revertWeaponsAndAmmo(FormList weaponsAndAmmoList)
	reversion(getWeaponsAndAmmoList(), weaponsAndAmmoList)
EndFunction

Function revertPlugins(InjectTec:Plugin[] plugins)
	InjectTec:Utility:FormList.removeForms(getKnownPluginsList(), plugins as Form[])
EndFunction

Function clean()
	Jiffy:BackgroundProcessor:FormListCleaner cleaner = CheatBunker:Dependencies:General.getInstance().getFormListCleaner()
	cleaner.clean(getMiscList())
	cleaner.clean(getArmorAndClothingList())
	cleaner.clean(getFoodAndDrinkList())
	cleaner.clean(getMedicalAndChemsList())
	cleaner.clean(getHolotapesList())
	cleaner.clean(getPowerArmorList())
	cleaner.clean(getWeaponsAndAmmoList())
	cleaner.clean(getKnownPluginsList())
EndFunction
