;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:PackageDetails Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
SettingData.setData(PackageDiagnostics.getSettings())
SettingPaginator.init(akTerminalRef, SettingData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
PackageDiagnostics.draw(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
ImporterData.setData(PackageDiagnostics.getImporters())
ImporterPaginator.init(akTerminalRef, ImporterData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
PackageDiagnostics.draw(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CheatBunker:PackageDiagnostics Property PackageDiagnostics Auto Const

CheatBunker:Setting:Paginator Property SettingPaginator Auto Const

DynamicTerminal:ListWrapper:FormList:Dynamic Property SettingData Auto Const

InjectTec:Integrator:Paginator Property ImporterPaginator Auto Const

DynamicTerminal:ListWrapper:FormList:Dynamic Property ImporterData Auto Const
