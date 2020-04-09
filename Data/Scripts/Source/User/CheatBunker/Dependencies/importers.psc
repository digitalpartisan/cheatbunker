Scriptname CheatBunker:Dependencies:Importers extends Quest

FormList Property CheatBunkerImporterContainerArmorClothingContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerConsumablesContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerHolotapesContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerMiscContents Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerImporterContainerWeaponsAmmoContents Auto Const Mandatory
{Autofill}

CheatBunker:Dependencies:Importers Function getInstance() Global
	return Game.GetFormFromFile(0x00003957, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:Importers
EndFunction

Function injection(FormList target, FormList source)
    if (target && source && source.GetSize())
        InjectTec:Utility:FormList.addFormList(target, source)
    endif
EndFunction

Function reversion(FormList target, FormList source)
    if (target && source && source.GetSize())
        InjectTec:Utility:FormList.removeFormList(target, source)
    endif
EndFunction

FormList Function getArmorClothingList()
    return CheatBunkerImporterContainerArmorClothingContents
EndFunction

FormList Function getConsumablesList()
    return CheatBunkerImporterContainerConsumablesContents
EndFunction

FormList Function getHolotapesList()
    return CheatBunkerImporterContainerHolotapesContents
EndFunction

FormList Function getMiscList()
    return CheatBunkerImporterContainerMiscContents
EndFunction

FormList Function getWeaponsAmmoList()
    return CheatBunkerImporterContainerWeaponsAmmoContents
EndFunction

Function injectArmorClothing(FormList source)
    injection(getArmorClothingList(), source)
EndFunction

Function injectConsumables(FormList source)
    injection(getConsumablesList(), source)
EndFunction

Function injectHolotapes(FormList source)
    injection(getHolotapesList(), source)
EndFunction

Function injectMisc(FormList source)
    injection(getMiscList(), source)
EndFunction

Function injectWeaponsAmmo(FormList source)
    injection(getWeaponsAmmoList(), source)
EndFunction

Function revertArmorClothing(FormList source)
    reversion(getArmorClothingList(), source)
EndFunction

Function revertConsumables(FormList source)
    reversion(getConsumablesList(), source)
EndFunction

Function revertHolotapes(FormList source)
    reversion(getHolotapesList(), source)
EndFunction

Function revertMiscList(FormList source)
    reversion(getMiscList(), source)
EndFunction

Function revertWeaponsAmmo(FormList source)
    reversion(getWeaponsAmmoList(), source)
EndFunction
