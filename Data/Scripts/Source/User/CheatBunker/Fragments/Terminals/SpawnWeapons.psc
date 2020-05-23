;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:SpawnWeapons Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, BladedPaginator, BladedData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, BallisticPaginator, BallisticData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, BluntPaginator, BluntData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, FistPaginator, FistData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, HeavyPaginator, HeavyData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:TerminalSpawnGeneratedItem Property BallisticPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property BallisticData Auto Const

CheatBunker:TerminalSpawnGeneratedItem Property HeavyPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property HeavyData Auto Const

CheatBunker:TerminalSpawnGeneratedItem Property BladedPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property BladedData Auto Const

CheatBunker:TerminalSpawnGeneratedItem Property BluntPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property BluntData Auto Const

CheatBunker:TerminalSpawnGeneratedItem Property FistPaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property FistData Auto Const

DynamicTerminal:Paginator:Proxy Property Proxy Auto Const
