Scriptname CheatBunker:Importer extends InjectTec:Integrator

Group Containers
    FormList Property ArmorClothing Auto Const
    FormList Property Chems Auto Const
    FormList Property Consumables Auto Const
    FormList Property Holotapes Auto Const
    FormList Property Misc Auto Const
    FormList Property PowerArmor Auto Const
    FormList Property WeaponsAmmo Auto Const
EndGroup

Chronicle:Package Property Provider Auto Const Mandatory

Chronicle:Package Function getProvider()
    return Provider
EndFunction

Function startBehavior()

    parent.startBehavior()
EndFunction

Function stopBehavior()

    parent.stopBehavior()
EndFunction

Function unrunBehavior()

    parent.unrunBehavior()
EndFunction
