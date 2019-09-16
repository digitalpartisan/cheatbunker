;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:Diagnostics Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
PackagesPaginator.init(akTerminalRef, PackagesData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
CheatBunkerEngineHandler.refreshStatus()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Chronicle:Package:Paginator Property PackagesPaginator Auto Const

Chronicle:Package:ListWrapper Property PackagesData Auto Const

Chronicle:Engine:Handler:Static Property CheatBunkerEngineHandler Auto Const
