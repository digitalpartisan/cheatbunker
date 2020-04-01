Scriptname CheatBunker:Importer:Container:PowerArmor extends CheatBunker:Importer:Container

Function addItem(Form itemToAdd)
    CheatBunker:PowerArmorOption:Abstract powerArmorOption = itemToAdd as CheatBunker:PowerArmorOption:Abstract
    if (!powerArmorOption)
        return
    endif

    AddItem(powerArmorOption.getHelmet())
    AddItem(powerArmorOption.getTorso())
    AddItem(powerArmorOption.getArmLeft())
    AddItem(powerArmorOption.getArmRight())
    AddItem(powerArmorOption.getLegLeft())
    AddItem(powerArmorOption.getLegRight())


EndFunction
