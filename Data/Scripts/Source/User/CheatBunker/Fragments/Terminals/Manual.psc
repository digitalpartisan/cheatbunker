;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:Manual Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if (!CheatBunkerIntroQuest.isCompleted())
	CheatBunkerIntroQuest.CompleteAllObjectives()
	CheatBunkerIntroQuest.CompleteQuest()
	CheatBunkerQuest.giveHolotape()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuest.giveHolotape()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CheatBunkerIntroQuest Auto Const

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const
