Scriptname CheatBunker:CompanionDetails extends DynamicTerminal:Basic Conditional

Group HelperQuests
	CheatBunker:CompanionScript Property CheatBunkerCompanionQuest Auto Const
	CheatBunker:DevelopmentScript Property CheatBunkerDevelopmentQuest Auto Const
EndGroup

Group Messaging
	Message Property YesMessage Auto Const
	Message Property NoMessage Auto Const
EndGroup

CheatBunker:Companion myCompanion = None

Bool bHasPerk = false Conditional
Bool bRelationshipDamaged = false Conditional

CheatBunker:Companion Function getCompanion()
	return myCompanion
EndFunction

Bool Function setCheck()
	if (None == getCompanion())
		CheatBunker:Logger:Companion.nothingToProxy()
		return false
	endif

	return true
EndFunction

Function setCompanion(CheatBunker:Companion newValue)
	myCompanion = newValue
	updateConditionals()
EndFunction

Function updateConditionals()
	if (!setCheck())
		return
	endif

	CheatBunker:Companion thisCompanion = getCompanion()

	bHasPerk = thisCompanion.playerHasPerk()
	bRelationshipDamaged = CheatBunkerCompanionQuest.isRelationshipDamaged(thisCompanion)
EndFunction

Function getPerk(ObjectReference akTerminalRef)
	if (!setCheck())
		return
	endif

	CheatBunkerDevelopmentQuest.addPerk(getCompanion().getPerk())
	updateConditionals()
	draw(akTerminalRef)
EndFunction

Function repairRelationship(ObjectReference akTerminalRef)
	if (!setCheck())
		return
	endif

	CheatBunkerCompanionQuest.resetCompanionRelationship(getCompanion())
	updateConditionals()
	draw(aKTerminalRef)
EndFunction

Function progressRelationship(ObjectReference akTerminalRef)
	if (!setCheck())
		return
	endif

	CheatBunkerCompanionQuest.progressRelationship(getCompanion().getUnderlyingActor())
	updateConditionals()
	draw(akTerminalRef)
EndFunction

Function track()
	CheatBunkerCompanionQuest.setTrackingTarget(getCompanion().getUnderlyingActor())
EndFunction

Function moveToPlayer()
	setCheck() && CheatBunkerCompanionQuest.moveToPlayer(getCompanion().getUnderlyingActor())
EndFunction

Function tokenReplacementLogic()
	if (!setCheck())
		return
	endif
	
	updateConditionals()

	CheatBunker:Companion thisCompanion = getCompanion()	
	replace("CompanionActor", thisCompanion.abCompanion)
	replace("CompanionPerk", thisCompanion.getPerk())
	
	if (bHasPerk)
		replace("HavePerk", YesMessage)
	else
		replace("HavePerk", NoMessage)
	endif

	if (bRelationshipDamaged)
		replace("DamagedRelationship", YesMessage)
	else
		replace("DamagedRelationship", NoMessage)
	endif
EndFunction
