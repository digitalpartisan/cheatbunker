Scriptname CheatBunker:DevelopmentScript extends Quest Conditional

Group SPECIALValues
	ActorValue Property Strength Auto Const
	ActorValue Property Perception Auto Const
	ActorValue Property Endurance Auto Const
	ActorValue Property Charisma Auto Const
	ActorValue Property Intelligence Auto Const
	ActorValue Property Agility Auto Const
	ActorValue Property Luck Auto Const
	
	Int Property iMaxSpecialValue = 10 Auto Const
	Message Property CheatBunkerSpecialMaximizedMessage Auto Const
EndGroup

Group PlayerKnowledge
	Perk Property PlayerKnowledge Auto Const
	Message Property PlayerKnowledgeMessage Auto Const
	Message Property PlayerKnowledgeRemovedMessage Auto Const
EndGroup

Function addLevels(Int iNumber = 1, Message ConfirmMessage = None)
	if (iNumber < 0)
		return
	endif
	
	Int iCurrentLevel = Game.GetPlayerLevel()
	Int iIntendedLevel = iCurrentLevel + iNumber
	
	Int iCurrentXP = Game.GetXPForLevel(iCurrentLevel)
	Int iNeededXP = Game.GetXPForLevel(iIntendedLevel)
	Int iAwardXP = iNeededXP - iCurrentXP
	
	Game.RewardPlayerXP(iAwardXP, true)

	if (ConfirmMessage != None)
		ConfirmMessage.Show()
	endif
EndFunction

Function addPerkPoints(Int iNumber = 1, Message SuccessMessage = None)
	if (iNumber < 0)
		return
	endif
	
	Game.AddPerkPoints(iNumber)
	
	if (SuccessMessage != None)
		SuccessMessage.Show()
	endif
EndFunction

Bool Function addPerk(Perk pPerk, Message SuccessMessage = None)
	Actor aPlayer = Game.GetPlayer()
	if (aPlayer.HasPerk(pPerk))
		return false
	else
		aPlayer.AddPerk(pPerk)
		if (SuccessMessage != None)
			SuccessMessage.Show()
		endif
		return true
	endif
EndFunction

Bool Function removePerk(Perk pPerk, Message SuccessMessage = None)
	Actor aPlayer = Game.GetPlayer()
	if (aPlayer.HasPerk(pPerk))
		aPlayer.RemovePerk(pPerk)
		if (SuccessMessage != None)
			SuccessMessage.Show()
		endif
		return true
	else
		return false
	endif
EndFunction

Function invokePlayerKnowledge()
	addPerk(PlayerKnowledge, PlayerKnowledgeMessage)
EndFunction

Function revokePlayerKnowledge()
	removePerk(PlayerKnowledge, PlayerKnowledgeRemovedMessage)
EndFunction

Function maximizeValue(ActorValue avAttribute)
	Actor aPlayer = Game.GetPlayer()
	if (aPlayer.GetBaseValue(avAttribute) < iMaxSpecialValue)
		aPlayer.SetValue(avAttribute, iMaxSpecialValue)
	endif
EndFunction

Function maximizeSpecial()
	maximizeValue(Strength)
	maximizeValue(Perception)
	maximizeValue(Endurance)
	maximizeValue(Charisma)
	maximizeValue(Intelligence)
	maximizeValue(Agility)
	maximizeValue(Luck)

	CheatBunkerSpecialMaximizedMessage.Show()
EndFunction

Event OnQuestInit()
	Debug.Trace("[CheatBunker][DevelopmentQuest] starting up")
EndEvent

Event OnQuestShutdown()
	Debug.Trace("[CheatBunker][DevelopmentQuest] shutting down")
EndEvent
