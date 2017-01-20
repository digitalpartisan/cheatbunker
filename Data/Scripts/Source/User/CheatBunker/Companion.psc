Scriptname CheatBunker:Companion extends Quest

ActorBase Property abCompanion Auto Const
{The actor used to display in terminals, etc.}
ActorBase Property abActualCompanion Auto Const
{Mainly because of Curie's actual actor (the one with all the scripts and data on it) doesn't like to display in terminals when her name is needed for some reason.}

Actor Function getUnderlyingActor()
{Gets the actor with information about things like}
	ActorBase abActorToUse = abCompanion
	if (abActualCompanion != None)
		abActorToUse = abActualCompanion
	endif
	
	return abActorToUse.getUniqueActor()
EndFunction

CompanionActorScript Function getCompanionActor()
	return getUnderlyingActor() as CompanionActorScript
EndFunction

Perk Function getPerk()
	CompanionActorScript companionScript = getUnderlyingActor() as CompanionActorScript
	if (companionScript == None)
		return None
	endif

	return companionScript.InfatuationPerk
EndFunction

Bool Function playerHasPerk()
	return Game.GetPlayer().HasPerk(getPerk())
EndFunction
