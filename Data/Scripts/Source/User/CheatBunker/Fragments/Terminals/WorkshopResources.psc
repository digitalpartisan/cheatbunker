;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:WorkshopResources Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, ShipmentsPaginator, ShipmentsData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, PlantablesPaginator, PlantablesData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:TerminalGiveAll Property ShipmentsPaginator Auto Const

DynamicTerminal:ListWrapper Property ShipmentsData Auto Const

CheatBunker:TerminalGiveAll Property PlantablesPaginator Auto Const

DynamicTerminal:ListWrapper Property PlantablesData Auto Const

DynamicTerminal:PaginationProxy Property Proxy Auto Const
