Scriptname CheatBunker:TerminalSpawnGeneratedItem extends DynamicTerminal:Paginator Conditional

Message Property mSpawned Auto Const
CheatBunker:QuestScript Property CheatBunkerQuest Auto Const

Function itemActivation(Int iItem, ObjectReference akTerminalRef)
	(getItem(iItem) as CheatBunker:ItemGenerator:Abstract).generate(CheatBunkerQuest.SpawnItemsContainer, true)
	mSpawned.Show()
EndFunction
