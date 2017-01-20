Scriptname CheatBunker:TerminalSpawnGeneratedItem extends DynamicTerminal:Paginator Conditional

Message Property mSpawned Auto Const
CheatBunker:QuestScript Property CheatBunkerQuest Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	(getItem(iItem) as CheatBunker:ItemGenerator).generate(CheatBunkerQuest.SpawnWeaponMarker)
	mSpawned.Show()
EndFunction
