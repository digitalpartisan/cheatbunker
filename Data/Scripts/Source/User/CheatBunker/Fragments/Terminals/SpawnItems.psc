;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:SpawnItems Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, CollectiblePaginator, CollectibleData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:TerminalSpawnFormList Property CollectiblePaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property CollectibleData Auto Const

DynamicTerminal:PaginationProxy Property Proxy Auto Const
