Scriptname CheatBunker:Importer:Container:Items extends CheatBunker:Importer:Container

Int Property AmountToAdd = 10 Auto Const Mandatory

Function addItem(Form itemToAdd)
    CheatBunker:Importer:Items items = itemToAdd as CheatBunker:Importer:Items
    if (items)
        ; TODO: figure this out in the items script
    endif
EndFunction
