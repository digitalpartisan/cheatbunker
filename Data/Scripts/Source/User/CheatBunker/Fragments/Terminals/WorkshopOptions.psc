;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:WorkshopOptions Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerTerminalWorkshopHandler.takeOwnership(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
WorkshopScript targetWorkshop = CheatBunkerTerminalWorkshopHandler.getWorkshop()
if (!targetWorkshop)
	return
endif
ObjectReference targetContainer = targetWorkshop.getContainer()
targetContainer.AddItem(CheatBunkerLLScrap, ScrapAmount)
targetContainer.AddItem(CheatBunkerLLWorkshopPlantable, PlantableAmount)
targetContainer.AddItem(CheatBunkerLLWorkshopWild, WildAmount)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SimpleSettlementSolutions:Workshop:Handler:Player Property CheatBunkerTerminalWorkshopHandler Auto Const Mandatory

LeveledItem Property CheatBunkerLLScrap Auto Const Mandatory

Int Property ScrapAmount = 1000 Auto Const

LeveledItem Property CheatBunkerLLWorkshopPlantable Auto Const Mandatory

Int Property PlantableAmount = 24 Auto Const

LeveledItem Property CheatBunkerLLWorkshopWild Auto Const Mandatory

Int Property WildAmount = 100 Auto Const
