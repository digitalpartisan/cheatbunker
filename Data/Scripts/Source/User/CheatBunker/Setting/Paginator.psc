Scriptname CheatBunker:Setting:Paginator extends DynamicTerminal:Paginator Conditional

CheatBunker:Setting:Diagnostics Property CheatBunkerSettingDiagnostics Auto Const Mandatory
{Autofill}

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
    CheatBunkerSettingDiagnostics.setSetting(getItem(iItem) as CheatBunker:Setting, akTerminalRef)
EndFunction
