scriptname CheatBunker:CollectibleTracker:Quest:GunsAndBullets extends CheatBunker:CollectibleTracker:Quest

quest property DN130 Auto Const Mandatory
{autofill}
referencealias property MagazineAlias Auto Const Mandatory
referencealias property Issue08 Auto Const Mandatory
{autofill}

function watchForMagazineSpawn()
	RegisterForRemoteEvent(DN130, "OnStageSet")
	RegisterForRemoteEvent(MagazineAlias, "OnAliasInit")
endfunction

function stopWatchingForMagazineSpawn()
	UnregisterForRemoteEvent(DN130, "OnStageSet")
	UnregisterForRemoteEvent(MagazineAlias, "OnAliasInit")
endfunction

function checkMagazineAliasStatus()
	objectreference magazine = MagazineAlias.GetReference()
	if (!magazine)
		return
	endif

	Issue08.ForceRefTo(magazine)
	stopWatchingForMagazineSpawn()
endfunction

event quest.OnStageSet(quest sender, int stageID, int itemID)
	DN130 == sender && checkMagazineAliasStatus()
endevent

event alias.OnAliasInit(alias sender)
	MagazineAlias == sender && checkMagazineAliasStatus()
endevent

event OnQuestInit()
	watchForMagazineSpawn()
	checkMagazineAliasStatus()
endevent

event OnQuestShutdown()
	stopWatchingForMagazineSpawn()
endevent
