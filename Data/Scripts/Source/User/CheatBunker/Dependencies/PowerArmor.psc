Scriptname CheatBunker:Dependencies:PowerArmor extends Quest Const

Group Raider
    FormList Property CheatBunkerPowerArmorMaterialsRaider Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsRaiderHeadlamp Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsRaiderHelmet Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsRaiderTorso Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsRaiderArm Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsRaiderLeg Auto Const Mandatory
    {Autofill}
EndGroup

Group T45
    FormList Property CheatBunkerPowerArmorMaterialsT45 Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT45Headlamp Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT45Helmet Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT45Torso Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT45Arm Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT45Leg Auto Const Mandatory
    {Autofill}
EndGroup

Group T51
    FormList Property CheatBunkerPowerArmorMaterialsT51 Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT51Headlamp Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT51Helmet Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT51Torso Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT51Arm Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT51Leg Auto Const Mandatory
    {Autofill}
EndGroup

Group T60
    FormList Property CheatBunkerPowerArmorMaterialsT60 Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT60Headlamp Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT60Helmet Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT60Torso Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT60Arm Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsT60Leg Auto Const Mandatory
    {Autofill}
EndGroup

Group X01
    FormList Property CheatBunkerPowerArmorMaterialsX01 Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsX01Headlamp Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsX01Helmet Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsX01Torso Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsX01Arm Auto Const Mandatory
    {Autofill}
    FormList Property CheatBunkerPowerArmorModsX01Leg Auto Const Mandatory
    {Autofill}
EndGroup

CheatBunker:Dependencies:PowerArmor Function getInstance() Global
	return Game.GetFormFromFile(0x00003958, CheatBunker:Dependencies.getPluginFilename()) as CheatBunker:Dependencies:PowerArmor
EndFunction

FormList Function getRaiderMaterials()
    return CheatBunkerPowerArmorMaterialsRaider
EndFunction

FormList Function getRaiderHeadlamps()
    return CheatBunkerPowerArmorModsRaiderHeadlamp
EndFunction

FormList Function getRaiderHelmets()
    return CheatBunkerPowerArmorModsRaiderHelmet
EndFunction

FormList Function getRaiderTorsos()
    return CheatBunkerPowerArmorModsRaiderTorso
EndFunction

FormList Function getRaiderArms()
    return CheatBunkerPowerArmorModsRaiderArm
EndFunction

FormList Function getRaiderLegs()
    return CheatBunkerPowerArmorModsRaiderLeg
EndFunction
