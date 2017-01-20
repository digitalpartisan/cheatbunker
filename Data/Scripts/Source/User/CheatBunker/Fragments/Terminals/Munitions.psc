;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:Munitions Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, SmallArmsPaginator, SmallArmsData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, HeavyWeaponsPaginator, HeavyWeaponsData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, ExplosivesPaginator, ExplosivesData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, MiscPaginator, MiscData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, SyringerPaginator, SyringerData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:TerminalGiveItemAmount Property SmallArmsPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property SmallArmsData Auto Const

CheatBunker:TerminalGiveItemAmount Property HeavyWeaponsPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property HeavyWeaponsData Auto Const

CheatBunker:TerminalGiveItem Property ExplosivesPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property ExplosivesData Auto Const

CheatBunker:TerminalGiveItem Property MiscPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property MiscData Auto Const

CheatBunker:TerminalGiveItem Property SyringerPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property SyringerData Auto Const

DynamicTerminal:PaginationProxy Property Proxy Auto Const
