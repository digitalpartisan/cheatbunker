;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Quests:Transit Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE CheatBunker:TransitScript
Quest __temp = self as Quest
CheatBunker:TransitScript kmyQuest = __temp as CheatBunker:TransitScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.transitToInterior()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE CheatBunker:TransitScript
Quest __temp = self as Quest
CheatBunker:TransitScript kmyQuest = __temp as CheatBunker:TransitScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.transitToFastTravel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE CheatBunker:TransitScript
Quest __temp = self as Quest
CheatBunker:TransitScript kmyQuest = __temp as CheatBunker:TransitScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.recoverCompanions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE CheatBunker:TransitScript
Quest __temp = self as Quest
CheatBunker:TransitScript kmyQuest = __temp as CheatBunker:TransitScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.initiateSnapback()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE CheatBunker:TransitScript
Quest __temp = self as Quest
CheatBunker:TransitScript kmyQuest = __temp as CheatBunker:TransitScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.completeSnapback()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE CheatBunker:TransitScript
Quest __temp = self as Quest
CheatBunker:TransitScript kmyQuest = __temp as CheatBunker:TransitScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.cancelSnapback()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
