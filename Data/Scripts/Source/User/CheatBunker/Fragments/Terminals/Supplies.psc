;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:Supplies Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, CurrencyPaginator, CurrencyData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, MedicalPaginator, MedicalData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, ChemsPaginator, ChemsData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().AddItem(FusionCore, iFusionCoresToGive)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().AddItem(BobbyPin, iBobbyPinsToGive)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Bottlecap Auto Const

Ammo Property FusionCore Auto Const

Int Property iFusionCoresToGive = 5 Auto Const

MiscObject Property BobbyPin Auto Const

Int Property iBobbyPinsToGive = 25 Auto Const

MiscObject Property PrewarMoney Auto Const

CheatBunker:TerminalGiveItem Property MedicalPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property MedicalData Auto Const

CheatBunker:TerminalGiveItem Property ChemsPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property ChemsData Auto Const

DynamicTerminal:PaginationProxy Property Proxy Auto Const

CheatBunker:TerminalGiveItemAmount Property CurrencyPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property CurrencyData Auto Const
