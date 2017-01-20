;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:CharacterDevelopment Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerDevelopmentQuest.invokePlayerKnowledge()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerDevelopmentQuest.revokePlayerKnowledge()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerDevelopmentQuest.maximizeSpecial()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
PaginationProxy.init(akTerminalRef, AutocompletionPaginator, AutocompletionData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:DevelopmentScript Property CheatBunkerDevelopmentQuest Auto Const

DynamicTerminal:PaginationProxy Property PaginationProxy Auto Const

CheatBunker:Autocompletion:Paginator Property AutocompletionPaginator Auto Const

DynamicTerminal:ListWrapper Property AutocompletionData Auto Const
