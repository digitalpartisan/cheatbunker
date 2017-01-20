;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Quests:Main Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE CheatBunker:QuestScript
Quest __temp = self as Quest
CheatBunker:QuestScript kmyQuest = __temp as CheatBunker:QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Init()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
