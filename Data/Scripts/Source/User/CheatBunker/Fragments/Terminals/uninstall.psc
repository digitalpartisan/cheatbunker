;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:uninstall Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuest.uninstall()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const
