;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:CharDevAddPerkPoints Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerDevelopmentQuest.addPerkPoints(iOneAmount, mOneMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerDevelopmentQuest.addPerkPoints(iFiveAmount, mFiveMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerDevelopmentQuest.addPerkPoints(iTenAmount, mTenMessage)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:DevelopmentScript Property CheatBunkerDevelopmentQuest Auto Const

Message Property mOneMessage Auto Const

Message Property mFiveMessage Auto Const

Message Property mTenMessage Auto Const

Int Property iOneAmount = 1 Auto Const

Int Property iFiveAmount = 5 Auto Const

Int Property iTenAmount = 10 Auto Const
