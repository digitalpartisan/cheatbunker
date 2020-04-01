Scriptname CheatBunker:Dependencies:TerminalLists extends Quest Const

Group WeaponGenerators
    FormList Property CheatBunkerGeneratedWeaponsBallistic Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerGeneratedWeaponsBladed Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerGeneratedWeaponsBlunt Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerGeneratedWeaponsFist Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerGeneratedWeaponsHeavy Auto Const Mandatory
    {Autofill}
EndGroup

Group Munitions
    FormList Property CheatBunkerAmmoExplosives Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerAmmoHeavyWeapon Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerAmmoMisc Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerAmmoSmallArms Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerAmmoSyringer Auto Const Mandatory
    {Autofill}
EndGroup

Group Supplies
    FormList Property CheatBunkerSuppliesChems Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerSuppliesCurrency Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerSuppliesMedical Auto Const Mandatory
    {Autofill}
EndGroup

Group WorkshopResources
    FormList Property CheatBunkerCollectibleIngredients Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPlantables Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerShipmentList Auto Const Mandatory
    {Autofill}
EndGroup

FormList Property CheatBunkerCollectiblesList Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerArmorSets Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerCompanions Auto Const Mandatory
{Autofill}
FormList Property CheatBunkerPowerArmorOptions Auto Const Mandatory
{Autofill}

CheatBunker:Dependencies:TerminalLists Function getInstance() Global
	return Game.GetFormFromFile(0x0000313E, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:TerminalLists
EndFunction

Function addPaginationOptions(FormList target, FormList source)
    if (target && source)
        InjectTec:Utility:FormList.addFormList(target, source)
    endif
EndFunction

Function removePaginationOptions(FormList target, FormList source)
    if (target && source)
        InjectTec:Utility:FormList.removeFormList(target, source)
    endif
EndFunction

Function cleanPaginationOptions(FormList target)
    if (target)
        Jiffy:Utility:FormList.clean(target)
    endif
EndFunction
