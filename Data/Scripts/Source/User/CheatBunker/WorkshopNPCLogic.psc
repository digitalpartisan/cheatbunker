Scriptname CheatBunker:WorkshopNPCLogic extends Quest Hidden

WorkshopParentScript Property WorkshopParent Auto Const Mandatory
CheatBunker:WorkshopNPCSpawnState Property CheatBunkerWorkshopTerminalSpawnNPCState Auto Const Mandatory

WorkshopScript Function getWorkshopRef()
{Syntactical sugar.}
	return CheatBunkerWorkshopTerminalSpawnNPCState.getWorkshopRef()
EndFunction

Function addToSettlement(Actor actorRef)
	WorkshopParent.AddActorToWorkshop(actorRef as WorkshopNPCScript, getWorkshopRef())
EndFunction

Actor Function spawnActor(ActorBase actorToSpawn, ObjectReference spawnLocation)
	return spawnLocation.PlaceAtMe(actorToSpawn, abDeleteWhenAble = false) as Actor
EndFunction

ObjectReference Function getSpawnLocation()
{Override in child scripts to alter this behavior.}
	return Game.GetPlayer() as ObjectReference
EndFunction

ActorBase Function getBaseActor()
{Override in child scripts to specify which ActorBase is used to spawn the NPC.}
	CheatBunker:Logger.logBehaviorUndefined(self, "getBaseActor()")
EndFunction

Function postSpawnBehavior(Actor actorRef)
{Override in child scripts to intercept the actor prior to being assigned to a particular workshop.}
EndFunction

Function postSettlementBehavior(Actor actorRef)
{Override in child scripts to intercept the actor after it has been assigned to a particular workshop.}
EndFunction

Function run()
	if (!CheatBunkerWorkshopTerminalSpawnNPCState.isReady())
		return
	endif
	
	Actor newActor = spawnActor(getBaseActor(), getSpawnLocation())
	postSpawnBehavior(newActor)
	addToSettlement(newActor)
	postSettlementBehavior(newActor)
EndFunction
