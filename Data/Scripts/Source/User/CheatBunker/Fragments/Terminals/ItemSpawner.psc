;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:ItemSpawner Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuestControlItemSpawner.initializeState(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
PluginPaginator.setTerminalLogic(CheatBunkerQuestControlItemSpawner)
PluginPaginator.init(akTerminalRef, PluginData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuestControlTerminalLogicProxy.proxyTerminalLogic(CheatBunkerQuestControlItemSpawner)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuestControlTerminalLogicProxy.proxyTerminalLogic(CheatBunkerQuestControlItemSpawner)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuestControlItemSpawner.loadForm(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuestControlItemSpawner.resetFormID(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuestControlItemSpawner.resetQuantity(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerQuestControlItemSpawner.spawn(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:QuestControl:DigitalInput:Terminal:Proxy Property CheatBunkerQuestControlTerminalLogicProxy Auto Const Mandatory

CheatBunker:ItemSpawner Property CheatBunkerQuestControlItemSpawner Auto Const Mandatory

CheatBunker:QuestControl:PluginPaginator Property PluginPaginator Auto Const Mandatory

InjectTec:Plugin:ListWrapper Property PluginData Auto Const Mandatory
