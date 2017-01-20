;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CheatBunker:Fragments:Terminals:Diagnostics Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, PackagesPaginator, PackagesData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Proxy.init(akTerminalRef, ImporterPaginator, ImporterData)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DynamicTerminal:PaginationProxy Property Proxy Auto Const

CheatBunker:PackagesPaginator Property PackagesPaginator Auto Const

DynamicTerminal:ListWrapper Property PackagesData Auto Const

CheatBunker:ImportersPagination Property ImporterPaginator Auto Const

DynamicTerminal:ListWrapper Property ImporterData Auto Const
