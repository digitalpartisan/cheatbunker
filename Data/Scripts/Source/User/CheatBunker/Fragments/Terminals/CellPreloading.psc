;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:CellPreloading Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerTransitQuest.preloadCell(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerTransitQuest.preloadCell(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:TransitScript Property CheatBunkerTransitQuest Auto Const
