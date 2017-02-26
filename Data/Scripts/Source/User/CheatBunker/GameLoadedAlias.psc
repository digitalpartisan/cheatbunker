Scriptname CheatBunker:GameLoadedAlias extends ReferenceAlias

CheatBunker:QuestScript Property CheatBunkerQuest Auto Const Mandatory

Event OnPlayerLoadGame()
	CheatBunkerQuest.loadGameHandler()
EndEvent
