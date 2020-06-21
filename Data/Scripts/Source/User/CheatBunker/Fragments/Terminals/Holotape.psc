;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:Holotape Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerTerminalWorkshopHandler.refreshStatus()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SimpleSettlementSolutions:Workshop:Handler:Player Property CheatBunkerTerminalWorkshopHandler Auto Const Mandatory
