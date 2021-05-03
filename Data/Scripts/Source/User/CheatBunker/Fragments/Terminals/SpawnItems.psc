;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:SpawnItems Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, CollectiblePaginator, CollectibleData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerCollectibleTrackerPackagePaginator.init(akTerminalRef, PackageData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:TerminalSpawnFormList Property CollectiblePaginator Auto Const

DynamicTerminal:ListWrapper:FormList Property CollectibleData Auto Const

DynamicTerminal:Paginator:Proxy Property Proxy Auto Const

CheatBunker:CollectibleTracker:PackagePaginator Property CheatBunkerCollectibleTrackerPackagePaginator Auto Const Mandatory

Chronicle:Package:ListWrapper Property PackageData Auto Const Mandatory
